import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/cipher.dart';

void main() {
  group('cipher tests =>', () {
    test('encrypt and decrypt should return the same string.', () {
      const String input = 'secret message';
      const String key = 'secret key';

      final String encrypted = Cipher.encrypt(message: input, key: key);
      final String decrypted = Cipher.decrypt(message: encrypted, key: key);

      expect(decrypted, equals(input));
    });

    test('encrypt and decrypt should work with empty strings.', () {
      const String input = '';
      const String key = 'secret key';

      final String encrypted = Cipher.encrypt(message: input, key: key);
      final String decrypted = Cipher.decrypt(message: encrypted, key: key);

      expect(decrypted, equals(input));
    });

    test(
        'encrypt and decrypt should produce different results with different keys.',
        () {
      const String input = 'secret message';
      const String key1 = 'secret key 1';
      const String key2 = 'secret key 2';

      final String encrypted1 = Cipher.encrypt(message: input, key: key1);
      final String encrypted2 = Cipher.encrypt(message: input, key: key2);

      expect(encrypted1, isNot(equals(encrypted2)));

      final String decrypted1 = Cipher.decrypt(message: encrypted1, key: key1);
      final String decrypted2 = Cipher.decrypt(message: encrypted2, key: key2);

      expect(decrypted1, equals(input));
      expect(decrypted2, equals(input));
      expect(decrypted1, equals(decrypted2));
    });
  });
}
