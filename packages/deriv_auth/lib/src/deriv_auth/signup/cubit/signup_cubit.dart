import 'package:bloc/bloc.dart';
import 'package:deriv_auth/src/deriv_auth/IO/signup_io.dart';
import 'package:deriv_auth/src/deriv_auth/core/constants.dart';
import 'package:intl/intl.dart';

import '../../../../deriv_auth.dart';

part 'signup_state.dart';

/// Cubit to manage Sign up.
class SignupCubit extends Cubit<SignupState> implements SignupIO {
  /// Initializes the cubit with [SignupInitialState].
  SignupCubit({
    required this.service,
  }) : super(const SignupInitialState());

  /// Authentication Service
  final BaseSignupService service;

  @override
  Future<void> sendVerificationEmail(String email) async {
    try {
      emit(const SignupProgressState());

      final DateTime currentServerTime = await service.getClientServerTime();

      final Map<String, String> urlParameters = <String, String>{
        'signup_device': 'mobile',
        'utm_source': 'deriv_direct',
        'date_first_contact': DateFormat(dateFormat).format(currentServerTime),
      };

      final VerifyEmailResponseModel emailResponse =
          await service.sendVerificationEmail(
        VerifyEmailRequestEntity(
          type: accountOpeningEmailType,
          verifyEmail: email,
          urlParameters: urlParameters,
        ),
      );

      if (emailResponse.verifyEmail ?? false) {
        emit(const SignupDoneState());
      }
    } on Exception catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
