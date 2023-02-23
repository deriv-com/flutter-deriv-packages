import 'package:flutter/services.dart';

import 'base_env.dart';

/// Provides a way to store, and retrieve environment variables.
class Env extends BaseEnv {
  /// Returns the singleton instance of [Env].
  factory Env() => _instance;

  Env._();

  static final Env _instance = Env._();

  bool _isInitialized = false;

  final Map<String, dynamic> _entries = <String, dynamic>{};

  @override
  bool get isInitialized => _isInitialized;

  @override
  Map<String, dynamic> get entries {
    if (!_isInitialized) {
      throw Exception('Env class is not initialized, Call `load()` first.');
    }

    return _entries;
  }

  @override
  Future<void> load([String filename = '.env']) async {
    _entries.clear();

    final List<String> fileEntries = await _getEntriesFromFile(filename);

    for (final String entry in fileEntries) {
      final List<String> item = entry.split('=');

      if (item.length == 2) {
        _entries[item.first.trim()] = item.last.trim();
      }
    }

    _isInitialized = true;
  }

  @override
  T? get<T>(String key, {T? defaultValue}) {
    if (!_isInitialized) {
      throw Exception('Env class is not initialized, Call `load()` first.');
    }

    if (!_entries.containsKey(key)) {
      return defaultValue;
    }

    final String value = _entries[key];

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
