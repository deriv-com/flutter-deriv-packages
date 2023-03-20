import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('Test enum mappers', () {
    test('test accountTypeEnumMapper from string', () {
      expect(accountTypeEnumMapper['trading'], AccountTypeEnum.trading);
      expect(accountTypeEnumMapper['wallet'], AccountTypeEnum.wallet);
      expect(accountTypeEnumMapper['trading'], AccountTypeEnum.trading);
      expect(accountTypeEnumMapper['wallet'], AccountTypeEnum.wallet);
      expect(accountTypeEnumMapper['trading'], AccountTypeEnum.trading);
    });
  });
}
