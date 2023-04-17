import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_env/cipher.dart';

void main() {
  group('cipher tests =>', () {
    test('encrypt and decrypt should return the same string.', () {
      const String input = 'secret message';
      const String key = 'secret key';

      final String encrypted = Cipher.encrypt(input, key);
      final String decrypted = Cipher.decrypt(encrypted, key);

      expect(decrypted, equals(input));
    });

    test('encrypt and decrypt should work with empty strings.', () {
      const String input = '';
      const String key = 'secret key';

      final String encrypted = Cipher.encrypt(input, key);
      final String decrypted = Cipher.decrypt(encrypted, key);

      expect(decrypted, equals(input));
    });

    test(
        'encrypt and decrypt should produce different results with different keys.',
        () {
      const String input = 'secret message';
      const String key1 = 'secret key 1';
      const String key2 = 'secret key 2';

      final String encrypted1 = Cipher.encrypt(input, key1);
      final String encrypted2 = Cipher.encrypt(input, key2);

      expect(encrypted1, isNot(equals(encrypted2)));

      final String decrypted1 = Cipher.decrypt(encrypted1, key1);
      final String decrypted2 = Cipher.decrypt(encrypted2, key2);

      expect(decrypted1, equals(input));
      expect(decrypted2, equals(input));
      expect(decrypted1, equals(decrypted2));
    });
  });
}
