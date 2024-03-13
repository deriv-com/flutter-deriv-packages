// ignore_for_file: unnecessary_getters_setters

import 'models/auth_entry_model.dart';

/// Authentication Data Singleton
class AuthData {
  /// AuthData instance
  factory AuthData() => _instance;

  AuthData._internal();

  static final AuthData _instance = AuthData._internal();

  late AuthEntryModel _data;

  /// data getter
  AuthEntryModel get data => _data;

  /// data setter
  set data(AuthEntryModel data) {
    _data = data;
  }
}
