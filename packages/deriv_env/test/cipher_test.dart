import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/cipher.dart';

void main() {
  group('cipher tests =>', () {
    test('cipher class should be singleton.', () {
      final Cipher cipher1 = Cipher();
      final Cipher cipher2 = Cipher();

      expect(cipher1, equals(cipher2));
      expect(cipher1.hashCode, equals(cipher2.hashCode));
    });

    test('encrypt and decrypt should return the same string.', () {
      const String message = 'secret message';
      const String key = 'JWdLzvPcGJhN9X6bEkyfmuYt5xI0RoTa';

      final String encrypted = Cipher().encrypt(message: message, key: key);
      final String decrypted = Cipher().decrypt(message: encrypted, key: key);

      expect(decrypted, equals(message));
    });

    test(
        'encrypt and decrypt should produce different results with different keys.',
        () {
      const String message = 'secret message';
      const String key1 = 'JWdLzvPcGJhN9X6bEkyfmuYt5xI0RoTa';
      const String key2 = '8hWnKpUe7DkGcYfjX9zJbQsLx2tVrT4v';

      final String encrypted1 = Cipher().encrypt(message: message, key: key1);
      final String encrypted2 = Cipher().encrypt(message: message, key: key2);

      expect(encrypted1, isNot(equals(encrypted2)));

      final String decrypted1 =
          Cipher().decrypt(message: encrypted1, key: key1);
      final String decrypted2 =
          Cipher().decrypt(message: encrypted2, key: key2);

      expect(decrypted1, equals(message));
      expect(decrypted2, equals(message));
      expect(decrypted1, equals(decrypted2));
    });

    test('encrypt and decrypt should throw assertion error with empty strings.',
        () {
      const String message = '';
      const String key = 'JWdLzvPcGJhN9X6bEkyfmuYt5xI0RoTa';

      expect(
        () => Cipher().encrypt(message: message, key: key),
        throwsAssertionError,
      );

      expect(
        () => Cipher().decrypt(message: message, key: key),
        throwsAssertionError,
      );
    });

    test(
        'encrypt and decrypt should throw assertion error with key != 32 character.',
        () {
      const String message = 'secret message';
      const String key = 'JWdLzvPcGJhN9X6bE5xI0RoTa';

      expect(
        () => Cipher().encrypt(message: message, key: key),
        throwsAssertionError,
      );

      expect(
        () => Cipher().decrypt(message: message, key: key),
        throwsAssertionError,
      );
    });
  });
}
