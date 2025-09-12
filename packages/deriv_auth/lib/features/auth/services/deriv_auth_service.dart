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
    bool useMultiToken = false,
  }) async {
    try {
      List<String> _tokenList = <String>[];
      final String jwtToken = await jwtService.getJwtToken();

      final GetTokensResponseModel _response = await tokenService.getUserTokens(
        request: request,
        jwtToken: jwtToken,
        connectionInfo: connectionInfo,
        userAgent: userAgent,
      );

      final List<AccountModel> _supportedAccounts =
          _filterSupportedAccounts(_response.accounts);

      if (useMultiToken == false) {
        final String? _defaultAccountToken = _supportedAccounts.isNotEmpty
            ? _supportedAccounts.first.token
            : null;

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
      } else {
        if (_supportedAccounts.isNotEmpty) {
          _tokenList = _supportedAccounts
              .map<String?>((AccountModel account) => account.token)
              .whereNotNull()
              .toList();

          return login(
            'MULTI',
            tokenList: _tokenList.isEmpty ? null : _tokenList,
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
    List<String>? tokenList,
    String? signupProvider,
    String? refreshToken,
  }) async {
    try {
      final AuthorizeEntity? responseAuthorizeEntity =
          (await authRepository.authorize(token, tokenList: tokenList))
              .authorize;

      await _checkAuthorizeValidity(responseAuthorizeEntity);

      final List<AccountListItem> _filteredAccounts =
          _filterSupportedAccountsFromAuthorizeResponse(
              responseAuthorizeEntity?.accountList ?? <AccountListItem>[]);

      final AuthorizeEntity _enhancedAuthorizeEntity =
          responseAuthorizeEntity!.copyWith(
        signupProvider: signupProvider,
        refreshToken: refreshToken,
        accountList: _getAccountListWithToken(
          _filteredAccounts,
          accounts,
        ),
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

  List<AccountListItem>? _getAccountListWithToken(
    List<AccountListItem>? accountListItems,
    List<AccountModel> accounts,
  ) =>
      accountListItems?.map(
        (AccountListItem accountListItem) {
          final AccountModel? account = accounts.firstWhereOrNull(
            (AccountModel element) =>
                element.accountId == accountListItem.loginid,
          );

          if (account == null) {
            throw DerivAuthException(
              message: 'Login is Expired',
              type: AuthErrorType.expiredAccount,
            );
          }

          return accountListItem.copyWith(token: account.token);
        },
      ).toList();

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

  List<AccountListItem> _filterSupportedAccountsFromAuthorizeResponse(
      List<AccountListItem> accounts) {
    final List<AccountListItem> supportedAccounts = accounts
        .where((AccountListItem account) =>
            account.isSupported &&
            account.isNotDisabled &&
            account.accountType != 'partner')
        .toList();

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

  /// Validates the authorize entity to ensure it's not null and belongs to an
  /// SVG account.
  ///
  /// Throws [DerivAuthException] if:
  /// - The authorize entity is null (token expired)
  /// - The account is not an SVG account (service not available in user's
  ///   country)
  Future<void> _checkAuthorizeValidity(
    AuthorizeEntity? authorizeEntity,
  ) async {
    if (authorizeEntity == null) {
      throw DerivAuthException(
        message: 'Authentication token is expired or invalid',
        type: AuthErrorType.expiredAccount,
      );
    }

    final bool isSvgAccount = await authorizeEntity.isSvgAccount;

    if (!isSvgAccount) {
      throw DerivAuthException(
        message: notAvailableCountryMessage,
        type: AuthErrorType.unsupportedCountry,
      );
    }
  }

  @override
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode) =>
      authRepository.getLandingCompany(countryCode);
}
