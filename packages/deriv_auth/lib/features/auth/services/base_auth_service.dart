import 'package:deriv_auth/core/connection_info.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/jwt/services/base_jwt_service.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';
import 'package:deriv_auth/core/services/token/services/base_token_service.dart';
import 'package:deriv_auth/features/auth/repository/base_auth_repository.dart';

/// Interface to define all authentication-related functionality.
abstract class BaseAuthService {
  /// Constructor for [BaseAuthService].
  BaseAuthService({
    required this.connectionInfo,
    required this.jwtService,
    required this.authRepository,
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

  /// Function before logging user in.
  Future<AuthorizeEntity> onLoginRequest({
    required GetTokensRequestModel request,
    String? userAgent,
  });

  /// Log in a user with [token].
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accounts,
    String? signupProvider,
    String? refreshToken,
  });

  /// Logout user.
  Future<void> logout();

  /// Functionality on user logs out.
  Future<void> onLogout();

  /// Functionality on logout is done.
  Future<void> onPostLogout();

  /// Get default user account.
  Future<AccountModel?> getDefaultAccount();

  /// Get list of latest accounts.
  Future<List<AccountModel>> getLatestAccounts();

  /// Get landing company.
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode);
}
