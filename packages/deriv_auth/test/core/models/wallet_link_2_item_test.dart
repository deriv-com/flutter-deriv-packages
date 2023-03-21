import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/test.dart';

void main() {
  const String mockAccountId = '000000';
  const WalletLinkedToItem2 mockWalletLinkedToItem = WalletLinkedToItem2(
    accountId: mockAccountId,
    platform: PlatformEnum.deriv,
    balance: '1000',
    currency: 'USD',
  );

  group('WalletLinkToItem2', () {
    test('has a valid copyWith', () {
      expect(
          mockWalletLinkedToItem.copyWith(accountId: '123').accountId, '123');
      expect(
          mockWalletLinkedToItem
              .copyWith(platform: PlatformEnum.dxtrade)
              .platform,
          PlatformEnum.dxtrade);
      expect(mockWalletLinkedToItem.copyWith(balance: '2000').balance, '2000');
      expect(mockWalletLinkedToItem.copyWith(currency: 'EUR').currency, 'EUR');
      expect(mockWalletLinkedToItem.copyWith().accountId, mockAccountId);
    });
  });
}
