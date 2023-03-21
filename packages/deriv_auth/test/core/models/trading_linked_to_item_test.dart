import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  const TradingLinkedToItem mockTradingLinkToItem = TradingLinkedToItem(
    accountId: '0000000',
    balance: '1000',
    currency: 'USD',
    paymentMethod: 'Bank',
  );

  group('TradingLinkedToItem', () {
    test('has valid copyWith', () {
      expect(mockTradingLinkToItem.copyWith(accountId: '123').accountId, '123');
      expect(mockTradingLinkToItem.copyWith(balance: '2000').balance, '2000');
      expect(mockTradingLinkToItem.copyWith(currency: 'EUR').currency, 'EUR');
      expect(
          mockTradingLinkToItem
              .copyWith(paymentMethod: 'Credit Card')
              .paymentMethod,
          'Credit Card');
      expect(mockTradingLinkToItem.copyWith().accountId, '0000000');
    });
  });
}
