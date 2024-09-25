import 'package:deriv_auth/deriv_auth.dart';

/// Extensions on [AccountModel].
extension AccountModelExtension on AccountModel {
  /// Check if [AccountModel] is supported or not.
  bool get isSupported =>
      // CR will also cover CRW.
      accountId.toUpperCase().contains('CR') ||
      accountId.toUpperCase().contains('VRTC') ||
      accountId.toUpperCase().contains('VRW');
}

/// Extensions on [AccountModel].
extension AccountListItemExtension on AccountListItem {
  /// Check if [AccountModel] is supported or not.
  bool get isSupported =>

      // CR will also cover CRW. and loginid should always be present.
      loginid!.toUpperCase().contains('CR') ||
      loginid!.toUpperCase().contains('VRTC') ||
      loginid!.toUpperCase().contains('VRW');

  /// checks if [AccountListItem] is disabled or not.
  bool get isNotDisabled => !isDisabled!;
}
