import 'package:deriv_auth/core/models/verify_email_model.dart';

/// Client Interface to implement [ResetPassword] functions.
abstract class BaseResetPasswordRepository {
  /// Change user password using provided token.
  Future<bool> resetPassword({
    required String verificationCode,
    required String newPassword,
  });

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);
}
