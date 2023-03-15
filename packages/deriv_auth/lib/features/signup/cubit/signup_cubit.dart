import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

import 'package:deriv_auth/core/services/referral/models/my_affiliate_referral_code_request_model.dart';
import 'package:deriv_auth/core/exceptions/referral_code_exception.dart';
import 'package:deriv_auth/core/constants/constants.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:deriv_auth/features/signup/base_signup_io.dart';
import 'package:deriv_auth/features/signup/models/new_virtual_account_request_model.dart';
import 'package:deriv_auth/core/services/api_client/http_client.dart';
import 'package:deriv_auth/core/services/referral/base_referral_code_service.dart';
import 'package:deriv_auth/core/services/referral/my_affiliate_referral_code_service.dart';
import 'package:deriv_auth/features/signup/models/signup_error_type.dart';
import 'package:deriv_auth/features/signup/services/base_signup_service.dart';

part 'signup_state.dart';

/// Cubit to manage Sign up.
class DerivSignupCubit extends Cubit<DerivSignupState>
    implements DerivSignupIO {
  /// Initializes the cubit with [DerivSignupInitialState].
  DerivSignupCubit({
    required this.service,
    this.referralService,
  }) : super(const DerivSignupInitialState());

  /// Initializes cubit for using `my affiliate` api.
  factory DerivSignupCubit.initWithMyAffiliate({
    required BaseSignupService service,
    MyAffiliateReferralCodeRequestModel? requestModel,
  }) =>
      DerivSignupCubit(
        service: service,
        referralService: requestModel == null
            ? null
            : MyAffiliateReferralCodeService(
                client: HttpClient(),
                request: requestModel,
              ),
      );

  /// Sign up service
  final BaseSignupService service;

  /// Referral service.
  final BaseReferralCodeService? referralService;

  @override
  Future<void> sendVerificationEmail(
    String email, {
    String? referralCode,
  }) async {
    try {
      emit(const DerivSignupProgressState());

      String? referralToken;

      if (referralService != null && referralCode != null) {
        referralToken = await referralService?.getReferralToken(referralCode);
      }

      final DateTime currentServerTime = await service.getClientServerTime();

      final Map<String, String> urlParameters = <String, String>{
        if (referralToken != null) 'affiliate_token': referralToken,
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
    } on ReferralCodeException catch (e) {
      emit(
        DerivSignupErrorState(
          e.message,
          type: SignupErrorType.invalidReferralCode,
        ),
      );
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
