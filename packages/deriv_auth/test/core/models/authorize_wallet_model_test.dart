import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  const String accountId = '000000';
  const WalletLinkedToItem2 mockWalletLinkedToItem = WalletLinkedToItem2(
    accountId: accountId,
    platform: PlatformEnum.deriv,
    balance: '1000',
    currency: 'USD',
  );
  const AuthorizeWallet mockAuthorizeWallet = AuthorizeWallet(
    currency: 'USD',
    balance: 1000,
    paymentMethod: 'bank',
    accountId: accountId,
    linkedTo: <WalletLinkedToItem2>[mockWalletLinkedToItem],
  );

  const Map<String, dynamic> mockAuthorizeWalletJson = <String, dynamic>{
    'account_id': accountId,
    'currency': 'USD',
    'balance': 1000,
    'payment_method': 'bank',
    'linked_to': <Map<String, dynamic>>[
      <String, dynamic>{
        'account_id': accountId,
        'platform': 'deriv',
      }
    ],
  };

  group('AuthorizeWallet', () {
    test(
        'supports toJson',
        () => expect(
              mockAuthorizeWallet.toJson(),
              <String, dynamic>{
                'account_id': '000000',
                'balance': 1000.0,
                'currency': 'USD',
                'linked_to': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'account_id': '000000',
                    'balance': '1000',
                    'currency': 'USD',
                    'platform': 'deriv',
                  }
                ],
                'payment_method': 'bank',
              },
            ));

    test('supports fromJson', () {
      final AuthorizeWallet authorizeWallet =
          AuthorizeWallet.fromJson(mockAuthorizeWalletJson);
      expect(
        authorizeWallet.accountId,
        accountId,
      );
      expect(
        authorizeWallet.balance,
        1000,
      );
      expect(
        authorizeWallet.currency,
        'USD',
      );
      expect(
        authorizeWallet.paymentMethod,
        'bank',
      );
      expect(
        authorizeWallet.linkedTo,
        isA<List<WalletLinkedToItem2>>().having(
          (List<WalletLinkedToItem2> x) => x[0].accountId,
          'accountId',
          accountId,
        ),
      );
    });

    test('has a valid copyWith', () {
      expect(mockAuthorizeWallet.copyWith(accountId: '123').accountId, '123');
      expect(
          mockAuthorizeWallet.copyWith(paymentMethod: 'not bank').paymentMethod,
          'not bank');
      expect(mockAuthorizeWallet.copyWith(currency: 'AUD').currency, 'AUD');
      expect(mockAuthorizeWallet.copyWith(balance: 2000).balance, 2000);
      expect(mockAuthorizeWallet.copyWith().accountId, accountId);
    });
  });
}
