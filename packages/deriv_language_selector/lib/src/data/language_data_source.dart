import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LanguageDataSource implements BaseLanguageDataSource {
  /// Local storage key of application language
  final String localStorageKey;

  /// Shared Preferences instance.
  final SharedPreferences sharedPreferences;

  LanguageDataSource({
    required this.localStorageKey,
    required this.sharedPreferences,
  });

  @override
  Future<String?> getLanguage({bool shouldReload = false}) async {
    if (shouldReload) {
      await sharedPreferences.reload();
    }
    return sharedPreferences.getString(localStorageKey);
  }

  @override
  Future<void> setLanguage(String language) {
    return sharedPreferences.setString(localStorageKey, language);
  }
}
