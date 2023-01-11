import 'package:bloc/bloc.dart';
import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:deriv_auth/features/reset_password/services/base_reset_password_service.dart';
import 'package:deriv_auth/features/reset_password/deriv_reset_password_io.dart';

part 'reset_password_state.dart';

/// Reset Password cubit
class DerivResetPassCubit extends Cubit<DerivResetPassState>
    implements DerivResetPasswordIO {
  /// Initialize a DerivResetPassCubit with [DerivResetPassInitialState].
  DerivResetPassCubit({
    required this.service,
  }) : super(const DerivResetPassInitialState());

  /// Reset Password Service.
  final BaseResetPasswordService service;

  /// Sends email verification for resetting password.
  @override
  Future<void> sendVerificationEmail(String email) async {
    try {
      /// send the verification email
      final VerifyEmailResponseEntity response =
          await service.sendVerificationEmail(
        VerifyEmailRequestEntity(
          verifyEmail: email,
          type: resetPasswordEmailType,
        ),
      );

      if (response.verifyEmail ?? false) {
        emit(const DerivResetPassEmailSentState());
      }
    } on Exception catch (e) {
      emit(DerivResetPassErrorState(errorMessage: e.toString()));
    }
  }

  /// Changes user password using provided 'token'
  @override
  Future<void> changePassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      /// Reset password request
      final bool isPasswordReset = await service.resetPassword(
        verificationCode: token,
        newPassword: newPassword,
      );

      /// Check if password is reset
      if (isPasswordReset) {
        emit(const DerivResetPassPasswordChangedState());
      }
    } on Exception catch (e) {
      emit(DerivResetPassErrorState(errorMessage: e.toString()));
    }
  }

  @override
  Stream<DerivResetPassState> get output => stream;
}
