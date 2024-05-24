import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

import 'mocks/mock_account_models.dart';

void main() {
  group('Test account helper functions.', () {
    test('getVRAccount returns correct account.', () {
      expect(getVRAccount(mockAccountList), isA<AccountModel>());
      expect(getVRAccount(<AccountModel>[]), null);
    });

    test('hasVRAccount returns correct boolean.', () {
      expect(hasVRAccount(mockAccountList), true);
      expect(hasVRAccount(<AccountModel>[]), false);
    });

    test('isVRAccount returns correct boolean.', () {
      expect(
          isVRAccount(mockAccountList.firstWhere(
              (AccountModel account) => account.accountId.contains('VR'))),
          true);
      expect(
          isVRAccount(mockAccountList.firstWhere(
              (AccountModel account) => account.accountId.contains('CR'))),
          false);
    });

    test('isCRAccount returns correct boolean.', () {
      expect(
          isCRAccount(mockAccountList.firstWhere(
              (AccountModel account) => account.accountId.contains('CR'))),
          true);
      expect(
          isCRAccount(mockAccountList.firstWhere(
              (AccountModel account) => account.accountId.contains('VR'))),
          false);
    });
  });
}
