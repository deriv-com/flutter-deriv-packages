import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/features/auth/services/base_auth_service.dart';

/// `DerivGO` implementation of [BaseAuthService].
class ExampleLoginService extends BaseAuthService {
  /// Initializes a [ExampleLoginService] class.
  ExampleLoginService({
    required super.authRepository,
    required super.jwtService,
    required super.connectionInfo,
    required super.tokenService,
  });

  @override
  Future<AuthorizeEntity> onLoginRequest({
    required GetTokensRequestModel request,
    String? userAgent,
    bool useMultiToken = false,
  }) async =>
      const AuthorizeEntity();

  @override
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accounts,
    List<String>? tokenList,
    String? signupProvider,
    String? refreshToken,
  }) async =>
      const AuthorizeEntity();

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

  @override
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode) =>
      authRepository.getLandingCompany(countryCode);
}
