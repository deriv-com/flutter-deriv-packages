import 'package:deriv_auth/deriv_auth.dart';

/// Interface of all authentication functions required from client.
abstract class BaseAuthRepository {
  /// Client functionality before user logs in.
  Future<void> onBeforeLogin();

  /// Authorize user with [token].
  Future<AuthorizeResponseEntity> authorize(String? token);

  /// Client functionality after user logs in.
  Future<void> onLogin(AuthorizeEntity authorizeEntity);

  /// Functionality before user logs out.
  Future<void> onBeforeLogout();

  /// Log user out.
  Future<void> logout();

  /// Functionality after user logs out.
  Future<void> onLoggedOut();

  /// Get default user account from Persistance.
  Future<AccountModel?> getDefaultAccount();

  /// Get latest saved user accounts.
  Future<List<AccountModel>> getLatestAccounts();
}
