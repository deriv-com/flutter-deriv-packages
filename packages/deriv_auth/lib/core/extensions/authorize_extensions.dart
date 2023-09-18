import 'package:deriv_auth/core/models/account_model.dart';

/// Extensions on [AccountModel].
extension AccountModelExtension on AccountModel {
  /// Check if [AccountModel] is supported or not.
  bool get isSupported =>
      // CR will also cover CRW.
      accountId.toUpperCase().contains('CR') ||
      accountId.toUpperCase().contains('VRTC') ||
      accountId.toUpperCase().contains('VRW');
}
