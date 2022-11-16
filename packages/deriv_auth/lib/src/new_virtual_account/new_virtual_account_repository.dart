import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_model.dart';
import 'package:deriv_auth/src/new_virtual_account/new_virtual_account_request_model.dart';

abstract class BaseNewVirtualAccountRepository {
  Future<NewAccountVirtual> openNewVirtualAccount(
    NewVirtualAccountRequestModel request,
  );
}
