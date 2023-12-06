import 'package:flutter/services.dart';

import 'base_env_loader.dart';
import 'cipher.dart';

/// [Env] class is a singleton class that provides access to environment variables.
class EnvLoader extends BaseEnvLoader {
  /// Creates a new instance of [EnvLoader].
  EnvLoader({required this.filePath});

  /// The path to the file.
  final String filePath;

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
  Future<void> loadEnvironment() async {
    _entries.clear();

    final List<String> fileEntries = await _getEntriesFromFile(filePath);

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
    String decryptionKey = '',
  }) {
    _checkInitialization();

    if (!_entries.containsKey(key)) {
      if (defaultValue == null) {
        throw Exception('$runtimeType does not contain a value for key: $key.');
      }

      return defaultValue;
    }

    final String value = decryptionKey.isEmpty
        ? _entries[key]
        : Cipher().decrypt(message: _entries[key], key: decryptionKey);

    if (parser != null) {
      return parser(value);
    }

    switch (T) {
      case int:
        return int.tryParse(value) as T;
      case double:
        return double.tryParse(value) as T;
      case bool:
        if (value.toLowerCase() == 'true') {
          return true as T;
        } else if (value.toLowerCase() == 'false') {
          return false as T;
        } else {
          throw FormatException('Invalid boolean value: $value');
        }

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
