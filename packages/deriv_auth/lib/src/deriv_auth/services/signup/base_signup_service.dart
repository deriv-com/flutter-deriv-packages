import '../../../../deriv_auth.dart';

/// Interface for [Signup] functions.
abstract class BaseSignupService {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Function before sending signup email.
  Future<void> onBeforeSignupEmailSent();

  /// Function after sending signup email.
  Future<void> onSignupEmailSent();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);
}
