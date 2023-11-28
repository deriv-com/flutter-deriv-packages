import 'base_env_loader.dart';
import 'env_loader.dart';

/// This class is used to load environment variables from a .env file
class Env {
  /// The singleton instance of [EnvLoader].
  factory Env() {
    _instance ??= Env._internal();
    return _instance!;
  }

  Env._internal();

  static Env? _instance;

  /// The environment variables provider.
  BaseEnvLoader? _env;

  /// The instance of [BaseEnv].
  BaseEnvLoader? get env => _env;

  /// Returns `true` if [Env] is initialized, otherwise `false`.
  bool get isInitialized => _env?.isInitialized ?? false;

  /// Initializes [EnvLoader] with an instance of [BaseEnv].
  /// Loads environment variables from a `.env` file.
  ///
  /// If [filename] is not provided, it will default to `.env`.
  Future<void> initialize(BaseEnvLoader env) async {
    _env = env;
    return _env!.loadEnvironment();
  }

  /// Loads environment variables from a `.env` file.
  @Deprecated('Use initialize() method instead.')
  Future<void> load([String filePath = '.env']) async {
    _env ??= EnvLoader(filePath: filePath);
    return _env!.loadEnvironment();
  }

  /// Retrieves an environment variable value by key.
  T get<T>(
    String key, {
    T? defaultValue,
    T Function(String value)? parser,
    String decryptionKey = '',
  }) =>
      isInitialized
          ? _env!.get<T>(
              key,
              defaultValue: defaultValue,
              parser: parser,
              decryptionKey: decryptionKey,
            )
          : throw Exception('EnvLoader is not initialized.');
}
