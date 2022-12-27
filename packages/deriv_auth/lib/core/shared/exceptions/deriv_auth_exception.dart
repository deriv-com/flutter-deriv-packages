import 'package:deriv_auth/core/shared/auth_error/auth_error.dart';

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
