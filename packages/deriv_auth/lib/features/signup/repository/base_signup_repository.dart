import 'package:deriv_auth/core/models/account_model.dart';
import 'package:deriv_auth/core/models/verify_email_model.dart';
import 'package:deriv_auth/features/signup/models/new_virtual_account_request_model.dart';

/// Client Interface to implement [Signup] functions.
abstract class BaseSignupRepository {
  /// Gets current server time from client.
  Future<DateTime> getClientServerTime();

  /// Send Verification email when signing up and resetting password.
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
      VerifyEmailRequestEntity request);

  /// Creating new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
