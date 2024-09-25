/// Base class for retrieve environment variables providers.
abstract class BaseEnvLoader {
  /// Returns `true` if [Env] is initialized, otherwise `false`.
  bool get isInitialized;

  /// Returns all environment variables as a [Map].
  Map<String, dynamic> get entries;

  /// Loads environment variables.
  Future<void> loadEnvironment();

  /// Retrieves an environment variable value by key.
  T get<T>(
    String key, {
    T? defaultValue,
    T Function(String value)? parser,
    String decryptionKey = '',
  });
}
