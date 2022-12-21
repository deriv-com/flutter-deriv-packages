import 'package:collection/collection.dart';
import 'package:deriv_auth/src/deriv_auth/core/helpers/rest_helpers.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';

import '../../../../deriv_auth.dart';
import '../../../core/api_client/exceptions/http_exceptions.dart';
import '../../../core/constants/constants.dart';

/// Class to implement auth service for Deriv Go.
class DerivAuthService extends BaseAuthService {
  /// Initialzes a [DerivAuthService] class.
  DerivAuthService({
    required this.authRepository,
    required this.jwtService,
    required this.connectionInfo,
  });

  /// Client connection info.
  final AuthConnectionInfo connectionInfo;

  /// Interface for all jwtRelated functions.
  final BaseJwtService jwtService;

  /// Interface of all client related functions.
  final BaseAuthRepository authRepository;

  @override
  Future<AuthorizeEntity> onBeforeLogin(LoginRequestModel request) async {
    try {
      /// JWT.
      final String jwtToken = await jwtService.getJwtToken();

      /// Get response from [request].
      final LoginResponseModel response =
          await RestAPIHelpers().getLoginResponse(
        request,
        jwtToken: jwtToken,
        connectionInfo: connectionInfo,
      );

      /// Fetch accounts.
      final List<AccountModel> accounts = response.accounts;

      /// Filter by supported.
      final List<AccountModel> supportedAccounts = accounts
          .where((AccountModel account) => account.isSupported)
          .toList();

      /// Throw error if none is supported.
      if (supportedAccounts.isEmpty) {
        throw DerivAuthException(
          message: notAvailableCountryMessage,
          type: AuthErrorType.unsupportedCountry,
        );
      }

      /// Get default user account.
      final AccountModel? savedDefaultAccount =
          await authRepository.getDefaultAccount();

      /// Get account token.
      final String? defaultAccountToken =
          savedDefaultAccount?.token ?? supportedAccounts.first.token;

      /// Client functionality before login.
      await authRepository.onBeforeLogin();

      if (defaultAccountToken != null) {
        return login(
          defaultAccountToken,
          signupProvider: request.signupProvider,
          refreshToken: response.refreshToken,
          accountsList: supportedAccounts,
        );
      } else {
        throw DerivAuthException(
          message: accountUnavailableError,
          type: AuthErrorType.accountUnavailable,
        );
      }
    } on HTTPClientException catch (error) {
      switch (error.errorCode) {
        case invalidTokenError:
          jwtService.clearJwtToken();
          return onBeforeLogin(request);

        case missingOtpError:
          throw DerivAuthException(
            type: AuthErrorType.missingOtp,
            message: error.message,
          );
        case invalidAuthCodeError:
          throw DerivAuthException(
            type: AuthErrorType.invalid2faCode,
            message: error.message,
          );
        case invalidCredentialError:
          throw DerivAuthException(
            type: AuthErrorType.invalidCredential,
            message: error.message,
          );
        case selfClosedError:
          throw DerivAuthException(
            type: AuthErrorType.selfClosed,
            message: error.message,
          );
        case accountUnavailableError:
          throw DerivAuthException(
            type: AuthErrorType.accountUnavailable,
            message: error.message,
          );

        default:
          throw DerivAuthException(
            type: AuthErrorType.failedAuthorization,
            message: error.message,
          );
      }
    }
  }

  @override
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accountsList,
    String? signupProvider,
    String? refreshToken,
  }) async {
    try {
      /// Authorize [token]. Return Authorize Entity.
      final AuthorizeEntity? authorize =
          (await authRepository.authorize(token)).authorize;

      /// Throw error if authorize entity is null.
      if (authorize == null) {
        throw DerivAuthException(
          message: 'Token is expired',
          type: AuthErrorType.expiredAccount,
        );
      }

      /// Throw error if account country is not supported
      else if (!authorize.isSvgAccount) {
        throw DerivAuthException(
          message: 'This service is not available in your country.',
          type: AuthErrorType.unsupportedCountry,
        );
      }

      /// Add [accountsList] and [signupProvider] to authorize entity.
      final AuthorizeEntity enhancedAuthorizeEntity = authorize.copyWith(
        signupProvider: signupProvider,
        refreshToken: refreshToken,
        accountList: authorize.accountList
            ?.map(
              (AccountListItem accountListItem) => accountListItem.copyWith(
                token: accountsList
                        .where(
                          (AccountModel element) =>
                              element.accountId == accountListItem.loginid,
                        )
                        .firstOrNull
                        ?.token ??
                    token,
              ),
            )
            .toList(),
      );

      /// Client functionality on login.
      await onLogin(enhancedAuthorizeEntity);

      return enhancedAuthorizeEntity;
    } on Exception catch (error) {
      /// Handling the situation when user clicked on an account that is recently disabled.
      /// Each time we switch to an account the state of all accounts get updated from the Authorize response.
      final String errorMessage = error.toString();

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

  @override
  Future<void> onLogin(AuthorizeEntity authorizeEntity) =>
      authRepository.onLogin(authorizeEntity);

  @override
  Future<AccountModel?> getDefaultAccount() =>
      authRepository.getDefaultAccount();

  @override
  Future<List<AccountModel>> getLatestAccounts() =>
      authRepository.getLatestAccounts();

  @override
  Future<void> onBeforeLogout() => authRepository.onBeforeLogout();

  @override
  Future<void> logout() => authRepository.logout();

  @override
  Future<void> onLoggedOut() => authRepository.onLoggedOut();
}
