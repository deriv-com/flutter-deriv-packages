import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wallet', () {
    const String mockAccountId = '000000';
    const WalletLinkedToItem mockWalletLinkedToItem = WalletLinkedToItem(
      accountId: mockAccountId,
      platform: PlatformEnum.deriv,
    );
    const Map<String, dynamic> mockWalletLinkedToItemJson = <String, dynamic>{
      'account_id': mockAccountId,
      'platform': 'deriv',
    };

    test(
        'supports fromJson',
        () => expect(
            WalletLinkedToItem.fromJson(mockWalletLinkedToItemJson),
            isA<WalletLinkedToItem>().having(
              (WalletLinkedToItem x) => x.accountId,
              'accountId',
              mockAccountId,
            )));

    test(
        'supports toJson',
        () => expect(
              mockWalletLinkedToItem.toJson(),
              <String, dynamic>{
                'account_id': '000000',
                'balance': null,
                'currency': null,
                'platform': 'deriv',
              },
            ));

    test('has valid copyWith', () {
      expect(
          mockWalletLinkedToItem.copyWith(accountId: '123').accountId, '123');
      expect(mockWalletLinkedToItem.copyWith().accountId, mockAccountId);
    });
  });
}
