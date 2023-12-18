import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeResponseEntity tests.', () {
    test('AuthorizeResponseEntity constructor should return correct Object.',
        () {
      const AuthorizeEntity entity = AuthorizeEntity();

      const AuthorizeResponseEntity responseEntity =
          AuthorizeResponseEntity(authorize: entity);

      expect(responseEntity.authorize, entity);
      expect(responseEntity, isA<AuthorizeResponseEntity>());
      expect(responseEntity, isA<AuthorizeResponseEntityModel>());
    });
    test('toJson should return a map of AuthorizeResponseEntity.', () {
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

      const AuthorizeResponseEntity responseEntity =
          AuthorizeResponseEntity(authorize: entity);

      final Map<String, dynamic> map = responseEntity.toJson();

      expect(map, isA<Map<String, dynamic>>());
      expect(map['authorize']['account_list'], isNull);
      expect(map['authorize']['balance'], equals(500.0));
      expect(map['authorize']['country'], equals('US'));
      expect(map['authorize']['currency'], equals('USD'));
      expect(map['authorize']['email'], equals('johndoe@gmail.com'));
      expect(map['authorize']['fullname'], equals('John Doe'));
      expect(map['authorize']['is_virtual'], equals(false));
      expect(map['authorize']['landing_company_fullname'],
          equals('John Doe Company'));
      expect(map['authorize']['landing_company_name'], equals('JD Company'));
      expect(map['authorize']['local_currencies'], isNull);
      expect(map['authorize']['loginid'], equals('12345'));
      expect(map['authorize']['preferred_language'], equals('en'));
      expect(map['authorize']['scopes'], equals(<String>['a', 'b', 'c']));
      expect(map['authorize']['trading'], isNull);
      expect(map['authorize']['upgradeable_landing_companies'], isNull);
      expect(map['authorize']['user_id'], equals(6789));
      expect(map['authorize']['wallet'], isNull);
      expect(map['authorize']['refresh_token'], isNull);
    });

    test('fromJson should return an AuthorizeResponseEntity object.', () {
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
        'scopes': <String>['a', 'b', 'c'],
        'linked_to': null,
        'upgradeable_landing_companies': null,
        'user_id': 6789,
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
      expect(entity.authorize!.scopes, equals(<String>['a', 'b', 'c']));
      expect(entity.authorize!.linkedTo, isNull);
      expect(entity.authorize!.upgradeableLandingCompanies, isNull);
      expect(entity.authorize!.userId, equals(6789));
      expect(entity.authorize!.refreshToken, isNull);
    });

    test('copyWith method return correct object.', () {
      const AuthorizeEntity entity = AuthorizeEntity(
        balance: 500,
        country: 'US',
        userId: 6789,
      );
      const AuthorizeEntity newEntity = AuthorizeEntity(
        balance: 10000,
        country: 'US',
        userId: 1234,
      );

      const AuthorizeResponseEntity responseEntity =
          AuthorizeResponseEntity(authorize: entity);

      final AuthorizeResponseEntity newResponseEntity = responseEntity.copyWith(
        authorize: newEntity,
      );

      expect(newResponseEntity, isA<AuthorizeResponseEntity>());
      expect(newResponseEntity.authorize!.balance, equals(10000.0));
      expect(newResponseEntity.authorize!.country, equals('US'));
      expect(newResponseEntity.authorize!.userId, equals(1234));
    });

    test('copyWith null returns the same instance.', () {
      const AuthorizeEntity entity = AuthorizeEntity(
        balance: 500,
        country: 'US',
        userId: 6789,
      );

      const AuthorizeResponseEntity responseEntity =
          AuthorizeResponseEntity(authorize: entity);

      final AuthorizeResponseEntity newResponseEntity =
          responseEntity.copyWith();

      expect(newResponseEntity, isA<AuthorizeResponseEntity>());
      expect(newResponseEntity.authorize!.balance, equals(500.0));
      expect(newResponseEntity.authorize!.country, equals('US'));
      expect(newResponseEntity.authorize!.userId, equals(6789));
    });
  });
}
