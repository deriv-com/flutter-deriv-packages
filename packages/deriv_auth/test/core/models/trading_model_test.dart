import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('Trading', () {
    const String mockAccountId = '000000';
    const Trading mockTrading = Trading(
        linkedTo: <LinkedToItem>[LinkedToItem(accountId: mockAccountId)]);

    const Map<String, dynamic> mockTradingJson = <String, dynamic>{
      'linked_to': <Map<String, dynamic>>[
        <String, dynamic>{'account_id': mockAccountId},
      ]
    };

    test(
        'supports fromJson',
        () => expect(
              Trading.fromJson(mockTradingJson).linkedTo,
              isA<List<LinkedToItem>>().having(
                  (List<LinkedToItem> x) => x.first.accountId,
                  'accountId',
                  mockAccountId),
            ));

    test(
        'supports toJson',
        () => expect(mockTrading.toJson(), <String, dynamic>{
              'linked_to': <Map<String, dynamic>>[
                <String, dynamic>{
                  'account_id': mockAccountId,
                  'balance': null,
                  'currency': null,
                  'payment_method': null,
                }
              ]
            }));

    test('supports copyWith', () {
      expect(mockTrading.copyWith(linkedTo: <LinkedToItem>[]).linkedTo,
          <LinkedToItem>[]);
      expect(mockTrading.copyWith().linkedTo, <LinkedToItem>[
        const LinkedToItem(
          accountId: mockAccountId,
        )
      ]);
    });
  });
}
