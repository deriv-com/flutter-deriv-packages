import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegexTests', () {
    test('Valid Email Regex', () {
      
      final List<String> validEmails = <String>[
        'test@example.com',
        'user123@gmail.com',
        'john.doe@example.co.uk',
        'first.last@subdomain.example.net',
      ];
      final List<String> invalidEmails = <String>[
        'notvalidemail.com',
        'user@domain',
        'john.doe@example',
        'test@123.456.789',
      ];

      for (final String email in validEmails) {
        expect(validEmailRegex.hasMatch(email), isTrue);
      }

      for (final String email in invalidEmails) {
        expect(validEmailRegex.hasMatch(email), isFalse);
      }
    });

    test('Valid Password Regex', () {
      final List<String> validPasswords = <String>[
        'Abcdefg1',
        'Password123',
        'Secret!456',
        'Test@12345',
      ];
      final List<String> invalidPasswords = <String>[
        'password',
        '123456789',
        'PASSWORD',
        'test123',
      ];

      for (final String password in validPasswords) {
        expect(validPasswordRegex.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validPasswordRegex.hasMatch(password), isFalse);
      }
    });

    test('Valid Password with Uppercase Regex', () {
      
      final List<String> validPasswords = <String>[
        'Abcdefg',
        'Password',
        'Secret',
        'Test',
      ];
      final List<String> invalidPasswords = <String>[
        'password',
        '123456789',
        'password123',
        'test123',
      ];

      for (final String password in validPasswords) {
        expect(validPasswordWithUppercaseRegex.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validPasswordWithUppercaseRegex.hasMatch(password), isFalse);
      }
    });

    test('Valid Password with Numbers Regex', () {

      final List<String> validPasswords = <String>[
        'Abcdefg1',
        'Password123',
        'Secret!456',
        'Test@12345',
      ];
      final List<String> invalidPasswords = <String>[
        'password',
        'abcdefg',
        'PASSWORD',
        'test',
      ];

      for (final String password in validPasswords) {
        expect(validPasswordWithNumberRegex.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validPasswordWithNumberRegex.hasMatch(password), isFalse);
      }
    });

    test('Valid Password with Symbols Regex', () {
      
      final List<String> validPasswords = <String>[
        'Abc@123',
        'Password!',
        'Secret@456',
        'Test#+=12345',
      ];
      final List<String> invalidPasswords = <String>[
        'password',
        '123456789',
        'password123',
        'test123',
      ];

      for (final String password in validPasswords) {
        expect(validPasswordWithSymbols.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validPasswordWithSymbols.hasMatch(password), isFalse);
      }
    });

    test('Valid Password Length Regex', () {
      
      final List<String> validPasswords = <String>[
        'Abcdefg1',
        'Password123',
        'Secret!456',
        'Test@12345',
      ];
      final List<String> invalidPasswords = <String>[
        'abc123',
        'test',
        'verylongpasswordthatexceedsthemaximumlength',
        'short',
      ];

      for (final String password in validPasswords) {
        expect(validPasswordLengthRegex.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validPasswordLengthRegex.hasMatch(password), isFalse);
      }
    });

    test('Valid Login Password Length Regex', () {
      
      final List<String> validPasswords = <String>[
        'Abc123',
        'Pass12',
        'Secret!',
        'Test4567',
      ];
      final List<String> invalidPasswords = <String>[
        'abc',
        'test',
        'verylongpasswordthatexceedsthemaximumlength',
        'short',
      ];

      for (final String password in validPasswords) {
        expect(validLoginPasswordLengthRegex.hasMatch(password), isTrue);
      }

      for (final String password in invalidPasswords) {
        expect(validLoginPasswordLengthRegex.hasMatch(password), isFalse);
      }
    });
  });
}
