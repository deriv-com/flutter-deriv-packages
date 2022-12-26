import '../../../../deriv_auth.dart';

/// Client Interface to implement [Signup] functions.
abstract class BaseSignupRepository {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request,);
}
