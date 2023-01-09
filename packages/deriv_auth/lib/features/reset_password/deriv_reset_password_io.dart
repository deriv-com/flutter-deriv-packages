import 'package:deriv_auth/features/reset_password/cubit/reset_password_cubit.dart';

/// Required functionality for resetting password.
abstract class DerivResetPasswordIO {
  /// Sends email verification for resetting password.
  Future<void> sendVerificationEmail(String email);

  /// Changes user password using provided 'token'
  Future<void> changePassword({
    required String token,
    required String newPassword,
  });

  /// Deriv reset pass output.
  Stream<DerivResetPassState> get output;
}
