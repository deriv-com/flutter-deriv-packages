import 'package:example/core/persistent_data_service/base_persistent_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements BasePersistentDataService {
  @override
  Future<void> delete(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }

  @override
  Future<T?> read<T>(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(key) as T;
  }

  @override
  Future<void> write<T>(String key, T value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (T) {
      case String:
        await prefs.setString(key, value as String);
        return;
      case int:
        await prefs.setInt(key, value as int);
        return;
      case double:
        await prefs.setDouble(key, value as double);
        return;
      case bool:
        await prefs.setBool(key, value as bool);
        return;
    }

    throw Exception('Type $T is not supported');
  }
}
