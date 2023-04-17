import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

/// A cipher class that encrypts and decrypts strings.
class Cipher {
  /// Encrypts a string using a key with a random salt value.
  static String encrypt({required String message, required String key}) {
    final List<int> salt = List<int>.generate(32, (_) => Random().nextInt(256));
    final List<int> combinedKey = List<int>.from(utf8.encode(key))
      ..addAll(salt);
    final List<int> encryptedMessage =
        _generateMessage(input: utf8.encode(message), key: combinedKey);
    final String encodedSalt = base64.encode(salt);
    final String encodedMessage = base64.encode(encryptedMessage);

    return '$encodedSalt:$encodedMessage';
  }

  /// Decrypts a string using a key with a salt value.
  static String decrypt({required String message, required String key}) {
    final List<String> parts = message.split(':');
    final Uint8List salt = base64.decode(parts.first);
    final List<int> combinedKey = List<int>.from(utf8.encode(key))
      ..addAll(salt);
    final Uint8List encryptedMessage =
        base64.decode(message.substring(parts.first.length + 1));
    final List<int> decryptedMessage = _generateMessage(
      input: encryptedMessage,
      key: combinedKey,
      isEncryption: false,
    );

    return utf8.decode(decryptedMessage);
  }

  static List<int> _generateMessage({
    required List<int> input,
    required List<int> key,
    bool isEncryption = true,
  }) {
    final List<int> result = <int>[];

    int counter = 0;

    for (int i = 0; i < input.length; i++) {
      final int keyByte = key[counter];

      input[i] = isEncryption
          ? (input[i] ^ keyByte) + keyByte
          : (input[i] - keyByte) ^ keyByte;

      result.add(input[i]);

      if (++counter == key.length) {
        counter = 0;
      }
    }

    return result;
  }
}
