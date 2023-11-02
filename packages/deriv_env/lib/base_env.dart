/// Base class for retrieve environment variables providers.
abstract class BaseEnv {
  /// Returns `true` if [Env] is initialized, otherwise `false`.
  bool get isInitialized;

  /// Returns all environment variables as a [Map].
  Map<String, dynamic> get entries;

  /// Loads environment variables from a `.env` file.
  ///
  /// If [filename] is not provided, it will default to `.env`.
  Future<void> load([String filename = '.env']);

  /// Retrieves an environment variable value by key.
  T get<T>(String key, {T? defaultValue});
}
