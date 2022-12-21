import '../../../../deriv_auth.dart';

/// Interface for [ResetPassword] functions.
abstract class BaseResetPasswordService {
  /// Function before sending reset email password to user.
  Future<void> onBeforeResetPasswordEmailSent();

  /// Function after sending reset email password to user.
  Future<void> onResetPasswordEmailSent();

  /// Change user password using provided token.
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  });

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);

  /// Function after user is redirected to the app from reset password email.
  Future<void> onResetPasswordEmailVerified();

  /// Function after setting a new password.
  Future<void> onPasswordReset({required String newPassword});
}
