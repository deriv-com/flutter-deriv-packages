import 'dart:convert';

import 'package:encrypt/encrypt.dart';

import 'base_cipher.dart';

/// A cipher class that encrypts and decrypts strings.
class Cipher extends BaseCipher {
  /// Returns a singleton instance of [Cipher].
  factory Cipher() => _instance;

  Cipher._();

  static final Cipher _instance = Cipher._();

  @override
  String encrypt({required String message, required String key}) {
    assert(message.isNotEmpty);
    assert(key.length == 32);

    final Key keyBytes = Key.fromUtf8(key);
    final IV iv = IV.fromLength(16);
    final Encrypter encrypter = Encrypter(AES(keyBytes));

    return encrypter.encrypt(message, iv: iv).base64;
  }

  @override
  String decrypt({required String message, required String key}) {
    assert(message.isNotEmpty);
    assert(key.length == 32);

    final Key keyBytes = Key.fromUtf8(key);
    final IV iv = IV.fromLength(16);
    final Encrypter encrypter = Encrypter(AES(keyBytes));

    return encrypter.decrypt(Encrypted(base64.decode(message)), iv: iv);
  }
}
