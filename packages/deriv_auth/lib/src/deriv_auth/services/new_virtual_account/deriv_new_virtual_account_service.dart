import '../../../../deriv_auth.dart';

/// [DerivGo] implementation for [BaseNewVirtualAccountService].
class DerivNewVirtualAccountService extends BaseNewVirtualAccountService {
  /// Initialize [DerivNewVirtualAccountService].
  DerivNewVirtualAccountService({required this.repository});

  /// Repository implemented by client.
  final BaseNewVirtualAccountRepository repository;

  @override
  Future<AccountModel> openNewVirtualAccount(
          {required NewVirtualAccountRequestModel newVirtualAccountModel}) =>
      repository.openNewVirtualAccount(
        newVirtualAccountModel: newVirtualAccountModel,
      );
}
