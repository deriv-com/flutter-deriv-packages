import 'package:collection/collection.dart';
import 'package:deriv_auth/core/models/account_model.dart';

/// If [accounts] contains a VR account return the [AccountModel] object
/// otherwise returns [null].
AccountModel? getVRAccount(List<AccountModel> accounts) =>
    accounts.firstWhereOrNull((AccountModel account) => isVRAccount(account));

/// If [accounts] contains a VR account return true
/// otherwise returns false.
bool hasVRAccount(List<AccountModel> accounts) =>
    accounts.any((AccountModel account) => isVRAccount(account));

/// Returns true if the [account] is a VR account, otherwise returns false.
bool isVRAccount(AccountModel account) =>
    account.accountId.toUpperCase().contains('VR');

/// Returns true if the [account] is a CR account, otherwise returns false.
bool isCRAccount(AccountModel account) =>
    account.accountId.toUpperCase().contains('CR');
