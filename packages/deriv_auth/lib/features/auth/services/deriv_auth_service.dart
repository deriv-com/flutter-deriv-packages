import 'package:collection/collection.dart';
import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_http_client/deriv_http_client.dart';

import 'base_auth_service.dart';

/// `DerivGO` implementation of [BaseAuthService].
class DerivAuthService extends BaseAuthService {
  /// Initializes a [DerivAuthService] class.
  DerivAuthService({
    required super.authRepository,
    required super.jwtService,
    required super.connectionInfo,
    required super.tokenService,
  });

  @override
  Future<AuthorizeEntity> onLoginRequest({
    required GetTokensRequestModel request,
    String? userAgent,
    Function? onInvalidJwtToken,
  }) async {
    try {
      final String jwtToken = await jwtService.getJwtToken();

      final GetTokensResponseModel _response = await tokenService.getUserTokens(
        request: request,
        jwtToken: jwtToken,
        connectionInfo: connectionInfo,
        userAgent: userAgent,
      );

      final List<AccountModel> _supportedAccounts =
          _filterSupportedAccounts(_response.accounts);

      final String? _defaultAccountToken = _supportedAccounts.first.token;

      if (_defaultAccountToken != null) {
        return login(
          _defaultAccountToken,
          accounts: _supportedAccounts,
          signupProvider: request.signupProvider,
          refreshToken: _response.refreshToken,
        );
      } else {
        throw DerivAuthException(
          message: accountUnavailableError,
          type: AuthErrorType.accountUnavailable,
        );
      }
    } on HTTPClientException catch (error) {
      if (error.errorCode == invalidJwtTokenError) {
        onInvalidJwtToken?.call();

        jwtService.clearJwtToken();

        return onLoginRequest(request: request, userAgent: userAgent);
      } else {
        throw _mapHttpErrorToDerivAuthError(error);
      }
    }
  }

  @override
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accounts,
    String? signupProvider,
    String? refreshToken,
  }) async {
    try {
      final AuthorizeEntity? responseAuthorizeEntity =
          (await authRepository.authorize(token)).authorize;

      _checkAuthorizeValidity(responseAuthorizeEntity);

      final AuthorizeEntity _enhancedAuthorizeEntity =
          responseAuthorizeEntity!.copyWith(
        signupProvider: signupProvider,
        refreshToken: refreshToken,
        accountList: responseAuthorizeEntity.accountList?.map(
          (AccountListItem accountListItem) {
            final AccountModel? account = accounts.firstWhereOrNull(
              (AccountModel element) =>
                  element.accountId == accountListItem.loginid,
            );

            if (account?.token == null) {
              throw DerivAuthException(
                message: 'Login is Expired',
                type: AuthErrorType.expiredAccount,
              );
            }

            return accountListItem.copyWith(token: account!.token);
          },
        ).toList(),
      );

      await authRepository.onLogin(_enhancedAuthorizeEntity);

      return _enhancedAuthorizeEntity;
    } on DerivAuthException {
      rethrow;
    } on Exception catch (error) {
      throw DerivAuthException(
        message: '$error',
        type: AuthErrorType.failedAuthorization,
      );
    }
  }

  @override
  Future<AccountModel?> getDefaultAccount() =>
      authRepository.getDefaultAccount();

  @override
  Future<List<AccountModel>> getLatestAccounts() =>
      authRepository.getLatestAccounts();

  @override
  Future<void> logout() => authRepository.logout();

  @override
  Future<void> onLogout() => authRepository.onLogout();

  @override
  Future<void> onPostLogout() => authRepository.onPostLogout();

  List<AccountModel> _filterSupportedAccounts(List<AccountModel> accounts) {
    final List<AccountModel> supportedAccounts =
        accounts.where((AccountModel account) => account.isSupported).toList();

    if (supportedAccounts.isEmpty) {
      throw DerivAuthException(
        message: notAvailableCountryMessage,
        type: AuthErrorType.unsupportedCountry,
      );
    }

    return supportedAccounts;
  }

  DerivAuthException _mapHttpErrorToDerivAuthError(
    HTTPClientException exception,
  ) {
    switch (exception.errorCode) {
      case missingOTPError:
        return DerivAuthException(
          type: AuthErrorType.missingOtp,
          message: exception.message,
        );

      case invalidAuthCodeError:
        return DerivAuthException(
          type: AuthErrorType.invalid2faCode,
          message: exception.message,
        );

      case invalidCredentialError:
        return DerivAuthException(
          type: AuthErrorType.invalidCredential,
          message: exception.message,
        );

      case selfClosedError:
        return DerivAuthException(
          type: AuthErrorType.selfClosed,
          message: exception.message,
        );

      case accountUnavailableError:
        return DerivAuthException(
          type: AuthErrorType.accountUnavailable,
          message: exception.message,
        );

      case invalidResidence:
        return DerivAuthException(
          type: AuthErrorType.invalidResidence,
          message: exception.message,
        );

      default:
        return DerivAuthException(
          type: AuthErrorType.failedAuthorization,
          message: exception.message,
        );
    }
  }

  void _checkAuthorizeValidity(
    AuthorizeEntity? authorizeEntity,
  ) {
    if (authorizeEntity == null) {
      throw DerivAuthException(
        message: 'Token is expired',
        type: AuthErrorType.expiredAccount,
      );
    } else if (!authorizeEntity.isSvgAccount) {
      throw DerivAuthException(
        message: 'This service is not available in your country.',
        type: AuthErrorType.unsupportedCountry,
      );
    }
  }

  @override
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode) =>
      authRepository.getLandingCompany(countryCode);
}
