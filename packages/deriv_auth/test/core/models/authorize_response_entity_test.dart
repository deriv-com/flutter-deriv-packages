import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeEntity', () {
    test('AuthorizeResponseEntity constructor should return correct Object.',
        () {
      const AuthorizeEntity entity = AuthorizeEntity();

      const AuthorizeResponseEntity responseEntity =
          AuthorizeResponseEntity(authorize: entity);

      expect(responseEntity.authorize, entity);
      expect(responseEntity, isA<AuthorizeResponseEntity>());
      expect(responseEntity, isA<AuthorizeResponseEntityModel>());
    });
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
        scopes: <String>['a', 'b', 'c'],
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

      final AuthorizeResponseEntity entity =
          AuthorizeResponseEntity.fromJson(json);

      expect(entity, isA<AuthorizeResponseEntity>());
      expect(entity.authorize!.accountList, isNull);
      expect(entity.authorize!.balance, equals(500.0));
      expect(entity.authorize!.country, equals('US'));
      expect(entity.authorize!.currency, equals('USD'));
      expect(entity.authorize!.email, equals('johndoe@gmail.com'));
      expect(entity.authorize!.fullname, equals('John Doe'));
      expect(entity.authorize!.isVirtual, equals(false));
      expect(
          entity.authorize!.landingCompanyFullname, equals('John Doe Company'));
      expect(entity.authorize!.landingCompanyName, equals('JD Company'));
      expect(entity.authorize!.localCurrencies, isNull);
      expect(entity.authorize!.loginid, equals('12345'));
      expect(entity.authorize!.preferredLanguage, equals('en'));
      expect(entity.authorize!.scopes, equals(['a', 'b', 'c']));
      expect(entity.authorize!.trading, isNull);
      expect(entity.authorize!.upgradeableLandingCompanies, isNull);
      expect(entity.authorize!.userId, equals(6789));
      expect(entity.authorize!.wallet, isNull);
      expect(entity.authorize!.refreshToken, isNull);
    });
  });
}
