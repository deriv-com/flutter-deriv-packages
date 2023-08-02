import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/core/services/token/models/login_request.dart';

/// Interface to define all authentication-related functionality.
abstract class BaseAuthService {
  /// Function before logging user in.
  Future<AuthorizeEntity> onLoginRequest(
    GetTokensRequestModel request,
  );

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
