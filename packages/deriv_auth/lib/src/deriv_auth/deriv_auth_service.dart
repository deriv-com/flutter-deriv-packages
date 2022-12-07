import 'package:deriv_auth/src/auth/auth_error.dart';
import 'package:deriv_auth/src/auth/models/authorize.dart';
import 'package:deriv_auth/src/core/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/src/core/constants/constants.dart';
import 'package:deriv_auth/src/deriv_auth/auth_repository.dart';
import 'package:deriv_auth/src/deriv_auth/core/extensions.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/deriv_auth/jwt_service.dart';
import 'package:deriv_auth/src/models/account/account.dart';
import 'package:deriv_auth/src/models/login/login_request.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';

abstract class BaseAuthService {
  Future<AuthorizeEntity> login(String token);
  Future<void> logout();

  Future<void> onLogin(AuthorizeEntity authorizeEntity);
  Future<void> onLoggedOut();

  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
  });

  Future<void> onAccountsFetched(LoginResponseModel response);

  Future<AccountModel?> getDefaultAccount();
  Future<List<AccountModel>> getLatestAccounts();

  List<AccountModel> filterSupportedAccounts(List<AccountModel> accounts);

  /// Reset Password
  ///
  /// Sends email verification for resetting password.
  ///
  Future<bool> sendEmailVerification(String email);

  /// Change user password using provided token
  ///
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  });

  /// Verifies the email if it's valid
  /// for password reset
  ///
  Future<String> getVerificationToken(String url);
}

class DerivAuthService extends BaseAuthService {
  DerivAuthService({
    required this.jwtService,
    required this.repository,
  });

  final BaseAuthRepository repository;
  final BaseJwtService jwtService;

  @override
  List<AccountModel> filterSupportedAccounts(List<AccountModel> accounts) =>
      accounts.where((AccountModel account) => account.isSupported).toList();

  @override
  Future<LoginResponseModel> fetchAccounts({
    required LoginRequestModel request,
  }) async {
    final String jwtToken = await jwtService.getJwtToken();

    try {
      final LoginResponseModel response =
          await repository.fetchAccounts(request: request, jwtToken: jwtToken);

      return response;
    } on HTTPClientException catch (error) {
      switch (error.errorCode) {
        case invalidTokenError:
          jwtService.clearJwtToken();
          return fetchAccounts(request: request);

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
  Future<AuthorizeEntity> login(String token) async {
    try {
      final AuthorizeEntity? authorize =
          (await repository.authorize(token)).authorize;

      if (authorize == null) {
        throw DerivAuthException(
          message: 'Token is expired',
          type: AuthErrorType.expiredAccount,
        );
      }

      if (!authorize.isSvgAccount) {
        // TODO(do logout in cubit catch)
        // await logout(logoutReason: 'Unsupported Country');

        throw DerivAuthException(
          message: 'This service is not available in your country.',
          type: AuthErrorType.unsupportedCountry,
        );
      }
      return authorize;
    } on DerivAuthException {
      rethrow;
    } on Exception catch (error) {
      // handling the situation when user clicked on an account that is recently disabled.
      // each time we switch to an account the state of all accounts get updated from the Authorize response.
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
  Future<void> onLogin(AuthorizeEntity authorizeEntity) async =>
      repository.onLogin(authorizeEntity);

  @override
  Future<AccountModel?> getDefaultAccount() => repository.getDefaultAccount();
  @override
  Future<List<AccountModel>> getLatestAccounts() =>
      repository.getLatestAccounts();

  @override
  Future<void> logout() => repository.logout();

  @override
  Future<void> onLoggedOut() => repository.onLoggedOut();

  @override
  Future<void> onAccountsFetched(LoginResponseModel response) =>
      repository.onAccountsFetched(response);

  @override
  Future<bool> sendEmailVerification(String email) =>
      repository.sendEmailVerification(email);

  @override
  Future<bool> resetPassword(
          {required String verificationCode, required String newPassword}) =>
      repository.resetPassword(
        verificationCode: verificationCode,
        newPassword: newPassword,
      );

  @override
  Future<String> getVerificationToken(String url) =>
      repository.getVerificationToken(url);
}
