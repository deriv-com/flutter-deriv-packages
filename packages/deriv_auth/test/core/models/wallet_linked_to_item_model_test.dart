import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wallet', () {
    const String mockAccountId = '000000';
    const WalletLinkedToItem mockWalletLinkedToItem = WalletLinkedToItem(
      accountId: mockAccountId,
      platform: PlatformEnum.deriv,
      balance: '1000',
      currency: 'USD',
    );
    const Map<String, dynamic> mockWalletLinkedToItemJson = <String, dynamic>{
      'account_id': mockAccountId,
      'platform': 'deriv',
      'balance': '1000',
      'currency': 'USD',
    };

    test('supports fromJson', () {
      final WalletLinkedToItem walletLinkedToItem =
          WalletLinkedToItem.fromJson(mockWalletLinkedToItemJson);

      expect(walletLinkedToItem.accountId, mockAccountId);
      expect(walletLinkedToItem.platform, PlatformEnum.deriv);
      expect(walletLinkedToItem.balance, '1000');
      expect(walletLinkedToItem.currency, 'USD');
    });

    test(
        'supports toJson',
        () => expect(
              mockWalletLinkedToItem.toJson(),
              <String, dynamic>{
                'account_id': '000000',
                'balance': '1000',
                'currency': 'USD',
                'platform': 'deriv',
              },
            ));

    test('has valid copyWith', () {
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
