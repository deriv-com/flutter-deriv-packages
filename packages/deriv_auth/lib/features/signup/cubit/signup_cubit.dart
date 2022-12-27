import 'package:bloc/bloc.dart';
import 'package:deriv_auth/core/models/account/account.dart';
import 'package:deriv_auth/core/models/veryify_email/verify_email.dart';
import 'package:deriv_auth/core/shared/constants/constants.dart';
import 'package:deriv_auth/features/signup/models/new_virtial_account/new_virtual_account_request_model.dart';
import 'package:deriv_auth/features/signup/services/base_signup_service.dart';
import 'package:deriv_auth/features/signup/services/signup_io.dart';
import 'package:intl/intl.dart';

part 'signup_state.dart';

/// Cubit to manage Sign up.
class DerivSignupCubit extends Cubit<DerivSignupState> implements SignupIO {
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
  Future<void> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  }) async {
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
}
