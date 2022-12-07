import 'package:bloc/bloc.dart';

import '../../../../deriv_auth.dart';

part 'reset_password_state.dart';

/// Reset Password cubit
class ResetPassCubit extends Cubit<ResetPassState> {
  /// Constructor
  ///
  ResetPassCubit({
    required this.authService,
  }) : super(const ResetPassInitialState());

  /// AuthService
  final BaseAuthService authService;

  /// Sends email verification for resetting password.
  ///
  Future<void> sendEmailVerification(String email) async {
    try {
      /// send the verification email
      ///
      final bool isEmailSent = await authService.sendEmailVerification(email);

      /// check if the email is sent
      ///
      if (isEmailSent) {
        emit(const ResetPassEmailSentState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
  }

  /// Verify password reset email
  ///
  Future<void> onEmailVerified(String url) async {
    final String? verificationToken = authService.getVerificationToken(url);

    if (verificationToken != null) {
      ResetPassEmailVerifiedState(token: verificationToken);
    }
  }

  /// Changes user password using provided 'token'
  ///
  Future<void> changePassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      /// Reset password request
      ///
      final bool isPasswordReset = await authService.resetPassword(
        verificationCode: token,
        newPassword: newPassword,
      );

      /// Check if password is reset
      ///
      if (isPasswordReset) {
        emit(const ResetPassPasswordChangedState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
  }
}
