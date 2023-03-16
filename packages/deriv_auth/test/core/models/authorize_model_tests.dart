import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeResponseEntity tests', () {
    final AuthorizeEntity authorizeEntity =
        AuthorizeEntity.fromJson(<String, dynamic>{
      'balance': 500,
      'country': 'US',
      'currency': 'USD',
      'email': 'johndoe@gmail.com',
      'fullname': 'John Doe',
      'isVirtual': false,
      'landingCompanyFullname': 'John Doe Company',
      'landingCompanyName': 'JD Company',
      'loginid': '12345',
      'preferredLanguage': 'en',
      'scopes': ['a', 'b', 'c'],
      'userId': 6789,
    });
    test(
        'fromJson() should create an instance of AuthorizeResponseEntity from JSON.',
        () {
      final AuthorizeResponseEntity authorizeResponseEntity =
          AuthorizeResponseEntity(
        authorize: authorizeEntity,
      );
      expect(authorizeResponseEntity.authorize, authorizeEntity);
    });

    test('toJson() should return JSON map with correct values', () {
      final AuthorizeResponseEntity authorizeResponseEntity =
          AuthorizeResponseEntity(authorize: authorizeEntity);
      final Map<String, dynamic> jsonMap = authorizeResponseEntity.toJson();
      expect(
        jsonMap['authorize'],
        authorizeEntity.toJson(),
      );
    });

    test(
        'copyWith() should create a copy of AuthorizeResponseEntity with given parameters',
        () {
      final AuthorizeResponseEntity authorizeResponseEntity =
          AuthorizeResponseEntity(authorize: authorizeEntity);
      final AuthorizeResponseEntity copiedEntity =
          authorizeResponseEntity.copyWith(
        authorize: AuthorizeEntity.fromJson(<String, dynamic>{
          'user_id': 2,
          'loginid': 'xyz',
          'currency': 'USD'
        }),
      );
      expect(copiedEntity.authorize!.userId, 2);
      expect(copiedEntity.authorize!.loginid, 'xyz');
      expect(copiedEntity.authorize!.currency, 'USD');
    });
  });
}
