import '../../../../deriv_auth.dart';

/// Interface for [Signup] functions.
abstract class BaseSignupService {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);
}
