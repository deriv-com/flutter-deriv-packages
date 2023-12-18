import 'package:deriv_auth/core/helpers/helpers.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Test number helper fumctions.', () {
    test('getDecimalDigits gets mumber digits after the decimal point.', () {
      expect(getDecimalDigits('10.12323'), 5);
    });
    test('generateRandomInt generates a random number.', () {
      expect(generateRandomInt(), isA<int>());
    });

    test('getDounle returns double from string and num.', () {
      expect(getDouble('2.053'), isA<double>());
      expect(getDouble(5), isA<double>());
      expect(getDouble(true), null);
    });

    group('Testing NumberValidator functions.', () {
      test('isNumber returns bool from String.', () {
        expect(NumberValidator.isANumber('23.4'), true);
        expect(NumberValidator.isANumber('test'), false);
      });
      test('isBetweenLimits returns bool from String.', () {
        expect(
          NumberValidator.isBetweenLimits(
            stringValue: '23.4',
            upperLimit: 25,
            lowerLimit: 20,
          ),
          isTrue,
        );
        expect(
          NumberValidator.isBetweenLimits(
            stringValue: '23.4',
            upperLimit: 20,
            lowerLimit: 15,
          ),
          isFalse,
        );
      });

      test('isLessThanLimit returns bool from String.', () {
        expect(
          NumberValidator.isLessThanLimit(
            stringValue: '23.4',
            upperLimit: 25,
          ),
          isTrue,
        );
        expect(
          NumberValidator.isLessThanLimit(
            stringValue: '23.4',
            upperLimit: 20,
          ),
          isFalse,
        );
      });

      test('isMoreThanLimit returns bool from String.', () {
        expect(
          NumberValidator.isMoreThanLimit(
            stringValue: '23.4',
            lowerLimit: 20,
          ),
          isTrue,
        );
        expect(
          NumberValidator.isMoreThanLimit(
            stringValue: '23.4',
            lowerLimit: 25,
          ),
          isFalse,
        );
      });

      test('isAPositiveNumber returns bool from String.', () {
        expect(NumberValidator.isAPositiveNumber('23.4'), isTrue);
        expect(NumberValidator.isAPositiveNumber('-23.4'), isFalse);
      });

      test('hasValidPrecision works correctly.', () {
        expect(
          NumberValidator.hasValidPrecision(
            stringValue: '23.4',
            validDecimalNumber: 2,
          ),
          isTrue,
        );
        expect(
          NumberValidator.hasValidPrecision(
            stringValue: '23.44',
            validDecimalNumber: 1,
          ),
          isFalse,
        );
      });
    });
  });
}
