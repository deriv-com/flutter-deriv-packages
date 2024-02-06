import 'package:flutter/services.dart';
import 'package:test/test.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() {
  group('TextInputDecimalFormatter =>', () {
    void _test({
      required String description,
      required List<String> inputs,
      required String expected,
      int fractionDigits = 2,
      bool withSign = false,
      bool shouldReplace = false,
    }) {
      test(description, () {
        final TextInputDecimalFormatter formatter = TextInputDecimalFormatter(
          fractionDigits: fractionDigits,
          withSign: withSign,
        );

        TextEditingValue result = const TextEditingValue();
        String previous = '';

        for (final String input in inputs) {
          result = formatter.formatEditUpdate(
            shouldReplace ? TextEditingValue(text: previous) : result,
            TextEditingValue(text: shouldReplace ? input : result.text + input),
          );

          previous = input;
        }

        expect(result.text, expected);
      });
    }

    _test(
      description: 'should only accept numbers',
      inputs: <String>['-', 'f', '4', 'o', '*', '+', '2', '/', 'b', 'a', '0'],
      expected: '420',
    );

    _test(
      description: 'should only accept dot after zero if it starts with zero',
      inputs: <String>['0', '6', '9', '.'],
      expected: '0.',
    );

    _test(
      description: 'should only accept three fractional digits after dot',
      inputs: <String>['0', '2', '0', '.', '8', 'x', '5', '4', '2', '0'],
      expected: '0.854',
      fractionDigits: 3,
    );

    _test(
      description: 'should only accept one dot',
      inputs: <String>['0', '2', '0', '.', '8', '.', '5', '4'],
      expected: '0.85',
    );

    _test(
      description:
          'should only accept dot after zero if it starts with signed zero',
      inputs: <String>['-', '0', '-', '6', '9', '.'],
      expected: '-0.',
      withSign: true,
    );

    _test(
      description: 'should accept negative sign',
      inputs: <String>['-', '6', '9', '.', '4', '2', '0'],
      expected: '-69.42',
      withSign: true,
    );

    _test(
      description: 'should accept positive sign',
      inputs: <String>['+', '6', '9', '.', '4', '2', '0'],
      expected: '+69.42',
      withSign: true,
    );

    _test(
      description: 'should only accept negative sign as starting character',
      inputs: <String>['-', '6', '9', '-', '4', '2', '0'],
      expected: '-69420',
      withSign: true,
    );

    _test(
      description: 'should only accept positive sign as starting character',
      inputs: <String>['+', '6', '9', '+', '4', '2', '0'],
      expected: '+69420',
      withSign: true,
    );

    _test(
      description: 'should work with random inputs',
      inputs: <String>['0.85', '', '-69', '00.00', 'foo', '+4.20'],
      expected: '+4.20',
      shouldReplace: true,
    );

    _test(
      description: 'should not accept + or - signs after dot',
      inputs: <String>['+', '+.', '+.-', '+.0-', '+2.02'],
      expected: '+2.02',
      shouldReplace: true,
    );
  });
}
