import 'package:deriv_cipher/cipher.dart';
import 'package:flutter_test/flutter_test.dart';

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
      const List<List<int>> key = <List<int>>[
        <int>[74, 87, 100, 76, 122],
        <int>[118, 80, 99, 71, 74, 104],
        <int>[78, 57, 88, 54, 98],
        <int>[69, 107, 121, 102, 109],
        <int>[117, 89, 116, 53, 120],
        <int>[73, 48, 82, 111, 84, 97]
      ];

      final String encrypted = Cipher().encrypt(message: message, key: key);
      final String decrypted = Cipher().decrypt(message: encrypted, key: key);

      expect(decrypted, equals(message));
    });

    test(
        'encrypt and decrypt should produce different results with different keys.',
        () {
      const String message = 'secret message';
      const List<List<int>> key1 = [
        [74, 87, 100, 76, 122, 118],
        [80, 99, 71, 74, 104, 78],
        [57, 88, 54, 98, 69, 107],
        [121, 102, 109, 117, 89, 116],
        [53, 120, 73, 48, 82, 111],
        [84, 97]
      ];
      const List<List<int>> key2 = [
        [56, 104, 87, 110, 75, 112],
        [85, 101, 55, 68, 107, 71],
        [99, 89, 102, 106, 88, 57],
        [122, 74, 98, 81, 115, 76],
        [120, 50, 116, 86, 114, 84],
        [52, 118]
      ];

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
      const List<List<int>> key = <List<int>>[
        <int>[74, 87, 100, 76, 122],
        <int>[118, 80, 99, 71, 74, 104],
        <int>[78, 57, 88, 54, 98],
        <int>[69, 107, 121, 102, 109],
        <int>[117, 89, 116, 53, 120],
        <int>[73, 48, 82, 111, 84, 97]
      ];
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
      const List<List<int>> key = [
        [74, 87, 100, 76, 122],
        [118, 80, 99, 71, 74],
        [104, 78, 57, 88, 54],
        [98, 69, 53, 120, 73],
        [48, 82, 111, 84, 97],
        []
      ];

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
