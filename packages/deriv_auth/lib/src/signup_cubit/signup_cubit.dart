import 'package:bloc/bloc.dart';
import 'package:deriv_auth/deriv_auth.dart';
import 'package:intl/intl.dart';

import '../models/verify_email/verify_email.dart';

part 'signup_state.dart';

/// Signup cubit.
class SignupCubit extends Cubit<SignupState> {
  /// Initializes the cubit with an initial state of [SignupInitialState].
  ///
  SignupCubit({required this.repo}) : super(const SignupInitialState());

  final IAuthRepo repo;

  /// Submits verify email request.
  Future<void> submitVerifyEmail(String email) async {
    emit(const SignupProgressState());

    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());

    final Map<String, String> urlParameters = <String, String>{
      'signup_device': 'mobile',
      'utm_source': 'deriv_direct',
      'date_first_contact': formattedDate,
    };

    try {
      final VerifyEmailRequestEntity request = VerifyEmailRequestEntity(
        type: 'account_opening',
        verifyEmail: email,
        urlParameters: urlParameters,
      );

      await repo.verifyEmail(request);

      emit(const SignupDoneState());

      /// TODO (Naif) - please check this exception
      // } on APIBaseException catch (e) {
      //   emit(SignupErrorState(e.message!));
      // }
    } on Exception catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
