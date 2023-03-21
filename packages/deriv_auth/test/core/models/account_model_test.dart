import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('Test AccountModel.', () {
    test('Create AccountModel instance', () {
      final AccountModel account = AccountModel(
        accountId: 'CR1234',
        token: 'abcd1234',
        currency: 'USD',
        email: 'test@test.com',
        fullName: 'John Doe',
        userId: 123,
      );

      expect(account.accountId, 'CR1234');
      expect(account.token, 'abcd1234');
      expect(account.currency, 'USD');
      expect(account.email, 'test@test.com');
      expect(account.fullName, 'John Doe');
      expect(account.userId, 123);
      expect(account.isDisabled, false);
      expect(account, isA<AccountModel>());
    });

    test('Create AccountModel instance from Map.', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'acct': 'CR1234',
        'token': 'abcd1234',
        'cur': 'USD',
        'email': 'test@test.com',
        'fullName': 'John Doe',
        'userId': 123,
        'isDisabled': false,
      };

      final AccountModel account = AccountModel.fromMap(json);

      expect(account.accountId, 'CR1234');
      expect(account.token, 'abcd1234');
      expect(account.currency, 'USD');
      expect(account.email, 'test@test.com');
      expect(account.fullName, 'John Doe');
      expect(account.userId, 123);
      expect(account.isDisabled, false);
    });
    test('Create AccountModel instance from JSON.', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'acct': 'CR1234',
        'token': 'abcd1234',
        'cur': 'USD',
        'email': 'test@test.com',
        'fullName': 'John Doe',
        'userId': 123,
        'isDisabled': false,
      };

      final AccountModel account = AccountModel.fromJson(json);

      expect(account.accountId, 'CR1234');
      expect(account.token, 'abcd1234');
      expect(account.currency, 'USD');
      expect(account.email, 'test@test.com');
      expect(account.fullName, 'John Doe');
      expect(account.userId, 123);
      expect(account.isDisabled, false);
    });

    test('Create AccountModel instance from JSON with missing fields', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'acct': 'CR1234',
        'token': 'abcd1234',
        'email': 'test@test.com',
        'userId': 123,
        'isDisabled': false,
      };

      final AccountModel account = AccountModel.fromMap(json);

      expect(account.accountId, 'CR1234');
      expect(account.token, 'abcd1234');
      expect(account.currency, null);
      expect(account.email, 'test@test.com');
      expect(account.fullName, null);
      expect(account.userId, 123);
      expect(account.isDisabled, false);
    });

    test('Test AccountModel fromMap', () {
      final Map<String, dynamic> dataMap = <String, dynamic>{
        'acct': 'test_id',
        'cur': 'USD',
        'email': 'test@test.com',
        'fullName': 'Test User',
        'userId': 123,
        'isDisabled': false,
      };
      final AccountModel account = AccountModel.fromMap(dataMap);

      expect(account.accountId, 'test_id');
      expect(account.currency, 'USD');
      expect(account.email, 'test@test.com');
      expect(account.fullName, 'Test User');
      expect(account.userId, 123);
      expect(account.isDisabled, false);
    });

    test('Test AccountModel toJson', () {
      final AccountModel account = AccountModel(
        accountId: 'test_id',
        currency: 'USD',
        email: 'test@test.com',
        fullName: 'Test User',
        userId: 123,
      );
      final Map<String, dynamic> json = account.toJson();

      expect(json['acct'], 'test_id');
      expect(json['cur'], 'USD');
      expect(json['email'], 'test@test.com');
      expect(json['fullName'], 'Test User');
      expect(json['userId'], 123);
      expect(json['isDisabled'], false);
    });
  });
}
