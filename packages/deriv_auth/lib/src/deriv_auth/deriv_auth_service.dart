import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/core/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/src/deriv_auth/auth_repository.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/deriv_auth/jwt_provider.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';
import 'package:collection/collection.dart';

import '../core/constants/constants.dart';

abstract class BaseAuthService {
  Future<List<AccountModel>> fetchAccounts({
    required LoginRequestModel request,
  });

  Future<AuthorizeEntity> authorizeSingleAccount({
    required AccountModel account,
  });

  List<AccountModel> filterSupportedAccounts(List<AccountModel> accounts);

  Future<void> onLogin({
    required AuthorizeEntity authorizeEntity,
    required List<AccountModel> supportedAccounts,
    required List<AccountModel> accounts,
    String? refreshToken,
    String? signupProvider,
    bool reloadAccounts = false,
  });
}

class DerivAuthService extends BaseAuthService {
  DerivAuthService({
    required this.client,
    required this.jwtService,
    required this.appId,
    required this.endpoint,
    required this.repository,
    required this.userDataRepository,
  });

  final BaseAuthRepository repository;
  final BaseUserDataRepository userDataRepository;
  final BaseJwtService jwtService;
  final BaseHttpClient client;
  final String endpoint;
  final String appId;

  /// Error occurs if expired/invalid jwt-token is passed in the login request.
  static const String invalidTokenError = 'INVALID_TOKEN';

  @override
  List<AccountModel> filterSupportedAccounts(List<AccountModel> accounts) =>
      accounts
          .where((AccountModel account) =>
              account.accountId.toUpperCase().contains('CR') ||
              account.accountId.toUpperCase().contains('VRTC'))
          .toList();

  @override
  Future<List<AccountModel>> fetchAccounts({
    required LoginRequestModel request,
  }) async {
    final String jwtToken = await jwtService.getJwtToken();

    try {
      final LoginResponseModel response =
          await repository.fetchAccounts(request: request, jwtToken: jwtToken);

      // TODO(mohammad): Save Refresh Token

      final List<AccountModel> accounts = response.accounts;

      return accounts;
    } on HTTPClientException catch (error) {
      if (error.errorCode == invalidTokenError) {
        jwtService.clearJwtToken();
        return fetchAccounts(request: request);
      }
      throw DerivAuthException(
        type: AuthErrorType.failedAuthorization,
        message: error.message,
      );
    }
  }

  @override
  Future<AuthorizeEntity> authorizeSingleAccount({
    required AccountModel account,
  }) async {
    try {
      final AuthorizeResponseEntity authorize =
          await repository.authorize(account.token);

      if (authorize == null) {
        throw DerivAuthException(
          message: 'Token is expired',
          type: AuthErrorType.expiredAccount,
        );
      }
      if (!_isSvgAccount(authorize.authorize!)) {
        // TODO(do logout in cubit catch)
        // await logout(logoutReason: 'Unsupported Country');

        throw DerivAuthException(
          message: 'This service is not available in your country.',
          type: AuthErrorType.unsupportedCountry,
        );
      }
      return authorize.authorize!;
    } on Exception catch (error) {
      // handling the situation when user clicked on an account that is recently disabled.
      // each time we switch to an account the state of all accounts get updated from the Authorize response.
      final errorMessage = error.toString();

      if (errorMessage.contains('AccountDisabled')) {
        throw DerivAuthException(
          message: 'Account is disabled',
          type: AuthErrorType.disabledClient,
        );
        // TODO(do logout in cubit catch)
        // await logout(isForcedLogout: true);
      } else {
        throw DerivAuthException(
          message: '$error',
          type: errorMessage.contains('InvalidToken')
              ? AuthErrorType.expiredAccount
              : AuthErrorType.failedAuthorization,
        );
      }
    }
  }

  /// [authorizeEntity] will carry user data after being authorized
  ///
  /// [supportedAccounts] will be stored in Secure Storage
  ///
  /// [accounts] is only used with signupProvider to submit a signup callback from repo
  ///
  /// [refreshToken] needs to be stored in Secure Storage
  ///
  /// [signupProvider]
  ///
  /// It also take an optional boolean called [reloadAccounts] which is false
  /// by default and indicates whether all accounts should get fetched and
  /// subscribed after login. It is mostly used when the user creates a new
  /// real account and calls login with the newly created account.
  ///
  ///
  ///
  @override
  Future<void> onLogin({
    required AuthorizeEntity authorizeEntity,
    required List<AccountModel> supportedAccounts,
    required List<AccountModel> accounts,
    String? refreshToken,
    String? signupProvider,
    bool reloadAccounts = false,
  }) async {
    final AccountModel defaultUserAccount = _setDefaultAccount(
      supportedAccounts: supportedAccounts,
      index: reloadAccounts ? supportedAccounts.length - 1 : null,
    );

    // Add user email and full name to account data before saving it.
    for (final AccountModel account in supportedAccounts) {
      account
        ..email = authorizeEntity.email
        ..fullName = authorizeEntity.fullname
        ..userId = authorizeEntity.userId
        ..currency = _getAccountCurrencyFromAuthorize(
          loginId: account.accountId,
          accounts: authorizeEntity.accountList!,
        );
    }

// adding disabled accounts to the list.
    for (final AccountListItem accountModel in authorizeEntity.accountList!) {
      if (accountModel.isDisabled! && _isAccountModelValid(accountModel)) {
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
        authorize: authorizeEntity,
        account: account,
        other: other,
      ),
    );

    await userDataRepository.addAccountsToSecureStorage(supportedAccounts);
    await userDataRepository.setDefaultUserEmail(authorizeEntity.email);
    await userDataRepository.setDefaultAccount(defaultUserAccount.accountId);
    await userDataRepository.setDefaultUserId(authorizeEntity.userId);

    // await secureStorage.addAccounts(supportedAccounts);
    // await secureStorage.setDefaultUser(userEmail);
    // await secureStorage.setDefaultAccount(
    //   defaultUserAccount.accountId,
    // );
    // await secureStorage.setDefaultUserId(
    //   userId: '${authorize.userId}',
    // );

    if (refreshToken != null) {
      // onRefreshToken?.call();
      await userDataRepository.setRefreshToken(refreshToken);

      // await secureStorage.setRefreshToken(refreshToken);
    }

    await userDataRepository.setFeedbackReminderFlag();

    if (reloadAccounts) {
      // onReloadAccounts.call();
      repository.reloadAccounts();
    }
    if (signupProvider != null && _canSendSignupDoneEvent(accounts)) {
      final vrAccount = getVRAccount(accounts);
      await repository.onSendSignupEvent(
        signupProvider: signupProvider,
        binaryUserId: '${authorizeEntity.userId ?? " "}',
        loginId: vrAccount!.accountId,
      );
    }
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

  bool _isAccountModelValid(AccountListItem account) =>
      account.loginid!.toUpperCase().contains('CR') ||
      account.loginid!.toUpperCase().contains('VRTC');

  /// If [accounts] contains a VR account return the [AccountModel] object
  /// otherwise returns [null].
  AccountModel? getVRAccount(List<AccountModel> accounts) =>
      accounts.firstWhereOrNull((AccountModel account) => isVRAccount(account));

  /// If [accounts] contains a VR account return true
  /// otherwise returns false.
  bool hasVRAccount(List<AccountModel> accounts) =>
      accounts.any((AccountModel account) => isVRAccount(account));

  /// Returns true if the [account] is a VR account, otherwise returns false.
  bool isVRAccount(AccountModel account) =>
      account.accountId.toUpperCase().contains('VR');

  /// Returns true if the [account] is a CR account, otherwise returns false.
  bool isCRAccount(AccountModel account) =>
      account.accountId.toUpperCase().contains('CR');

  bool _canSendSignupDoneEvent(List<AccountModel>? accounts) =>
      accounts != null && accounts.isNotEmpty && hasVRAccount(accounts);

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
}
