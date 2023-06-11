import 'package:deriv_auth/deriv_auth.dart';

class ExampleAuthRepository implements BaseAuthRepository {
  @override
  Future<AuthorizeResponseEntity> authorize(String? token) {
    return Future.value(const AuthorizeResponseEntity());
  }

  @override
  Future<AccountModel?> getDefaultAccount() {
    return Future.value(AccountModel(
      accountId: "accountId",
    ));
  }

  @override
  Future<List<AccountModel>> getLatestAccounts() {
    return Future.value([
      AccountModel(
        accountId: "accountId",
      )
    ]);
  }

  @override
  Future<void> logout() {
    return Future.value();
  }

  @override
  Future<void> onLogin(AuthorizeEntity authorizeEntity) {
    return Future.value();
  }

  @override
  Future<void> onLogout() {
    return Future.value();
  }

  @override
  Future<void> onPostLogout() {
    return Future.value();
  }
}
