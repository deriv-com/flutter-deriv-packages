import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('Test enum mappers', () {
    test('test accountTypeEnumMapper from string', () {
      expect(accountTypeEnumMapper['trading'], AccountTypeEnum.trading);
      expect(accountTypeEnumMapper['wallet'], AccountTypeEnum.wallet);
    });

    test('test platformEnumMapper from string', () {
      expect(platformEnumMapper['deriv'], PlatformEnum.deriv);
      expect(platformEnumMapper['dxtrade'], PlatformEnum.dxtrade);
      expect(platformEnumMapper['mt5'], PlatformEnum.mt5);
    });
  });
}
