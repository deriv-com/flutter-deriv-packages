// ignore_for_file: unnecessary_getters_setters

import 'package:deriv_auth/core/services/jwt/repository/deriv_jwt_repository.dart';
import 'package:deriv_auth/core/services/jwt/services/deriv_jwt_service.dart';
import 'package:deriv_auth/core/services/token/services/deriv_token_service.dart';
import 'package:deriv_auth/features/auth/auth.dart';
import 'package:deriv_auth/features/social_auth/cubit/social_auth_cubit.dart';

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
