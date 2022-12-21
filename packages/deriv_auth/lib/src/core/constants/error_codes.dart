/// Constant Error Codes.
class ErrorCodes {
  /// Error occurs if 2FA is not passed in the login request.
  static const String missingOtpError = 'MISSING_ONE_TIME_PASSWORD';

  /// Error occurs if expired/invalid jwt-token is passed in the login request.
  static const String invalidTokenError = 'INVALID_TOKEN';

  /// Error occurs if invalid 2FA code is passed in the login request.
  static const String invalidAuthCodeError = 'TFA_FAILURE';

  /// Error occurs if invalid credential is passed in `system` login.
  static const String invalidCredentialError = 'INVALID_CREDENTIALS';

  /// Error occurs if account has been flagged as `self_closed`.
  static const String selfClosedError = 'SELF_CLOSED';

  /// Error occurs if tries to login on deactivated account.
  static const String accountUnavailableError = 'AccountUnavailable';
}
