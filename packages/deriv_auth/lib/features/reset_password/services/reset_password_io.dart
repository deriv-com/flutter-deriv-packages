/// Required functionality for resetting password.
abstract class ResetPasswordIO {
  /// Sends email verification for resetting password.
  Future<void> sendVerificationEmail(String email);

  /// Changes user password using provided 'token'
  Future<void> changePassword({
    required String token,
    required String newPassword,
  });
}
