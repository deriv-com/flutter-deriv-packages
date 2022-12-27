import 'package:deriv_auth/core/models/account/account.dart';
import 'package:deriv_auth/core/models/veryify_email/verify_email.dart';
import 'package:deriv_auth/features/signup/models/new_virtial_account/new_virtual_account_request_model.dart';

/// Interface for [Signup] functions.
abstract class BaseSignupService {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);

  /// Creatiing new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
