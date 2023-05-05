import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:deriv_auth/core/models/account_model.dart';
import 'package:test/test.dart';

void main() {
  group('AuthorizeExtensions on AccountModel tests =>', () {
    test(
        '.isSupported checks if account is country supported based on if login id contains CR',
        () {
      final AccountModel mockAccountModel =
          AccountModel(accountId: 'CR90000003');

      expect(mockAccountModel.isSupported, true);
    });

    test(
        '.isSupported checks if account is country supported based on if login id contains VRTC',
        () {
      final AccountModel mockAccountModel =
          AccountModel(accountId: 'VRTC90000003');

      expect(mockAccountModel.isSupported, true);
    });
  });
}
