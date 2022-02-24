import 'package:flutter_deriv_api/api/account/models/balance_active_account_model.dart';

/// An extension on [BalanceActiveAccountModel].
extension AccountModelExtension on Iterable<BalanceActiveAccountModel> {
  /// If any account among [accounts] is a real account.
  bool get hasRealAccount =>
      any((BalanceActiveAccountModel account) => !account.demoAccount!);
}
