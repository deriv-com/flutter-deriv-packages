import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';

part 'signup_state.dart';

/// Sign up cubit
///
class SignupCubit extends Cubit<SignupState> {
  /// Initializes the cubit with an initial state of [SignupInitialState].
  ///
  SignupCubit({
    required this.authService,
  }) : super(const SignupInitialState());

  /// Authentication Service
  ///
  final BaseAuthService authService;

  /// Submits verify email request.
  ///
  Future<void> submitVerifyEmail(String email) async {
    try {
      emit(const SignupProgressState());

      await authService.sendSignupEmail(email);

      emit(const SignupDoneState());
    } on Exception catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
