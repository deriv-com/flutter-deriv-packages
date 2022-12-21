import '../../../../deriv_auth.dart';

/// Client Interface to implement [Signup] functions.
abstract class BaseSignupRepository {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Function before sending signup email.
  Future<void> onBeforeSignupEmailSent();

  /// Function after sending signup email.
  Future<void> onSignupEmailSent();

  /// Functionality after sign up email is clicked.
  Future<void> onSignupEmailVerified();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);
}
