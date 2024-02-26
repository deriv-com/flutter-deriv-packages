import 'dart:convert';
import 'dart:developer' as logger;
import 'package:deriv_auth/deriv_auth.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passkeys_poc/secure_storage/base_secure_storage.dart';
import 'package:passkeys_poc/secure_storage/cache_account_storage.dart';

/// A class to store data in a secure storage.
class SecureStorage extends BaseSecureStorage {
  /// Get instance of [SecureStorage] every time.
  factory SecureStorage() => _instance;

  /// Initializes Flutter secure storage.
  SecureStorage._() {
    storage = const FlutterSecureStorage();
  }

  /// Singleton instance of [SecureStorage].
  static final SecureStorage _instance = SecureStorage._();

  /// Local cache for accounts
  final CachedAccountStorage accountsCache = CachedAccountStorage();

  /// Flutter secure storage instance.
  late FlutterSecureStorage storage;

  @override
  Future<String?> get defaultUser async {
    try {
      return await storage.read(key: defaultUserKey);
    } on Exception catch (error) {
      logger.log(
        'Failed while getting default user from secure storage',
        error: error,
      );
    }

    return Future<String>.value('');
  }

  @override
  Future<void> setDefaultUser(String email) async {
    try {
      await storage.write(key: defaultUserKey, value: email);
    } on Exception catch (error) {
      logger.log(
        'Failed while saving default user in secure storage',
        error: error,
      );
    }
  }

  @override
  Future<String?> get defaultAccount async {
    try {
      if (accountsCache.cachedDefaultAccount != null) {
        return accountsCache.cachedDefaultAccount;
      } else {
        return accountsCache.cachedDefaultAccount =
            await storage.read(key: defaultAccountKey);
      }
    } on Exception catch (error) {
      logger.log(
        'Failed while getting default account from secure storage',
        error: error,
      );
    }

    return Future<String>.value('');
  }

  @override
  Future<void> setDefaultAccount(String acct) async {
    try {
      accountsCache.cachedDefaultAccount = acct;
      await storage.write(key: defaultAccountKey, value: acct);
    } on Exception catch (error) {
      logger.log(
        'Failed while storing default account in secure storage',
        error: error,
      );
    }
  }

  @override
  Future<List<AccountModel>> get userAccounts async {
    // final List<AccountModel> result = <AccountModel>[];
    // try {
    accountsCache.cachedStoredAccounts ??= await storage.read(key: accountsKey);

    //   final List<dynamic> accounts = List<dynamic>.from(
    //     jsonDecode(accountsCache.cachedStoredAccounts ?? '[]'),
    //   );
    //
    //   for (final dynamic account in accounts) {
    //     result.add(AccountModel.fromMap(account));
    //   }
    // } on MultipliersException catch (error) {
    //   logger.log('Parse Json response (accounts) failed', error: error);
    // } on Exception catch (error) {
    //   logger.log('Parse Json response (accounts) failed', error: error);
    return <AccountModel>[];
    // }

    // As we need a source place where we get the list of allowed account.
    // We currently are getting them from SecureStorage.
    //  so we only filter it here.
    // check to see what is a better place to do this filtering.
    // return result
    //     .where((AccountModel account) => _isAccountModelValid(account))
    //     .toList();
  }

  @override
  Future<AccountModel> get userDefaultAccount async {
    final storedAccounts = await userAccounts;
    final defaultAcc = await defaultAccount;

    final account = storedAccounts.isEmpty
        ? AccountModel(accountId: '', fullName: '', email: '')
        : storedAccounts.firstWhere(
            (AccountModel account) => account.accountId == defaultAcc,
          );

    return account;
  }

  @override
  Future<String?> get defaultUserId => storage.read(key: defaultUserIdKey);

  @override
  Future<void> setDefaultUserId({required String userId}) async {
    try {
      await storage.write(key: defaultUserIdKey, value: userId);
    } on Exception catch (error) {
      logger.log(
        'Failed while storing default user id in secure storage',
        error: error,
      );
    }
  }

  @override
  Future<void> addAccounts(List<AccountModel> accounts) async {
    try {
      accountsCache.cachedStoredAccounts = jsonEncode(accounts);
      await storage.write(
        key: accountsKey,
        value: jsonEncode(accounts),
      );
    } on Exception catch (error) {
      logger.log(
        'Failed while adding accounts to secure storage.',
        error: error,
      );
    }
  }

  @override
  Future<void> clearAllData() async {
    try {
      await storage.delete(key: accountsKey);
      await storage.delete(key: defaultAccountKey);
      await storage.delete(key: defaultUserIdKey);
      await storage.delete(key: defaultUserKey);
      await storage.delete(key: refreshTokenKey);
      await storage.delete(key: liveChatNotificationCountKey);
      await storage.delete(key: lastVerificationDialogShownServerTimeKey);
    } on Exception catch (error) {
      logger.log('Failed while clear all secure storage data.', error: error);
    }
  }

  @override
  Future<void> setRefreshToken(String? token) async {
    try {
      await storage.write(key: refreshTokenKey, value: token);
    } on Exception catch (error) {
      logger.log(
        'Failed while storing refresh token in secure storage.',
        error: error,
      );
    }
  }

  @override
  Future<String?> get refreshToken {
    try {
      return storage.read(key: refreshTokenKey);
    } on Exception catch (error) {
      logger.log(
        'Failed while getting refresh token from secure storage.',
        error: error,
      );
    }

    return Future<String>.value('');
  }

  @override
  Future<int> get livechatNotificationCount async {
    try {
      final count =
          await storage.read(key: liveChatNotificationCountKey) ?? '0';
      return int.parse(count);
    } on Exception catch (error) {
      logger.log(
        '''
Failed while getting live chat notification count from secure storage.''',
        error: error,
      );
    }
    return 0;
  }

  @override
  Future<void> setLiveChatNotificationCount(int count) async {
    try {
      await storage.write(
        key: liveChatNotificationCountKey,
        value: count.toString(),
      );
    } on Exception catch (error) {
      logger.log(
        'Failed while storing live chat notification count in secure storage',
        error: error,
      );
    }
  }

  @override
  Future<void> storeServerTimeForVerificationDialog(DateTime time) async {
    try {
      await storage.write(
        key: lastVerificationDialogShownServerTimeKey,
        value: time.toString(),
      );
    } on Exception catch (error) {
      logger.log(
        'Failed while storing server time in secure storage',
        error: error,
      );
    }
  }

/*  bool _isAccountModelValid(AccountModel account) =>
      account.accountId.toUpperCase().contains('CR') ||
      account.accountId.toUpperCase().contains('VRTC');*/
}
