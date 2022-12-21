import '../../../../deriv_auth.dart';

/// Client Interface to implement [NewVirtualAccount] functions.
abstract class BaseNewVirtualAccountRepository {
  /// Functionality before creating new virtual account.
  Future<void> onBeforeNewVirtualAccountOpened();

  /// Creatiing new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });

  /// Functionality after new virtual account is opened.
  Future<void> onVirtualAccountOpened({required AccountModel newAccount});
}
