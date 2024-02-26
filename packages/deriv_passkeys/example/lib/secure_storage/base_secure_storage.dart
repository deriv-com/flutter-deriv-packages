import 'package:deriv_auth/deriv_auth.dart';

/// A base class to store data in a secure storage.
abstract class BaseSecureStorage {
  /// Default account key.
  final String defaultAccountKey = 'defaultAccount';

  /// Default user id key.
  final String defaultUserIdKey = 'defaultUserId';

  /// Default user key.
  final String defaultUserKey = 'defaultUser';

  /// Accounts key.
  final String accountsKey = 'accounts';

  /// Refresh token key.
  final String refreshTokenKey = 'refreshToken';

  /// Stored server time key.
  final String lastVerificationDialogShownServerTimeKey =
      'lastVerificationDialogShownServerTimeKey';

  /// Retrieves default user value stored in secure storage.
  Future<String?> get defaultUser;

  /// Stores server time in secure storage.
  Future<void> storeServerTimeForVerificationDialog(DateTime time);

  /// Stores default user value in secure storage.
  Future<void> setDefaultUser(String email);

  /// Retrieves default account value stored in secure storage.
  Future<String?> get defaultAccount;

  /// Stores default account value in secure storage.
  Future<void> setDefaultAccount(String acct);

  /// Retrieves all saved accounts in the secure storage.
  Future<List<AccountModel>> get userAccounts;

  /// Retrieves the default saved account in the secure storage.
  Future<AccountModel?> get userDefaultAccount;

  /// Gets default user id
  Future<String?> get defaultUserId;

  /// Notification count.
  final String liveChatNotificationCountKey = 'live_chat_notification_count';

  /// Sets default user's userId value to secure storage.
  ///
  /// [userId] is required.
  Future<void> setDefaultUserId({required String userId});

  /// Saves supported accounts list in secure storage.
  Future<void> addAccounts(List<AccountModel> accounts);

  /// Clear all data in secure storage, called when user is logged out.
  Future<void> clearAllData();

  /// Gets user refresh token.
  Future<String?> get refreshToken;

  /// Sets refresh token of logged in user to secure storage.
  Future<void> setRefreshToken(String? token);

  /// Gets live chat notification count.
  Future<int> get livechatNotificationCount;

  /// Sets live chat notification count secure storage.
  Future<void> setLiveChatNotificationCount(int count);
}
