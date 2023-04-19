import 'package:flutter/services.dart';

import 'base_env.dart';
import 'cipher.dart';

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
    _checkInitialization();

    return _entries;
  }

  @override
  Future<void> load([String filename = '.env']) async {
    _entries.clear();

    final List<String> fileEntries = await _getEntriesFromFile(filename);

    for (final String entry in fileEntries) {
      final List<String> items = entry.split('=');

      if (items.length > 1) {
        _entries[items.first.trim()] = items.sublist(1).join('=').trim();
      }
    }

    _isInitialized = true;
  }

  @override
  T get<T>(
    String key, {
    T? defaultValue,
    T Function(String value)? parser,
    bool encrypted = false,
    String decryptionKey = '',
  }) {
    if (encrypted && decryptionKey.isEmpty) {
      throw Exception('$runtimeType encrypted key is required.');
    }

    _checkInitialization();

    if (!_entries.containsKey(key)) {
      if (defaultValue == null) {
        throw Exception('$runtimeType does not contain a value for key: $key.');
      }

      return defaultValue;
    }

    final String value = encrypted
        ? Cipher().decrypt(message: _entries[key], key: decryptionKey)
        : _entries[key];

    if (parser != null) {
      return parser(value);
    }

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
      throw Exception('$runtimeType: $filename is empty.');
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

  void _checkInitialization() {
    if (_isInitialized) {
      return;
    }

    throw Exception(
      '$runtimeType is not initialized, call load() method first.',
    );
  }
}
