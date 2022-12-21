import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/deriv_auth/IO/reset_password_io.dart';
import 'package:deriv_auth/src/deriv_auth/core/constants.dart';

import '../../../../deriv_auth.dart';

part 'reset_password_state.dart';

/// Reset Password cubit
class ResetPassCubit extends Cubit<ResetPassState> implements ResetPasswordIO {
  /// Initialize a ResetPassCubit with [ResetPassInitialState].
  ResetPassCubit({
    required this.service,
  }) : super(const ResetPassInitialState());

  /// Authentication Service.
  final BaseResetPasswordService service;

  /// Sends email verification for resetting password.
  @override
  Future<void> sendVerificationEmail(String email) async {
    try {
      await service.onBeforeResetPasswordEmailSent();

      /// send the verification email
      final VerifyEmailResponseEntity response =
          await service.sendVerificationEmail(
        VerifyEmailRequestEntity(
          verifyEmail: email,
          type: resetPasswordEmailType,
        ),
      );

      if (response.verifyEmail ?? false) {
        await service.onResetPasswordEmailSent();
        emit(const ResetPassEmailSentState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
  }

  /// Changes user password using provided 'token'
  @override
  Future<void> changePassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      await service.onResetPasswordEmailVerified();

      /// Reset password request
      final bool isPasswordReset = await service.resetPassword(
        verificationCode: token,
        newPassword: newPassword,
      );

      /// Check if password is reset
      if (isPasswordReset) {
        await service.onPasswordReset(newPassword: newPassword);
        emit(const ResetPassPasswordChangedState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
  }
}
