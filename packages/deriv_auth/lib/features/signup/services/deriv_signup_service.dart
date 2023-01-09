import 'package:deriv_auth/core/models/account/account.dart';
import 'package:deriv_auth/core/models/veryify_email/verify_email.dart';
import 'package:deriv_auth/features/signup/models/new_virtial_account/new_virtual_account_request_model.dart';
import 'package:deriv_auth/features/signup/repository/base_signup_repository.dart';
import 'package:deriv_auth/features/signup/services/base_signup_service.dart';

/// [DerivGo] implementation of [BaseSignupService].
class DerivSignupService extends BaseSignupService {
  /// Initialize [DerivSignupService].
  DerivSignupService({required this.repository});

  /// Client implementation of repository fucntions.
  final BaseSignupRepository repository;

  @override
  Future<DateTime> getClientServerTime() => repository.getClientServerTime();

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
          VerifyEmailRequestEntity request) =>
      repository.sendVerificationEmail(request);

  @override
  Future<AccountModel> openNewVirtualAccount(
          {required NewVirtualAccountRequestModel newVirtualAccountModel}) =>
      repository.openNewVirtualAccount(
        newVirtualAccountModel: newVirtualAccountModel,
      );
}
