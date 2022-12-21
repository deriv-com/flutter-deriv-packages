/// Functiontality provided by [SignupCubit].
abstract class SignupIO {
  /// Submits verify email request.
  Future<void> sendVerificationEmail(String email);
}
