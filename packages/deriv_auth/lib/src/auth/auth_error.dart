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

  invalidToken,

  missingOtp,

  invalid2faCode,

  invalidCredential,

  selfClosed,

  accountUnavailable,
}
