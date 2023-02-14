import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:deriv_auth/features/signup/base_signup_io.dart';
import 'package:deriv_auth/features/signup/models/new_virtual_account_request_model.dart';
import 'package:deriv_auth/features/signup/services/base_signup_service.dart';

part 'signup_state.dart';

/// Cubit to manage Sign up.
class DerivSignupCubit extends Cubit<DerivSignupState>
    implements DerivSignupIO {
  /// Initializes the cubit with [SignupInitialState].
  DerivSignupCubit({
    required this.service,
  }) : super(const DerivSignupInitialState());

  /// Sign up service
  final BaseSignupService service;

  @override
  Future<void> sendVerificationEmail(String email) async {
    try {
      emit(const DerivSignupProgressState());

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
        emit(const DerivSignupEmailSentState());
      }
    } on Exception catch (e) {
      emit(DerivSignupErrorState(e.toString()));
    }
  }

  @override
  Future<void> openNewVirtualAccount(
    NewVirtualAccountRequestModel newVirtualAccountModel,
  ) async {
    try {
      emit(const DerivSignupProgressState());

      final AccountModel newAccount = await service.openNewVirtualAccount(
        newVirtualAccountModel: newVirtualAccountModel,
      );

      emit(DerivSignupDoneState(account: newAccount));
    } on Exception catch (e) {
      emit(DerivSignupErrorState(e.toString()));
    }
  }

  @override
  Stream<DerivSignupState> get output => stream;
}
