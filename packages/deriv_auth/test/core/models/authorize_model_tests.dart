import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeEntity tests.', () {
    final Map<String, dynamic> authorizeJson = <String, dynamic>{
      'account_list': <dynamic>[
        AccountListItem(
          accountCategory: AccountCategoryEnum.trading,
          createdAt: DateTime.now(),
          currency: 'USD',
          token: 'test_token',
        ).toJson(),
      ],
      'balance': 500,
      'country': 'US',
      'linked_to': <dynamic>[
        const LinkedToItem(
          loginid: 'test_loginid',
          platform: PlatformEnum.dwallet,
        ).toJson(),
      ],
      'currency': 'USD',
      'preferred_language': 'en',
      'scopes': <String>['a', 'b', 'c'],
      'user_id': 6789,
    };
    test('fromJson() should create an instance of AuthorizeEntity from JSON.',
        () {
      final AuthorizeEntity authorizeEntity =
          AuthorizeEntity.fromJson(authorizeJson);

      expect(authorizeEntity.accountList, isNotNull);
      expect(authorizeEntity.balance, 500);
      expect(authorizeEntity.country, 'US');
      expect(authorizeEntity.linkedTo!.first.loginid, 'test_loginid');
      expect(authorizeEntity.linkedTo!.first.platform, PlatformEnum.dwallet);
      expect(authorizeEntity.currency, 'USD');
      expect(authorizeEntity.preferredLanguage, 'en');
      expect(authorizeEntity.scopes, <String>['a', 'b', 'c']);
      expect(authorizeEntity.userId, 6789);
      // expect(authorizeEntity.wallet, isA<AuthorizeWallet>());
    });

    test('toJson() should return JSON map with correct values.', () {
      final AuthorizeEntity entity = AuthorizeEntity.fromJson(authorizeJson);

      final Map<String, dynamic> map = entity.toJson();

      expect(map['balance'], equals(500.0));
      expect(map['country'], equals('US'));
      expect(map['currency'], equals('USD'));
      expect(map['preferred_language'], equals('en'));
      expect(map['scopes'], equals(<String>['a', 'b', 'c']));
      expect(map['user_id'], equals(6789));
    });

    test(
        'copyWith() should create a copy of AuthorizeEntity with given parameters.',
        () {
      final AuthorizeEntity entity = AuthorizeEntity.fromJson(authorizeJson);

      final AuthorizeEntity copy = entity.copyWith(
        balance: 1000,
        country: 'UK',
        currency: 'GBP',
        preferredLanguage: 'fr',
        scopes: <String>['d', 'e', 'f'],
        userId: 1234,
      );

      expect(copy.balance, 1000);
      expect(copy.country, 'UK');
      expect(copy.currency, 'GBP');
      expect(copy.preferredLanguage, 'fr');
      expect(copy.scopes, <String>['d', 'e', 'f']);
      expect(copy.userId, 1234);
    });
    test('copyWith() null should return same instance.', () {
      final AuthorizeEntity entity = AuthorizeEntity.fromJson(authorizeJson);

      final AuthorizeEntity copy = entity.copyWith();

      expect(copy.balance, 500);
      expect(copy.country, 'US');
      expect(copy.currency, 'USD');
      expect(copy.preferredLanguage, 'en');
      expect(copy.scopes, <String>['a', 'b', 'c']);
      expect(copy.userId, 6789);
    });
  });
}
