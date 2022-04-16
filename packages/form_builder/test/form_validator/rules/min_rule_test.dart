import 'package:test/test.dart';
import 'package:form_builder/form_builder.dart';

void main() => minGroup();

void minGroup() {
  group('min =>', () {
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
          'bigger than the given minimum',
      validator: (FormValidator validator) => validator.min(42),
      input: 69,
      expected: isNull,
    );

    _test(
      description: 'should be valid if the input negative number is '
          'bigger than the given negative minimum',
      validator: (FormValidator validator) => validator.min(-4),
      input: -2,
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input number is '
          'smaller than the given minimum',
      validator: (FormValidator validator) => validator.min(18),
      input: 15,
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input string length is '
          'bigger than the given minimum',
      validator: (FormValidator validator) => validator.min(6),
      input: 'Foo Bar',
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input string length is '
          'smaller than the given minimum',
      validator: (FormValidator validator) => validator.min(6),
      input: 'Foo',
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input list length is '
          'bigger than the given minimum',
      validator: (FormValidator validator) => validator.min(3),
      input: <String>['Foo', 'Bar', 'Baz'],
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input list length is '
          'smaller than the given minimum',
      validator: (FormValidator validator) => validator.min(3),
      input: <int>[420, 69],
      expected: isNotNull,
    );

    _test(
      description: 'should be valid if the input map length is '
          'bigger than the given minimum',
      validator: (FormValidator validator) => validator.min(3),
      input: <String, int>{'Foo': 420, 'Bar': 69, 'Baz': 18},
      expected: isNull,
    );

    _test(
      description: 'should not be valid if the input map length is '
          'smaller than the given minimum',
      validator: (FormValidator validator) => validator.min(3),
      input: <String, int>{'Foo': 420, 'Bar': 69},
      expected: isNotNull,
    );
  });
}
