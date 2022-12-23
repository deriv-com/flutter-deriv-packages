import '../../../../deriv_auth.dart';

/// Interface for [NewVirtualAccount] functions.
abstract class BaseNewVirtualAccountService {
  /// Creatiing new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
