/// Functionality that DerivAuth provides.
abstract class DerivAuthIO {
  /// Login with [email] and [password].
  Future<void> systemLogin({
    required String email,
    required String password,
  });

  /// Social login with [oneAllConnectionToken].
  Future<void> socialLogin({required String oneAllConnectionToken,});

  /// Two-Factor Authentication login with [email], [password] and [otp].
  Future<void> otpLogin({
    required String email,
    required String password,
    required String otp,
  });

  /// Log user in with deriv [token].
  ///
  /// Usually used in `sign up` and `switch account`.
  Future<void> tokenLogin(String token);

  /// Log user out.
  Future<void> logout();

  /// Log default user in.
  Future<void> authorizeDefaultAccount();
}
