import 'dart:convert';
import 'dart:developer' as logger;

import 'package:flutter_multipliers/core/exceptions/multipliers_exception.dart';
import 'package:flutter_multipliers/core/models/account_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'base_secure_storage.dart';

/// A class to store data in a secure storage.
class SecureStorage extends BaseSecureStorage {
  /// Initializes Flutter secure storage.
  SecureStorage() {
    storage = const FlutterSecureStorage();
  }

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
  Future<void> setDefaultUser(String? email) async {
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
      return await storage.read(key: defaultAccountKey);
    } on Exception catch (error) {
      logger.log(
        'Failed while getting default account from secure storage',
        error: error,
      );
    }

    return Future<String>.value('');
  }

  @override
  Future<void> setDefaultAccount(String? acct) async {
    try {
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
    final List<AccountModel> result = <AccountModel>[];

    try {
      final String? storedAccounts = await storage.read(key: accountsKey);

      final List<dynamic> accounts = List<dynamic>.from(
        jsonDecode(storedAccounts ?? '[]'),
      );

      for (final dynamic account in accounts) {
        result.add(AccountModel.fromMap(account));
      }
    } on MultipliersException catch (error) {
      logger.log('Parse Json response (accounts) failed', error: error);
    } on Exception catch (error) {
      logger.log('Parse Json response (accounts) failed', error: error);
      return <AccountModel>[];
    }

    return result;
  }

  @override
  Future<AccountModel> get userDefaultAccount async {
    final List<AccountModel> storedAccounts = await userAccounts;
    final String? defaultAcc = await defaultAccount;

    final AccountModel account = storedAccounts
        .firstWhere((AccountModel account) => account.accountId == defaultAcc);

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
      await storage.write(key: accountsKey, value: jsonEncode(accounts));
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
}
