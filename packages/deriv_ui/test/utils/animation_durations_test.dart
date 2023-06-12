import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('colorChangeDuration constant has correct value', () {
    expect(colorChangeDuration, equals(const Duration(milliseconds: 300)));
  });

  test('sizeChangeDuration constant has correct value', () {
    expect(sizeChangeDuration, equals(const Duration(milliseconds: 300)));
  });

  test('scrollAnimationDuration constant has correct value', () {
    expect(scrollAnimationDuration, equals(const Duration(seconds: 1)));
  });

  test('autoScrollInterval constant has correct value', () {
    expect(autoScrollInterval, equals(const Duration(seconds: 4)));
  });

  test('slidingPageChangeDuration constant has correct value', () {
    expect(slidingPageChangeDuration, equals(const Duration(milliseconds: 300)));
  });
}
