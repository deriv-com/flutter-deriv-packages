import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_model.dart';

abstract class BaseNewVirtualAccountRepository {
  Future<NewAccountVirtual> openNewVirtualAccount({
    required String verificationCode,
    required String clientPassword,
    required String residence,
  });
}
