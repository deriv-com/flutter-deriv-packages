import 'package:test/test.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() => requiredGroup();

void requiredGroup() {
  group('required =>', () {
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
          'should not be valid if the input is required and the input is null',
      validator: (FormValidator validator) => validator.required(),
      input: null,
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if the input is required and the input is an '
          'empty string',
      validator: (FormValidator validator) => validator.required(),
      input: '',
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if the input is required and the input is an '
          'empty list',
      validator: (FormValidator validator) => validator.required(),
      input: <dynamic>[],
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if the input is required and the input is an '
          'empty map',
      validator: (FormValidator validator) => validator.required(),
      input: <dynamic, dynamic>{},
      expected: isNotNull,
    );

    _test(
      description:
          'should be valid if the input is required and the input is not null',
      validator: (FormValidator validator) => validator.required(),
      input: 69,
      expected: isNull,
    );

    _test(
      description:
          'should be valid if the input is required and the input is not an '
          'empty string',
      validator: (FormValidator validator) => validator.required(),
      input: 'value',
      expected: isNull,
    );

    _test(
      description:
          'should be valid if the input is required and the input is not an '
          'empty list',
      validator: (FormValidator validator) => validator.required(),
      input: <int>[420],
      expected: isNull,
    );

    _test(
      description:
          'should be valid if the input is required and the input is not an'
          'empty map',
      validator: (FormValidator validator) => validator.required(),
      input: <String, int>{'age': 85},
      expected: isNull,
    );
  });
}
