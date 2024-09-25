/// Base cipher class that encrypts and decrypts strings.
abstract class BaseCipher {
  /// Encrypts a string using a key.
  String encrypt({required String message, required List<List<int>> key});

  /// Decrypts a string using a key.
  String decrypt({required String message, required List<List<int>> key});
}
