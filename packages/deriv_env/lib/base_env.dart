/// Base class for store, and retrieve environment variables providers.
abstract class BaseEnv {
  /// Loads environment variables from a `.env` file.
  Future<void> load([String filename = '.env']);

  /// Retrieves an environment variable value by key.
  T? get<T>(String key, {T? defaultValue});
}
