import 'package:deriv_auth/deriv_auth.dart';
import 'package:test/test.dart';

void main() {
  group('Test enum mappers', () {
    test('test platformEnumMapper from string', () {
      expect(platformEnumMapper['dtrade'], PlatformEnum.dtrade);
      expect(platformEnumMapper['dxtrade'], PlatformEnum.dxtrade);
      expect(platformEnumMapper['mt5'], PlatformEnum.mt5);
      expect(platformEnumMapper['derivez'], PlatformEnum.derivez);
      expect(platformEnumMapper['dwallet'], PlatformEnum.dwallet);
    });
  });
}
