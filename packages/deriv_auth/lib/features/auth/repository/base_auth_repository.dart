import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/authorize_model.dart';

/// Interface of all authentication functions required from client.
abstract class BaseAuthRepository {
  /// Authorize user with [token].
  Future<AuthorizeResponseEntity> authorize(String? token);

  /// Client functionality after user logs in.
  Future<void> onLogin(AuthorizeEntity authorizeEntity);

  /// Log user out.
  Future<void> logout();

  /// Functionality after user logs out.
  Future<void> onLoggedOut();

  /// Get default user account from Persistance.
  Future<AccountModel?> getDefaultAccount();

  /// Get latest saved user accounts.
  Future<List<AccountModel>> getLatestAccounts();
}
