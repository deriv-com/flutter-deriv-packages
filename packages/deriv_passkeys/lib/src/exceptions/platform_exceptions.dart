import 'package:flutter/services.dart';

/// An exception that is thrown when the platform fails to create a passkey.
class CanceledPlatformException extends PlatformException {
  /// Creates a [CanceledPlatformException].
  CanceledPlatformException({
    required String code,
    required String message,
    required String details,
  }) : super(
          code: code,
          message: message,
          details: details,
        );
}

/// An exception that is thrown when the platform cannot find a matching credential.
class NoCredentialPlatformException extends PlatformException {
  /// Creates a [NoCredentialPlatformException].
  NoCredentialPlatformException({
    required String code,
    required String message,
    required String details,
  }) : super(
          code: code,
          message: message,
          details: details,
        );
}
