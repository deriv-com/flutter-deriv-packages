import 'package:deriv_auth/features/signup/cubit/signup_cubit.dart';
import 'package:deriv_auth/features/signup/models/new_virtual_account_request_model.dart';

/// Required functionalities for signing up.
abstract class DerivSignupIO {
  /// Submits verify email request.
  Future<void> sendVerificationEmail(String email);

  /// Submit request for new virtual account.
  Future<void> openNewVirtualAccount(
    NewVirtualAccountRequestModel newVirtualAccountModel,
  );

  /// Deriv signup output.
  Stream<DerivSignupState> get output;
}
