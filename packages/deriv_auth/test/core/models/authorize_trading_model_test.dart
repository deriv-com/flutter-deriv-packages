import 'package:deriv_auth/core/models/authorize_model.dart';
import 'package:test/test.dart';

void main() {
  const String accountId = '0000000';
  const TradingLinkedToItem mockTradingLinkToItem = TradingLinkedToItem(
    accountId: accountId,
    balance: 'mockBalance',
    currency: 'mockCurrency',
    paymentMethod: 'mockPaymentMethod',
  );
  const AuthorizeTrading mockAuthorizeTrading = AuthorizeTrading(
    linkedTo: <TradingLinkedToItem>[mockTradingLinkToItem],
  );
  const Map<String, dynamic> mockAuthorizeTradingJson = <String, dynamic>{
    'linked_to': <Map<String, dynamic>>[
      <String, dynamic>{
        'account_id': accountId,
        'balance': 'mockBalance',
        'currency': 'mockCurrency',
        'payment_method': 'mockPaymentMethod',
      },
    ]
  };

  group('AuthorizeTrading', () {
    test(
      'supports toJson',
      () => expect(
        mockAuthorizeTrading.toJson(),
        mockAuthorizeTradingJson,
      ),
    );

    test(
      'supports fromJson',
      () {
        expect(
          AuthorizeTrading.fromJson(mockAuthorizeTradingJson)
              .linkedTo
              ?.first
              .accountId,
          accountId,
        );
      },
    );

    test('has valid copyWith', () {
      expect(mockAuthorizeTrading.copyWith().linkedTo,
          mockAuthorizeTrading.linkedTo);
      expect(
          mockAuthorizeTrading
              .copyWith(linkedTo: <TradingLinkedToItem>[]).linkedTo,
          <TradingLinkedToItem>[]);
    });
  });
}
