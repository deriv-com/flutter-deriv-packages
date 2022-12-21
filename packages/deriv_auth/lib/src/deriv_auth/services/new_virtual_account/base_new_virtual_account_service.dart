import '../../../../deriv_auth.dart';

/// Interface for [NewVirtualAccount] functions.
abstract class BaseNewVirtualAccountService {
  /// Function before creating a new virtual account.
  Future<void> onBeforeNewVirtualAccountOpened();

  /// Creatiing new virtual account.
  Future<AccountModel> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });

  /// Function after creating a new virtual account.
  Future<void> onVirtualAccountOpened({
    required AccountModel newAccount,
  });
}
