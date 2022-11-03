/// The selected parameter that should be highlighted when opening the
/// Social login or signup
enum SocialType {
  /// Login social type.
  login,

  /// Signup social type.
  signup
}

/// Login type.
enum LoginType {
  /// Login using email and password.
  system,

  /// Login with social accounts.
  social
}

/// Social Login type.
enum SocialAuthType {
  /// Google.
  google,

  /// Facebook.
  facebook,

  /// Apple.
  apple
}
