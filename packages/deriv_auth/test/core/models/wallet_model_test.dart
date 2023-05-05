import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wallet', () {
    const String mockAccountId = '000000';
    const Wallet mockWallet = Wallet(
      accountId: mockAccountId,
      balance: 1000,
      currency: 'USD',
      paymentMethod: 'Bank transfer',
    );
    const Map<String, dynamic> mockWalletJson = <String, dynamic>{
      'account_id': mockAccountId,
      'currency': 'USD',
      'balance': 1000.0,
      'payment_method': 'Bank transfer',
    };

    test('supports fromJson', () {
      final Wallet wallet = Wallet.fromJson(mockWalletJson);

      expect(wallet.accountId, mockAccountId);
      expect(wallet.balance, 1000);
      expect(wallet.currency, 'USD');
      expect(wallet.paymentMethod, 'Bank transfer');
    });

    test(
        'supports toJson',
        () => expect(
              mockWallet.toJson(),
              <String, dynamic>{
                'account_id': '000000',
                'balance': 1000.0,
                'currency': 'USD',
                'payment_method': 'Bank transfer',
              },
            ));

    test('has valid copyWith', () {
      expect(mockWallet.copyWith(accountId: '123').accountId, '123');
      expect(mockWallet.copyWith(balance: 2000).balance, 2000);
      expect(mockWallet.copyWith(currency: 'EUR').currency, 'EUR');
      expect(mockWallet.copyWith(paymentMethod: 'Credit card').paymentMethod,
          'Credit card');
      expect(mockWallet.copyWith().accountId, mockAccountId);
    });
  });
}
