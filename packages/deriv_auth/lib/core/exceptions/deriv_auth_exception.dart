import 'package:deriv_auth/core/models/auth_error/auth_error.dart';

/// Authentication Exception.
class DerivAuthException implements Exception {
  /// Initialize [DerivAuthException].
  DerivAuthException({
    required this.message,
    required this.type,
    this.data,
  });

  /// Exception message.
  String message;

  /// Exception type.
  AuthErrorType type;

  /// Optional data payload for additional context
  Map<String, dynamic>? data;

  @override
  String toString() => message;
}
