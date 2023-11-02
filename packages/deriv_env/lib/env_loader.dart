import 'package:deriv_env/base_env.dart';

/// This class is used to load environment variables from a .env file
class EnvLoader {
  /// Creates a new instance of [EnvLoader].
  ///
  /// [env] is the environment variables provider.
  EnvLoader(this.env);

  /// The environment variables provider.
  final BaseEnv env;

  /// Returns `true` if [Env] is initialized, otherwise `false`.
  bool get isInitialized => env.isInitialized;

  /// Loads environment variables from a `.env` file.
  ///
  /// If [filename] is not provided, it will default to `.env`.
  Future<void> load(String envFileContent) => env.load(envFileContent);

  /// Retrieves an environment variable value by key.
  T get<T>(String key, {T? defaultValue}) =>
      env.get<T>(key, defaultValue: defaultValue);
}
