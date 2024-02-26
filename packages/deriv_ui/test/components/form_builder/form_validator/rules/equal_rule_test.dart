import 'package:test/test.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() => equalGroup();

void equalGroup() {
  group('equal =>', () {
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
      description:
          'should be valid if the input string is equal to the given string',
      validator: (FormValidator validator) => validator.equal('foo'),
      input: 'foo',
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if the input string is not equal to the given '
          'string',
      validator: (FormValidator validator) => validator.equal('foo'),
      input: 'bar',
      expected: isNotNull,
    );

    _test(
      description:
          'should be valid if the input number is equal to the given number',
      validator: (FormValidator validator) => validator.equal(420),
      input: 420,
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if the input type is not equal to the given '
          'type',
      validator: (FormValidator validator) => validator.equal('foo'),
      input: 69,
      expected: isNotNull,
    );

    _test(
      description:
          'should be valid if the input boolean is equal to the given boolean',
      validator: (FormValidator validator) => validator.equal(false),
      input: false,
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if the input boolean is not equal to the given '
          'boolean',
      validator: (FormValidator validator) => validator.equal(true),
      input: false,
      expected: isNotNull,
    );
  });
}
