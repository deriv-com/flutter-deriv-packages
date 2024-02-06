import 'package:test/test.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() => maxGroup();

void maxGroup() {
  group('max =>', () {
    void _test({
      required String description,
      required FormValidator Function(FormValidator) validator,
      required dynamic input,
      required dynamic expected,
    }) {
      test(description, () {
        final FormValidator _validator = validator(FormValidator());

        expect(_validator.validate()(input), expected);
      });
    }

    _test(
      description: 'should be valid if the input number is '
          'smaller than the given maximum',
      validator: (FormValidator validator) => validator.max(69),
      input: 42,
      expected: isNull,
    );

    _test(
      description: 'should be valid if the input negative number is '
          'smaller than the given negative maximum',
      validator: (FormValidator validator) => validator.max(-2),
      input: -4,
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input number is '
          'bigger than the given maximum',
      validator: (FormValidator validator) => validator.max(15),
      input: 18,
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input string length is '
          'smaller than the given maximum',
      validator: (FormValidator validator) => validator.max(8),
      input: 'Foo Bar',
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input string length is '
          'bigger than the given maximum',
      validator: (FormValidator validator) => validator.max(2),
      input: 'Foo',
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input list length is '
          'smaller than the given maximum',
      validator: (FormValidator validator) => validator.max(3),
      input: <String>['Foo', 'Bar', 'Baz'],
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input list length is '
          'bigger than the given maximum',
      validator: (FormValidator validator) => validator.max(1),
      input: <int>[420, 69],
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input map length is '
          'smaller than the given maximum',
      validator: (FormValidator validator) => validator.max(3),
      input: <String, int>{'Foo': 420, 'Bar': 69, 'Baz': 18},
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input map length is '
          'bigger than the given maximum',
      validator: (FormValidator validator) => validator.max(1),
      input: <String, int>{'Foo': 420, 'Bar': 69},
      expected: isNotNull,
    );
  });
}
