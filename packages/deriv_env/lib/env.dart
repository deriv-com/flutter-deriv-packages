library deriv_env;

import 'package:flutter/services.dart';

import 'base_env.dart';

/// Provides a way to store, and retrieve environment variables.
class Env extends BaseEnv {
  /// Returns the singleton instance of [Env].
  factory Env() => _instance;

  Env._();

  static final Env _instance = Env._();

  final Map<String, dynamic> _env = <String, dynamic>{};

  @override
  Future<void> load([String filename = '.env']) async {
    _env.clear();

    final List<String> fileEntries = await _getEntriesFromFile(filename);

    for (final String entry in fileEntries) {
      final List<String> item = entry.split('=');

      if (item.length == 2) {
        _env[item.first.trim()] = item.last.trim();
      }
    }
  }

  @override
  T? get<T>(String key, {T? defaultValue}) {
    if (!_env.containsKey(key)) {
      return defaultValue;
    }

    final String value = _env[key];

    switch (T) {
      case int:
        return int.tryParse(value) as T;
      case double:
        return double.tryParse(value) as T;
      case bool:
        return (value.toLowerCase() == 'true') as T;

      default:
        return value as T;
    }
  }

  Future<List<String>> _getEntriesFromFile(String filename) async {
    final String envFileContent = await rootBundle.loadString(filename);

    if (envFileContent.isEmpty) {
      throw Exception('Env file is empty.');
    }

    final List<String> entries = <String>[];
    final List<String> content = envFileContent.split('\n');

    for (final String line in content) {
      if (line.isEmpty || line.startsWith('#')) {
        continue;
      }

      entries.add(line);
    }

    return entries;
  }
}
