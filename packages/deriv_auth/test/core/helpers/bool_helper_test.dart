import 'package:deriv_auth/core/helpers/helpers.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Bool Helper functions', () {
    test('getBool should return bool from dynamic value', () {
      expect(getBool(1), true);
      expect(getBool(0), false);
      expect(getBool(true), true);
      expect(getBool(false), false);
      expect(getBool(null), null);
    });
  });

  test('getInt should return integer from boolean input', () {
    expect(getInt(value: true), 1);
    expect(getInt(value: false), 0);
    expect(getInt(), null);
  });
}
