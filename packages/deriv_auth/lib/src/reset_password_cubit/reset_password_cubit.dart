import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';

part 'reset_password_state.dart';

/// This class handles the business logic related to resetting user password.
class ResetPassCubit extends Cubit<ResetPassState> {
  /// Initializes reset pass cubit.
  ResetPassCubit({required this.repo}) : super(const ResetPassInitialState());

  final IAuthRepo repo;

  static const String _resetPassType = 'reset_password';

  /// Sends email verification for resetting password.
  Future<void> sendEmailVerification(String email) async {
    try {
      final VerifyEmailResponseEntity result = await repo.verifyEmail(
        VerifyEmailRequestEntity(verifyEmail: email, type: _resetPassType),
      );

      if (result.verifyEmail ?? false) {
        emit(const ResetPassEmailSentState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
    // } on UserException catch (e) {
    //   emit(ResetPassErrorState(errorMessage: e.message));
    // }
  }

  /// Changes user password using provided `token`.
  Future<void> changePassword({
    required String token,
    required String password,
  }) async {
    try {
      final ResetPasswordResponseEntity result = await repo.resetPassword(
        ResetPasswordRequestEntity(
          verificationCode: token,
          newPassword: password,
        ),
      );

      if (result.resetPassword ?? false) {
        emit(const ResetPassPasswordChangedState());
      }
    } on Exception catch (e) {
      emit(ResetPassErrorState(errorMessage: e.toString()));
    }
    // } on UserException catch (e) {
    //   emit(ResetPassErrorState(errorMessage: e.message));
    // }
  }

  Future<void> onEmailVerified(String url) async {
    final Uri uri = Uri.parse(url);

    if (uri.queryParameters.containsKey('code')) {
      emit(
        ResetPassEmailVerifiedState(token: uri.queryParameters['code']!),
      );
    }
  }

  /// TODO (Naif) - figure out where this is used
  /// TODO (Naif) - in multipliers so you can call onEmailVerified instead
  ///

  // void _initialUniLink() {
  //   _linkStream = linkStream.listen((String? url) {
  //     if (url == null) {
  //       return;
  //     }

  //     final Uri uri = Uri.parse(url);

  //     if (uri.queryParameters.containsKey('code')) {
  //       _linkStream?.cancel();

  //       emit(
  //         ResetPassEmailVerifiedState(token: uri.queryParameters['code']!),
  //       );
  //     }
  //   });
  // }
}
