import 'auth_error.dart';

/// Authentication error data model
class AuthErrorModel {
  /// Initializes authentication error model
  const AuthErrorModel({
    this.errorMessage,
    this.authError,
  });

  /// Error message
  final String? errorMessage;

  /// Error type
  final AuthErrorType? authError;
}
