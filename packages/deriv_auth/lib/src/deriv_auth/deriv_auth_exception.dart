import 'package:deriv_auth/src/auth/auth_error.dart';

class DerivAuthException implements Exception {
  DerivAuthException({
    required this.message,
    required this.type,
  });

  String message;
  AuthErrorType type;
}
