import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('AccountListItem tests', () {
    test('toJson should return valid json.', () {
      final AccountListItem item = AccountListItem(
        createdAt: DateTime.now(),
        currency: 'USD',
        excludedUntil: DateTime.now(),
        isDisabled: false,
        isVirtual: false,
        landingCompanyName: 'Test Company',
        loginid: 'test_loginid',
        trading: const Trading(),
        wallet: const Wallet(),
        token: 'test_token',
      );

      final Map<String, dynamic> json = item.toJson();

      expect(json['currency'], equals('USD'));
      expect(json['landing_company_name'], equals('Test Company'));
      expect(json['loginid'], equals('test_loginid'));
      expect(json['trading'], isNotNull);
      expect(json['wallet'], isNotNull);
    });

    test('fromJson should create object from map.', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'account_type': 'wallet',
        'currency': 'EUR',
        'landing_company_name': 'Test Company 2',
        'loginid': 'test_loginid_2',
        'trading': const Trading().toJson(),
        'wallet': const Wallet().toJson(),
      };

      final AccountListItem item = AccountListItem.fromJson(json);

      expect(item.currency, equals('EUR'));
      expect(item.landingCompanyName, equals('Test Company 2'));
      expect(item.loginid, equals('test_loginid_2'));
      expect(item.trading, isNotNull);
      expect(item.wallet, isNotNull);
    });

    test('copyWith new values return correct object.', () {
      final AccountListItem item = AccountListItem(
        createdAt: DateTime.now(),
        currency: 'USD',
        excludedUntil: DateTime.now(),
        isDisabled: false,
        isVirtual: false,
        landingCompanyName: 'Test Company',
        loginid: 'test_loginid',
        trading: const Trading(),
        wallet: const Wallet(),
        token: 'test_token',
      );

      final AccountListItem copy = item.copyWith(
        isVirtual: true,
      );

      expect(copy.isVirtual, equals(true));
      expect(copy.token, equals('test_token'));
    });
    test('copyWith method with null value return same instance.', () {
      final AccountListItem item = AccountListItem(
        createdAt: DateTime.now(),
        currency: 'USD',
        excludedUntil: DateTime.now(),
        isDisabled: false,
        isVirtual: false,
        landingCompanyName: 'Test Company',
        loginid: 'test_loginid',
        trading: const Trading(),
        wallet: const Wallet(),
        token: 'test_token',
      );

      final AccountListItem copy = item.copyWith();

      expect(copy.isVirtual, equals(false));
      expect(copy.token, equals('test_token'));
    });
  });
}
