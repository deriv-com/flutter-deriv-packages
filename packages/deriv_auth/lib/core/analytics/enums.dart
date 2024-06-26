/// Enum for login actions
enum LoginAction {
  /// Open login form.
  openLoginForm,

  /// Start system login.
  startLogin,

  /// Finish login.
  finishLogin,

  /// Login error.
  loginError,
}

/// Enum for login provider.
enum LoginProvider {
  /// Email login.
  email,

  /// Passkey login.
  passkey,

  /// Google login.
  google,

  /// Facebook login.
  facebook,

  /// Apple login.
  apple,
}
