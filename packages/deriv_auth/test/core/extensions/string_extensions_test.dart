import 'package:deriv_auth/core/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension on String tests =>', () {
    test('.parseXMLTag returns all contents between first XML [tag].', () {
      const String xml = '<tag>contents</tag>';
      const String tag = 'tag';

      expect(xml.parseXMLTag(tag), 'contents');
    });

    test('.toSnakeCase converts a camelCase string to snake_case.', () {
      const String snakeCase = 'snake_case';
      const String camelCase = 'snakeCase';

      expect(camelCase.toSnakeCase(), snakeCase);
    });

    test('.toSnakeCase returns the same string if it is not in "camelCase"',
        () {
      const String testString = 'test';

      expect(testString.toSnakeCase(), testString);
    });
  });

  group('RegexExtension', () {
    test('isValidEmail should return true for valid email', () {
      const String validEmail = 'test@example.com';
      expect(validEmail.isValidEmail, true);
    });

    test('isValidEmail should return false for invalid email', () {
      const String invalidEmail = 'test';
      expect(invalidEmail.isValidEmail, false);
    });

    test('isValidLoginPasswordLength should return true for valid length', () {
      const String validPassword = 'password';
      expect(validPassword.isValidLoginPasswordLength, true);
    });

    test('isValidLoginPasswordLength should return false for invalid length',
        () {
      const String invalidPassword = 'pass';
      expect(invalidPassword.isValidLoginPasswordLength, false);
    });

    test('isValidSignupPassword should return true for valid password', () {
      const String validPassword = 'Abc123456';
      expect(validPassword.isValidSignupPassword, true);
    });

    test('isValidSignupPassword should return false for invalid password', () {
      const String invalidPassword = 'password';
      expect(invalidPassword.isValidSignupPassword, false);
    });
  });
}
