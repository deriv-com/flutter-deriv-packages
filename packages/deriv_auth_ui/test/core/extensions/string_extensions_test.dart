import 'package:deriv_auth_ui/src/core/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
