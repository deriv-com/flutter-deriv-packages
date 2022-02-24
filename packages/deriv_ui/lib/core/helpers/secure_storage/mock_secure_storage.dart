import 'package:flutter_multipliers/core/models/account_model.dart';

import 'base_secure_storage.dart';

/// A class to store data in a secure storage.
class MockSecureStorage extends BaseSecureStorage {
  @override
  Future<String> get defaultUser async => defaultUserKey;

  @override
  Future<String> get defaultAccount async =>
      Future<String>.value(defaultAccountKey);

  @override
  Future<void> setDefaultAccount(String? acct) async {}

  @override
  Future<List<AccountModel>> get userAccounts async => <AccountModel>[];

  @override
  Future<AccountModel?> get userDefaultAccount async => null;

  @override
  Future<String> get defaultUserId async => defaultUserIdKey;

  @override
  Future<void> setDefaultUserId({required String userId}) async {}

  @override
  Future<void> addAccounts(List<AccountModel> accounts) async {}

  @override
  Future<void> clearAllData() async {}

  @override
  Future<void> setDefaultUser(String? email) async {}

  @override
  Future<void> setRefreshToken(String? token) async {}

  @override
  Future<String?> get refreshToken async => null;
}
