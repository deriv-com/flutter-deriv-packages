import 'package:deriv_auth/deriv_auth.dart';
import 'package:deriv_auth/src/core/api_client/base_client.dart';
import 'package:deriv_auth/src/core/api_client/exceptions/http_exceptions.dart';
import 'package:deriv_auth/src/deriv_auth/auth_repository.dart';
import 'package:deriv_auth/src/deriv_auth/deriv_auth_exception.dart';
import 'package:deriv_auth/src/deriv_auth/jwt_provider.dart';
import 'package:deriv_auth/src/models/login/enums.dart';
import 'package:deriv_auth/src/models/login/login_response.dart';
import 'package:collection/collection.dart';

abstract class AuthService {
  Future<List<AccountModel>> fetchAccounts({
    required LoginRequestModel request,
  });

  Future<AuthorizeEntity> authorizeSingleAccount({
    required AccountModel account,
  });

  List<AccountModel> filterSupportedAccounts(List<AccountModel> accounts);
}

class DerivAuthService extends AuthService {
  DerivAuthService({
    required this.client,
    required this.jwtService,
    required this.appId,
    required this.endpoint,
    required this.repository,
  });

  final AuthRepository repository;
  final JwtService jwtService;
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
      final AuthorizeResponseEntity? authorize =
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
