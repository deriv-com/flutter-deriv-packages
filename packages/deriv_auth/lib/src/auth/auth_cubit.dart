import 'dart:developer' as logger;

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:deriv_auth/src/repo/auth_repo/i_auth_repo.dart.dart';
import 'package:deriv_auth/src/repo/base_storage.dart';
import 'package:equatable/equatable.dart';

import '../core/constants/constants.dart';
import '../core/helpers/account_helpers.dart';
import '../models/account/account.dart';
import 'auth_error.dart';
import 'models/authorize.dart';

part 'auth_state.dart';

/// This class handles the business logic related to Authenticating a user.
class AuthCubit extends Cubit<AuthState> {
  /// Initializes the cubit with an initial state of `AuthInitial`.
  AuthCubit(
      {required this.secureStorage,
      required this.repo,
      required this.onReloadAccounts,
      required})
      : super(const AuthInitialState());
  final IAuthRepo repo;

  /// Secure storage for retrieving/storing secure data.
  final BaseSecureStorage secureStorage;

  final Function onReloadAccounts;

  /// Gets the authorized account.
  AuthorizeEntity? get authorizedAccount => state is AuthLoggedInState
      ? (state as AuthLoggedInState).authorizedAccount
      : null;

  /// Performs user log in event.
  ///
  /// It takes an optional [accounts] list that is usually sent when the user

  /// enters the login credentials on the basic login page.
  /// It also take an optional boolean called [reloadAccounts] which is false
  /// by default and indicates whether all accounts should get fetched and
  /// subscribed after login. It is mostly used when the user creates a new
  /// real account and calls login with the newly created account.
  ///
  /// This function first tries to get user accounts from secure storage if
  /// available;
  /// 1- When there are no saved user accounts locally and the optional [accounts]
  /// list if empty, the function emits [AuthLoggedOutState] state.
  /// 2- When there are saved accounts locally and the optional [accounts] is
  /// empty, the function tries to fetch these accounts and authorize the user's
  /// token. And based on the results of authorization, it emits [AuthLoggedInState],
  /// [AuthLoggedOutState], or [AuthErrorState].
  /// 3- When the optional [accounts] list passed is not empty, it is usually an
  /// indication of a new log in, hence, the function does user authorization
  /// as explained in point 2.
  ///
  /// [refreshToken] : This token is different from [accounts] token and all
  /// sibling [accounts] have the same [refreshToken] which comes from login or
  /// signup responses in the login/sign up process.
  /// So we can't replace [refreshToken] with [accounts] token.
  Future<void> login({
    List<AccountModel>? accounts,
    String? refreshToken,
    bool reloadAccounts = false,
    String? signupProvider,
    Function? analyticsCallback,
    Function? onLogin,
    Function? onRefreshToken,
    Function? setFeedbackReminderFlag,
    Function? onSendSignupEvent,
  }) async {
    final List<AccountModel> storedAccounts = await secureStorage.userAccounts;

    if (storedAccounts.isEmpty && accounts == null && refreshToken == null) {
      emit(const AuthLoggedOutState());
    } else if (accounts == null) {
      final String? defaultAccount = await secureStorage.defaultAccount;

      await _fetchStoredAccounts(
        storedAccounts: storedAccounts,
        defaultAccount: defaultAccount,
      );
    } else {
      await _parseAndAuthorizeAccount(
        accounts: accounts,
        reloadAccounts: reloadAccounts,
        refreshToken: refreshToken,
        signupProvider: signupProvider,
        onLogin: onLogin,
        onRefreshToken: onRefreshToken,
        onSendSignupEvent: onSendSignupEvent,
      );
    }
  }

  /// Performs user log out event.
  ///
  /// It calls a log out api request and clears local storage. This function
  /// emits [AuthLoggedOutState] state.
  Future<void> logout({
    String? logoutReason,
    bool isForcedLogout = false,
  }) async {
    emit(const AuthLoggingOutState());

    if (!isForcedLogout) {
      await repo.logout();
    }

    try {
      /// function to initialize And Get Notifications Cubit
      /// remove FCM token
      /// Reset notifications DB
      /// log logout onto Analytics
      await repo.cleanUpUserData();

      await secureStorage.clearAllData();

      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      logger.log('$AuthCubit logout() error: $e');
    }

    emit(AuthLoggedOutState(reason: logoutReason));
  }

  /// Performs authorization request for new account with [token] value.
  ///
  /// Emits [AuthLoggedInState] if the authorize request is successful
  /// and emits [AuthErrorState] in case any error takes place in the process.
  Future<void> authorizeNewAccount({
    String? token,
    required List<AccountModel> userAccounts,
    Function? onAuthorizeNewAccount,
  }) async {
    try {
      emit(const AuthInitialState());

      await _performAuthorization(
        token: token,
        onSuccess: (AuthorizeEntity authorize) async {
          final List<AccountModel> supportedAccounts = userAccounts;

          final int index = supportedAccounts.indexWhere(
            (AccountModel account) => account.accountId == authorize.loginid,
          );

          final AccountModel defaultUserAccount = _setDefaultAccount(
            supportedAccounts: supportedAccounts,
            index: index,
          );

          // adding disabled accounts to the list.
          for (final AccountListItem accountModel in authorize.accountList!) {
            if (accountModel.isDisabled! &&
                _isAccountModelValid(accountModel)) {
              supportedAccounts
                  .firstWhereOrNull(
                    (AccountModel element) =>
                        element.accountId == accountModel.loginid &&
                        element.isDisabled == false,
                  )
                  ?.isDisabled = true;
            }
          }

          onAuthorizeNewAccount?.call();

          await secureStorage.addAccounts(supportedAccounts);
          await secureStorage.setDefaultAccount(defaultUserAccount.accountId);
          await secureStorage.setDefaultUserId(userId: '${authorize.userId}');

          emit(AuthLoggedInState(authorizedAccount: authorize));
        },
        onError: () => emit(
          const AuthErrorState(authError: AuthErrorType.switchAccountError),
        ),
      );
    } on Exception catch (error) {
      logger.log('$AuthCubit MultipliersException: $error');

      emit(AuthErrorState(errorMessage: '$error'));
    }
  }

  /// Called when auth error occurs.
  void onAuthError({
    required String? errorMessage,
    required AuthErrorType errorType,
  }) =>
      emit(AuthErrorState(errorMessage: errorMessage, authError: errorType));

  Future<void> _fetchStoredAccounts({
    required List<AccountModel> storedAccounts,
    required String? defaultAccount,
    Function? onLogin,
  }) async {
    try {
      // Get the account token of the default account from the list of stored
      // accounts in secure storage
      final AccountModel account = storedAccounts.lastWhere(
        (AccountModel account) => account.accountId == defaultAccount,
      );

      // Authorize the fetch user token retrieved from secure storage
      await _performAuthorization(
        token: account.token,
        onSuccess: (AuthorizeEntity authorize) async {
          final int? userId = authorize.userId;

          onLogin?.call();

          await secureStorage.setDefaultUserId(userId: '$userId');

          emit(AuthLoggedInState(authorizedAccount: authorize));
        },
        onError: () => emit(const AuthLoggedOutState()),
      );
    } on Exception catch (error) {
      logger.log('$AuthCubit MultipliersException: $error');

      emit(AuthErrorState(errorMessage: '$error'));
    }
  }

  Future<void> _parseAndAuthorizeAccount({
    required List<AccountModel> accounts,
    required String? refreshToken,
    bool reloadAccounts = false,
    String? signupProvider,
    Function? onLogin,
    Function? onRefreshToken,
    Function? onSendSignupEvent,
  }) async {
    emit(const AuthInitialState());

    final List<AccountModel> supportedAccounts = accounts
        .where((AccountModel account) => _isAccountValid(account))
        .toList();

    if (supportedAccounts.isNotEmpty) {
      // Choose the default account.
      final AccountModel defaultUserAccount = _setDefaultAccount(
        supportedAccounts: supportedAccounts,
        index: reloadAccounts ? supportedAccounts.length - 1 : null,
      );

      await _performAuthorization(
          token: defaultUserAccount.token,
          onSuccess: (AuthorizeEntity authorize) async {
            // Successful login.

            final String? userEmail = authorize.email;
            final String? fullName = authorize.fullname;
            final int? userId = authorize.userId;

            await repo.initAnalyticsAndRegisterFCMToken(userId);

            // Add user email and full name to account data before saving it.
            for (final AccountModel account in supportedAccounts) {
              account
                ..email = userEmail
                ..fullName = fullName
                ..userId = userId
                ..currency = _getAccountCurrencyFromAuthorize(
                  loginId: account.accountId,
                  accounts: authorize.accountList!,
                );
            }

            // adding disabled accounts to the list.
            for (final AccountListItem accountModel in authorize.accountList!) {
              if (accountModel.isDisabled! &&
                  _isAccountModelValid(accountModel)) {
                supportedAccounts.add(
                  AccountModel(
                    accountId: accountModel.loginid!,
                    currency: accountModel.currency,
                    isDisabled: true,
                  ),
                );
              }
            }

            // Sort accounts based on the [currenciesDisplayOrder].
            supportedAccounts.sort(
              (AccountModel account, AccountModel other) =>
                  _compareAccountCurrencyDisplayOrder(
                authorize: authorize,
                account: account,
                other: other,
              ),
            );

            // Store supported accounts, set a default user by email and a default
            // user id, and set a default account for the user.
            onLogin?.call();

            await secureStorage.addAccounts(supportedAccounts);
            await secureStorage.setDefaultUser(userEmail);
            await secureStorage.setDefaultAccount(
              defaultUserAccount.accountId,
            );
            await secureStorage.setDefaultUserId(
              userId: '${authorize.userId}',
            );

            if (refreshToken != null) {
              onRefreshToken?.call();

              await secureStorage.setRefreshToken(refreshToken);
            }

            await repo.setFeedbackReminderFlag();

            if (reloadAccounts) {
              onReloadAccounts.call();
            }
            if (signupProvider != null && _canSendSignupDoneEvent(accounts)) {
              final vrAccount = getVRAccount(accounts);
              await repo.onSendSignupEvent(
                signUpProvider: signupProvider,
                binaryUserId: '${authorize.userId ?? " "}',
                loginId: vrAccount!.accountId,
              );
            }
            emit(AuthLoggedInState(authorizedAccount: authorize));
          },
          onError: () => emit(const AuthLoggedOutState()));
    } else {
      logger.log('$AuthCubit: The account is not supported.');

      emit(
        const AuthErrorState(
          errorMessage: 'This service is not available in your country.',
          authError: AuthErrorType.unsupportedCountry,
        ),
      );
    }
  }

  Future<void> _performAuthorization({
    required String? token,
    Function(AuthorizeEntity)? onSuccess,
    Function()? onError,
  }) async {
    try {
      final AuthorizeResponseEntity? authorize = await _authorizeAccount(token);

      if (authorize == null) {
        emit(
          const AuthErrorState(
            errorMessage: 'Token is expired',
            authError: AuthErrorType.expiredAccount,
          ),
        );
      } else if (!_isSvgAccount(authorize.authorize!)) {
        await logout(logoutReason: 'Unsupported Country');

        emit(
          const AuthErrorState(
            errorMessage: 'This service is not available in your country.',
            authError: AuthErrorType.unsupportedCountry,
          ),
        );
      } else {
        onSuccess?.call(authorize.authorize!);
      }
    } on Exception catch (error) {
      ///
      // handling the situation when user clicked on an account that is recently disabled.
      // each time we switch to an account the state of all accounts get updated from the Authorize response.

      final errorMessage = error.toString();

      if (errorMessage.contains('AccountDisabled')) {
        await logout(isForcedLogout: true);
      } else {
        emit(
          AuthErrorState(
            errorMessage: '$error',
            authError: errorMessage.contains('InvalidToken')
                ? AuthErrorType.expiredAccount
                : AuthErrorType.failedAuthorization,
          ),
        );
      }
    }
  }

  Future<AuthorizeResponseEntity?> _authorizeAccount(String? token) async =>
      await repo.authorize(token);

  // AuthorizeResponse.authorizeMethod(AuthorizeRequest(authorize: token));

  AccountModel _setDefaultAccount({
    required List<AccountModel> supportedAccounts,
    int? index,
  }) {
    for (final AccountModel account in supportedAccounts) {
      if (account.accountId.toUpperCase().contains('CR') && index != null) {
        return supportedAccounts[index];
      }
    }

    return supportedAccounts.first;
  }

  bool _isAccountValid(AccountModel account) =>
      account.accountId.toUpperCase().contains('CR') ||
      account.accountId.toUpperCase().contains('VRTC');

  bool _isAccountModelValid(AccountListItem account) =>
      account.loginid!.toUpperCase().contains('CR') ||
      account.loginid!.toUpperCase().contains('VRTC');

  bool _canSendSignupDoneEvent(List<AccountModel>? accounts) =>
      accounts != null && accounts.isNotEmpty && hasVRAccount(accounts);

  bool _isSvgAccount(AuthorizeEntity authorize) {
    const String svgLandingCompanyName = 'svg';

    final bool isLandingCompanySvg =
        authorize.landingCompanyName == svgLandingCompanyName;
    final bool isUpgradeableLandingCompanySvg =
        authorize.upgradeableLandingCompanies?.any((dynamic landingCompany) =>
                landingCompany == svgLandingCompanyName) ??
            false;
    final bool hasSvgCompanies = authorize.accountList?.any(
            (AccountListItem? account) =>
                account?.landingCompanyName == svgLandingCompanyName) ??
        false;

    return isLandingCompanySvg ||
        isUpgradeableLandingCompanySvg ||
        hasSvgCompanies;
  }

  int _compareAccountCurrencyDisplayOrder({
    required AuthorizeEntity authorize,
    required AccountModel account,
    required AccountModel other,
  }) {
    // put demo account at the end of the list.
    if (isVRAccount(account)) {
      return 1;
    }

    if (isVRAccount(other)) {
      return -1;
    }

    final AccountListItem? firstAccount =
        authorize.accountList!.firstWhereOrNull(
      (AccountListItem? element) => element!.loginid == account.accountId,
    );

    final AccountListItem? otherAccount =
        authorize.accountList!.firstWhereOrNull(
      (AccountListItem? element) => element!.loginid == other.accountId,
    );

    if (firstAccount == null || otherAccount == null) {
      return 0;
    }

    return currenciesDisplayOrder.indexOf(firstAccount.currency!) -
        currenciesDisplayOrder.indexOf(otherAccount.currency!);
  }

  String? _getAccountCurrencyFromAuthorize({
    required String loginId,
    required List<AccountListItem?> accounts,
  }) {
    final AccountListItem? selected = accounts.firstWhereOrNull(
      (AccountListItem? element) => element!.loginid == loginId,
    );

    return selected?.currency;
  }
}
