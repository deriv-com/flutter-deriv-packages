import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('LinkToItem', () {
    test('has valid copyWith', () {
      const String mockAccountId = 'accountId';
      const String updatedAccountId = 'accountId2';
      const LinkedToItem linkedToItem = LinkedToItem(
        accountId: mockAccountId,
      );

      expect(
        linkedToItem.copyWith(accountId: updatedAccountId).accountId,
        updatedAccountId,
      );
      expect(linkedToItem.copyWith().accountId, mockAccountId);
    });
  });
}
