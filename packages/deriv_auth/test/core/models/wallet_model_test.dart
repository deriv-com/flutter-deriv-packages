import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wallet', () {
    const String mockAccountId = '000000';
    const Wallet mockWallet = Wallet(
      accountId: mockAccountId,
    );
    const Map<String, dynamic> mockWalletJson = <String, dynamic>{
      'account_id': mockAccountId,
    };

    test(
        'supports fromJson',
        () => expect(
            Wallet.fromJson(mockWalletJson),
            isA<Wallet>().having(
              (Wallet x) => x.accountId,
              'accountId',
              mockAccountId,
            )));

    test(
        'supports toJson',
        () => expect(
              mockWallet.toJson(),
              <String, dynamic>{
                'account_id': '000000',
                'balance': null,
                'currency': null,
                'payment_method': null
              },
            ));

    test('has valid copyWith', () {
      expect(mockWallet.copyWith(accountId: '123').accountId, '123');
      expect(mockWallet.copyWith().accountId, mockAccountId);
    });
  });
}
