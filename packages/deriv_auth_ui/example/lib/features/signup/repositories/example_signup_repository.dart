import 'package:deriv_auth/deriv_auth.dart';

class ExampleSignupRepository implements BaseSignupRepository {
  @override
  Future<DateTime> getClientServerTime() => Future.value(DateTime.now());

  @override
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  }) =>
      Future.value(AccountModel(accountId: '1'));

  @override
  Future<VerifyEmailResponseEntity> sendVerificationEmail(
          VerifyEmailRequestEntity request) =>
      Future.value(const VerifyEmailResponseEntity(verifyEmail: true));
}
