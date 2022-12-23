import 'package:deriv_auth/src/auth/auth_error.dart';

/// Authentication Exception.
class DerivAuthException implements Exception {
  /// Initialize [DerivAuthException].
  DerivAuthException({
    required this.message,
    required this.type,
  });

  /// Exception message.
  String message;

  /// Exception type.
  AuthErrorType type;
}
