import 'package:deriv_env/base_env.dart';

/// This class is used to load environment variables from a .env file
class EnvLoader {
  /// The singleton instance of [EnvLoader].
  factory EnvLoader() {
    _instance ??= EnvLoader._internal();
    return _instance!;
  }

  EnvLoader._internal();

  static EnvLoader? _instance;

  /// The environment variables provider.
  BaseEnv? _env;

  /// Returns `true` if [Env] is initialized, otherwise `false`.
  bool get isInitialized => _env?.isInitialized ?? false;

  /// Loads environment variables from a `.env` file.
  ///
  /// If [filename] is not provided, it will default to `.env`.
  Future<void> initialize(BaseEnv env, [String filename = '.env']) async {
    _env = env;
    return _env!.load(filename);
  }

  /// Retrieves an environment variable value by key.
  T get<T>(
    String key, {
    T? defaultValue,
    T Function(String value)? parser,
    String decryptionKey = '',
  }) =>
      isInitialized
          ? _env!.get<T>(key, defaultValue: defaultValue)
          : throw Exception('EnvLoader is not initialized.');
}
