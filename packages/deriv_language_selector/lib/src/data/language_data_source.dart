import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LanguageDataSource implements BaseLanguageDataSource {
  /// Local storage key of application language
  final String localStorageKey;

  LanguageDataSource({
    this.localStorageKey = 'appLanguage',
  }) {
    _init();
  }

  late SharedPreferences _sharedPreferences;

  _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getLanguage({bool shouldReload = false}) async {
    if (shouldReload) {
      await _sharedPreferences.reload();
    }
    return _sharedPreferences.getString(localStorageKey);
  }

  @override
  Future<void> setLanguage(String language) {
    return _sharedPreferences.setString(localStorageKey, language);
  }
}
