import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('LinkToItem', () {
    test('has valid copyWith', () {
      const String mockAccountId = 'accountId';
      const String updatedAccountId = 'accountId2';
      const LinkedToItem linkedToItem = LinkedToItem(
        accountId: mockAccountId,
        balance: '1000',
        currency: 'USD',
        paymentMethod: 'Bank',
      );

      expect(
        linkedToItem.copyWith(accountId: updatedAccountId).accountId,
        updatedAccountId,
      );
      expect(
        linkedToItem.copyWith(balance: '2000').balance,
        '2000',
      );
      expect(
        linkedToItem.copyWith(currency: 'EUR').currency,
        'EUR',
      );
      expect(
        linkedToItem.copyWith(paymentMethod: 'Credit Card').paymentMethod,
        'Credit Card',
      );
      expect(linkedToItem.copyWith().accountId, mockAccountId);
    });
  });
}
