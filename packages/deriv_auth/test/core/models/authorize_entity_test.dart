import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeEntity', () {
    test('toJson should return a map of AuthorizeEntity.', () {
      const AuthorizeEntity entity = AuthorizeEntity(
        balance: 500,
        country: 'US',
        currency: 'USD',
        email: 'johndoe@gmail.com',
        fullname: 'John Doe',
        isVirtual: false,
        landingCompanyFullname: 'John Doe Company',
        landingCompanyName: 'JD Company',
        loginid: '12345',
        preferredLanguage: 'en',
        scopes: ['a', 'b', 'c'],
        userId: 6789,
      );

      final Map<String, dynamic> map = entity.toJson();

      expect(map, isA<Map<String, dynamic>>());
      expect(map['account_list'], isNull);
      expect(map['balance'], equals(500.0));
      expect(map['country'], equals('US'));
      expect(map['currency'], equals('USD'));
      expect(map['email'], equals('johndoe@gmail.com'));
      expect(map['fullname'], equals('John Doe'));
      expect(map['is_virtual'], equals(false));
      expect(map['landing_company_fullname'], equals('John Doe Company'));
      expect(map['landing_company_name'], equals('JD Company'));
      expect(map['local_currencies'], isNull);
      expect(map['loginid'], equals('12345'));
      expect(map['preferred_language'], equals('en'));
      expect(map['scopes'], equals(['a', 'b', 'c']));
      expect(map['trading'], isNull);
      expect(map['upgradeable_landing_companies'], isNull);
      expect(map['user_id'], equals(6789));
      expect(map['wallet'], isNull);
      expect(map['refresh_token'], isNull);
    });

    test('fromJson should return an AuthorizeEntity object.', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'account_list': null,
        'balance': 500.0,
        'country': 'US',
        'currency': 'USD',
        'email': 'johndoe@gmail.com',
        'fullname': 'John Doe',
        'is_virtual': false,
        'landing_company_fullname': 'John Doe Company',
        'landing_company_name': 'JD Company',
        'local_currencies': null,
        'loginid': '12345',
        'preferred_language': 'en',
        'scopes': ['a', 'b', 'c'],
        'trading': null,
        'upgradeable_landing_companies': null,
        'user_id': 6789,
        'wallet': null,
        'refresh_token': null,
      };

      final AuthorizeEntity entity = AuthorizeEntity.fromJson(json);

      expect(entity, isA<AuthorizeEntity>());
      expect(entity.accountList, isNull);
      expect(entity.balance, equals(500.0));
      expect(entity.country, equals('US'));
      expect(entity.currency, equals('USD'));
      expect(entity.email, equals('johndoe@gmail.com'));
      expect(entity.fullname, equals('John Doe'));
      expect(entity.isVirtual, equals(false));
      expect(entity.landingCompanyFullname, equals('John Doe Company'));
      expect(entity.landingCompanyName, equals('JD Company'));
      expect(entity.localCurrencies, isNull);
      expect(entity.loginid, equals('12345'));
      expect(entity.preferredLanguage, equals('en'));
      expect(entity.scopes, equals(['a', 'b', 'c']));
      expect(entity.trading, isNull);
      expect(entity.upgradeableLandingCompanies, isNull);
      expect(entity.userId, equals(6789));
      expect(entity.wallet, isNull);
      expect(entity.refreshToken, isNull);
    });
  });
}
