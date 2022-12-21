import '../../../deriv_auth.dart';

/// Functionality provoded by [NewVirtualAccountCubit].
abstract class NewVirtualAccountIO {
  /// Submit request for new virtual account.
  Future<void> openNewVirtualAccount({
    required NewVirtualAccountRequestModel newVirtualAccountModel,
  });
}
