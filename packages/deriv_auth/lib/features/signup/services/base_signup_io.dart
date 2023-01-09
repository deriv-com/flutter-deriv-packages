import 'package:deriv_auth/features/signup/models/new_virtial_account/new_virtual_account_request_model.dart';

/// Required functiontality for signing up.
abstract class BaseSignupIO {
  /// Submits verify email request.
  Future<void> sendVerificationEmail(String email);

  /// Submit request for new virtual account.
  Future<void> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
