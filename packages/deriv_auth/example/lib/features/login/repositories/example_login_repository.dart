import 'package:deriv_auth/core/models/landig_comany_model.dart';
import 'package:deriv_auth/deriv_auth.dart';

class ExampleLoginRepository implements BaseAuthRepository {
  @override
  Future<AuthorizeResponseEntity> authorize(
    String? token, {
    List<String>? tokenList,
  }) =>
      Future.value(const AuthorizeResponseEntity());

  @override
  Future<AccountModel?> getDefaultAccount() => Future.value(
        AccountModel(
          accountId: "accountId",
        ),
      );

  @override
  Future<List<AccountModel>> getLatestAccounts() => Future.value([
        AccountModel(
          accountId: "accountId",
        ),
      ]);

  @override
  Future<void> logout({String? loginId}) => Future.value();

  @override
  Future<void> onLogin(AuthorizeEntity authorizeEntity) => Future.value();

  @override
  Future<void> onLogout() => Future.value();

  @override
  Future<void> onPostLogout() => Future.value();

  @override
  Future<LandingCompanyEntity> getLandingCompany(String? countryCode) =>
      Future.value(
        const LandingCompanyEntity(),
      );
}
