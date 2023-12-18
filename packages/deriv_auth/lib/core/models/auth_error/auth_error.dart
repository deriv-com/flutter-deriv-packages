/// Authentication error types.
enum AuthErrorType {
  /// Expired token/account error type.
  expiredAccount,

  /// Authorization failure error type.
  failedAuthorization,

  /// Connection error type.
  connectionError,

  /// Unsupported account error type.
  unsupportedCountry,

  /// Switching account error type.
  switchAccountError,

  /// Disabled client error type.
  disabledClient,

  /// Error occurs if expired/invalid jwt-token is passed in the login request.
  invalidToken,

  /// Error occurs if 2FA is not passed in the login request.
  missingOtp,

  /// Error occurs if invalid 2FA code is passed in the login request.
  invalid2faCode,

  /// Error occurs if invalid credential is passed in `system` login.
  invalidCredential,

  /// Error occurs if account has been flagged as `self_closed`.
  selfClosed,

  /// Error occurs if tries to login on deactivated account.
  accountUnavailable,

  /// Error occurs if tries to login from unsupported country.
  invalidResidence,
}
