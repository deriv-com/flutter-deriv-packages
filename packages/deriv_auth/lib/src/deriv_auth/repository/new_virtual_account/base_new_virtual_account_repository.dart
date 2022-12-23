import '../../../../deriv_auth.dart';

/// Client Interface to implement [NewVirtualAccount] functions.
abstract class BaseNewVirtualAccountRepository {
  /// Creatiing new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
