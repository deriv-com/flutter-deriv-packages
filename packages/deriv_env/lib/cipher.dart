import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

/// A cipher class that encrypts and decrypts strings.
class Cipher {
  /// Encrypts a string using a key with a random salt value.
  static String encrypt(String message, String key) {
    final List<int> salt = List<int>.generate(32, (_) => Random().nextInt(256));
    final List<int> combinedKey = List<int>.from(utf8.encode(key))
      ..addAll(salt);
    final List<int> encryptedMessage =
        _generateMessage(utf8.encode(message), combinedKey, true);
    final String encodedSalt = base64.encode(salt);
    final String encodedMessage = base64.encode(encryptedMessage);

    return '$encodedSalt:$encodedMessage';
  }

  /// Decrypts a string using a key with a salt value.
  static String decrypt(String ciphertext, String key) {
    final List<String> parts = ciphertext.split(':');
    final Uint8List salt = base64.decode(parts.first);
    final List<int> combinedKey = List<int>.from(utf8.encode(key))
      ..addAll(salt);
    final Uint8List encryptedMessage =
        base64.decode(ciphertext.substring(parts.first.length + 1));
    final List<int> decryptedMessage =
        _generateMessage(encryptedMessage, combinedKey, false);

    return utf8.decode(decryptedMessage);
  }

  static List<int> _generateMessage(
    List<int> inputBytes,
    List<int> keyBytes,
    bool isEncryption,
  ) {
    final List<int> result = <int>[];

    int counter = 0;

    for (int i = 0; i < inputBytes.length; i++) {
      final int keyByte = keyBytes[counter];

      inputBytes[i] = isEncryption
          ? (inputBytes[i] ^ keyByte) + keyByte
          : (inputBytes[i] - keyByte) ^ keyByte;

      result.add(inputBytes[i]);

      if (++counter == keyBytes.length) {
        counter = 0;
      }
    }

    return result;
  }
}
