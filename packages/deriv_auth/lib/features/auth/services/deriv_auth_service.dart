import 'package:collection/collection.dart';

import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/exceptions/deriv_auth_exception.dart';
import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/auth_error/auth_error.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/services/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/core/services/api_client/http_client.dart';
import 'package:deriv_auth/core/services/jwt/services/base_jwt_service.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/models/login_response.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';

import 'package:deriv_auth/features/auth/repository/base_auth_repository.dart';
import 'base_auth_service.dart';

/// `DerivGO` implementation of [BaseAuthService].
class DerivAuthService extends BaseAuthService {
  /// Initializes a [DerivAuthService] class.
  DerivAuthService({
    required this.authRepository,
    required this.jwtService,
    required this.connectionInfo,
    required this.tokenService,
  });

  /// Client connection info.
  final AuthConnectionInfo connectionInfo;

  /// Interface for all jwtRelated functions.
  final BaseJwtService jwtService;

  /// Interface of all client related functions.
  final BaseAuthRepository authRepository;

  /// Token service.
  final BaseTokenService tokenService;

  @override
  Future<AuthorizeEntity> onLoginRequest(GetTokensRequestModel request,
      [Function? onInvalidJwtToken]) async {
    try {
      final String jwtToken = await jwtService.getJwtToken();

      final GetTokensResponseModel _response = await tokenService.getUserTokens(
        request: request,
        client: HttpClient(),
        jwtToken: jwtToken,
        connectionInfo: connectionInfo,
      );

      final List<AccountModel> _supportedAccounts =
          _filterSupportedAccounts(_response.accounts);

      final String? _defaultAccountToken = _supportedAccounts.first.token;

      if (_defaultAccountToken != null) {
        return login(
          _defaultAccountToken,
          signupProvider: request.signupProvider,
          refreshToken: _response.refreshToken,
          accountsList: _supportedAccounts,
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

        return onLoginRequest(request);
      } else {
        throw _mapHttpErrorToDerivAuthError(error);
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
      final AuthorizeEntity? responseAuthorizeEntity =
          (await authRepository.authorize(token)).authorize;

      _checkAuthorizeValidity(responseAuthorizeEntity);

      final AuthorizeEntity _enhancedAuthorizeEntity =
          responseAuthorizeEntity!.copyWith(
        signupProvider: signupProvider,
        refreshToken: refreshToken,
        accountList: responseAuthorizeEntity.accountList
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

      await authRepository.onLogin(_enhancedAuthorizeEntity);

      return _enhancedAuthorizeEntity;
    } on Exception catch (error) {
      /// Handling the situation when user clicked on an account that is recently disabled.
      /// Each time we switch to an account the state of all accounts get updated from the Authorize response.
      final String errorMessage = error.toString();

      if (errorMessage.contains('AccountDisabled')) {
        throw DerivAuthException(
          message: 'Account is disabled',
          type: AuthErrorType.disabledClient,
        );
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
  Future<AccountModel?> getDefaultAccount() =>
      authRepository.getDefaultAccount();

  @override
  Future<List<AccountModel>> getLatestAccounts() =>
      authRepository.getLatestAccounts();

  @override
  Future<void> logout() => authRepository.logout();

  @override
  Future<void> onLoggedOut() => authRepository.onLoggedOut();

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
}
