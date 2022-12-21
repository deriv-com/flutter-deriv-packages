import '../../../../deriv_auth.dart';

/// Interface to define all authentication-related functionality.
abstract class BaseAuthService {
  /// Function before logging user in.
  Future<AuthorizeEntity> onBeforeLogin(LoginRequestModel request);

  /// Log in a user with [token].
  Future<AuthorizeEntity> login(
    String token, {
    required List<AccountModel> accountsList,
    String? signupProvider,
    String? refreshToken,
  });

  /// Function after login.
  Future<void> onLogin(AuthorizeEntity authorizeEntity);

  /// Function before logging user out.
  Future<void> onBeforeLogout();

  /// Log user out.
  Future<void> logout();

  /// Functionality after user logs out.
  Future<void> onLoggedOut();

  /// Get default user account.
  Future<AccountModel?> getDefaultAccount();

  /// Get list of latest accounts.
  Future<List<AccountModel>> getLatestAccounts();
}
