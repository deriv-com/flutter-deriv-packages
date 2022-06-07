import 'package:test/test.dart';
import 'package:form_builder/form_builder.dart';

void main() => noSpecialCharacterGroup();

void noSpecialCharacterGroup() {
  group('noSpecialCharacter =>', () {
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
          'should be valid if is not allowed to contain special characters and '
          'the input is null',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: null,
      expected: isNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is an empty list',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <dynamic>[],
      expected: isNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is an empty map',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <dynamic, dynamic>{},
      expected: isNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is not non string',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: true,
      expected: isNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is a valid string',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: 'foo bar baz',
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid string',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: 'foo!"#\$%&()*+,-./bar:;<=>?@[\]^_`{|}~baz',
      expected: isNotNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is a valid list of string',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <String>['foo', 'bar', 'baz'],
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid list of string',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <String>['foo', '~', 'baz'],
      expected: isNotNull,
    );

    _test(
      description:
          'should be valid if is not allowed to contain special characters and '
          'the input is a valid map',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <String, dynamic>{'name': 'john', 'age': 42},
      expected: isNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid map',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <String, dynamic>{'name': 'john!', 'age': 42},
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid complex object',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: <String, dynamic>{
        'name': 'john',
        'age': 42,
        'address': <String, dynamic>{
          'country': 'UK',
          'city': <String, dynamic>{
            'name': 'London',
            'codes': <dynamic>[420, '420^'],
          },
        },
        'hobbies': <String>['foo', 'bar', 'baz'],
      },
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid string but with the character /',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: 'this string // should not be allowed // ',
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an invalid string but with the characters () and \$',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: '\$150 (200)',
      expected: isNotNull,
    );

    _test(
      description:
          'should not be valid if is not allowed to contain special characters '
          'the input is an valid string with list of all allowed special characters',
      validator: (FormValidator validator) => validator.noSpecialCharacter(),
      input: "'.,:;()@#+-",
      expected: isNull,
    );
  });
}
