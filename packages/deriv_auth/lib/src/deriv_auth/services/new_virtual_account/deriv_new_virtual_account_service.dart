import 'package:deriv_auth/src/deriv_auth/services/new_virtual_account/base_new_virtual_account_service.dart';

import '../../../../deriv_auth.dart';

/// [DerivGo] implementation for [BaseNewVirtualAccountService].
class DerivNewVirtualAccountService extends BaseNewVirtualAccountService {
  /// Initialize [DerivNewVirtualAccountService].
  DerivNewVirtualAccountService({required this.repository});

  /// Repository implemented by client.
  final BaseNewVirtualAccountRepository repository;

  @override
  Future<void> onBeforeNewVirtualAccountOpened() =>
      repository.onBeforeNewVirtualAccountOpened();

  @override
  Future<AccountModel> openNewVirtualAccount(
          {required NewVirtualAccountRequestModel newVirtualAccountModel}) =>
      repository.openNewVirtualAccount(
        newVirtualAccountModel: newVirtualAccountModel,
      );

  @override
  Future<void> onVirtualAccountOpened({required AccountModel newAccount}) =>
      repository.onVirtualAccountOpened(
        newAccount: newAccount,
      );
}
