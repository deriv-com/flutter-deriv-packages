import 'package:flutter_multipliers/core/helpers/secure_storage/base_secure_storage.dart';
import 'package:flutter_multipliers/core/helpers/secure_storage/secure_storage.dart';
import 'package:flutter_multipliers/core/utils/pref_service.dart';

/// Deriv's shared preferences identifier.
const String sharedPreferencePrefix = 'DERIV_';

/// clearOnLogout shared preferences identifier
const String clearOnLogoutPrefix = 'CLEAR_ON_LOGOUT_';

const String _userPrefix = 'USER_ID_';

/// Gets preference key based on [isUserBase] and [clearOnLogout] parameters.
///
/// [isUserBase] indicates that this shared preference belongs to a specific user or not.
/// Set [clearOnLogout] to `true` if you want to clear this shared preference on application logout.
Future<String> getPreferenceKey(
  String key, {
  bool? isUserBase = false,
  bool clearOnLogout = true,
  BaseSecureStorage? secureStorage,
}) async {
  String result = key;

  if (clearOnLogout) {
    result = '$clearOnLogoutPrefix$result';
  }

  if (isUserBase ?? false) {
    final String userPrefix =
        await _getUserPrefix(secureStorage: secureStorage ?? SecureStorage());

    result = '$userPrefix$result';
  }

  return result;
}

/// Gets all preferences that should be wiped out on logout
List<Object?> getClearOnLogoutPreferences() {
  final List<String>? keys = _getClearOnLogoutKeys();
  final List<Object?> result = <Object>[];

  if (keys != null && keys.isNotEmpty) {
    result.addAll(
      keys.map<Object?>((final String key) => PrefService.get(key)).toList(),
    );
  }

  return result;
}

/// Gets all user base preferences
Future<Object> getUserPreferences({
  required BaseSecureStorage secureStorage,
}) async {
  final List<String>? keys = await _getUserKeys(secureStorage: secureStorage);
  final List<Object?> result = <Object>[];

  if (keys != null && keys.isNotEmpty) {
    result.addAll(
      keys.map<Object?>((final String key) => PrefService.get(key)).toList(),
    );
  }

  return result;
}

/// Clears all `clearOnLogout` preferences
Future<void> clearOnLogoutPreferences() async {
  final List<String>? keys = _getClearOnLogoutKeys();

  if (keys == null || keys.isEmpty) {
    return;
  }

  for (int i = 0; i < keys.length; i++) {
    await PrefService.remove(keys[i]);
  }
}

/// Clears all `isUserBase` preferences
Future<void> clearUserPreferences({
  required BaseSecureStorage secureStorage,
}) async {
  final List<String>? keys = await _getUserKeys(secureStorage: secureStorage);

  if (keys == null || keys.isEmpty) {
    return;
  }

  keys.forEach(PrefService.remove);
}

Future<String> _getUserPrefix(
    {required BaseSecureStorage secureStorage}) async {
  final String? userId = await secureStorage.defaultUserId;

  return '$_userPrefix${userId}_';
}

Future<List<String>> _getUserKeys({
  required BaseSecureStorage secureStorage,
}) async {
  final String userPrefix = await _getUserPrefix(secureStorage: secureStorage);

  return PrefService.getKeys()!
      .where((String item) => item.contains(userPrefix))
      .toList();
}

List<String>? _getClearOnLogoutKeys() => PrefService.getKeys() == null
    ? null
    : PrefService.getKeys()!
        .where((String item) => item.contains(clearOnLogoutPrefix))
        .toList();
