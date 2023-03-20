import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  const TradingLinkedToItem mockTradingLinkToItem = TradingLinkedToItem(
    accountId: '0000000',
  );

  group('TradingLinkedToItem', () {
    test('has valid copyWith', () {
      expect(mockTradingLinkToItem.copyWith(accountId: '123').accountId, '123');
      expect(mockTradingLinkToItem.copyWith().accountId, '0000000');
    });
  });
}
