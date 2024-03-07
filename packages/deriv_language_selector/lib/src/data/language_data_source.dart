import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class LanguageDataSource implements BaseLanguageDataSource {
  /// Local storage key of application language
  final String localStorageKey;

  LanguageDataSource({
    required this.prefInstance,
    this.localStorageKey = 'appLanguage',
  });
  final SharedPreferences prefInstance;

  @override
  Future<String?> getLanguage({bool shouldReload = false}) async {
    if (shouldReload) {
      await prefInstance.reload();
    }
    return prefInstance.getString(localStorageKey);
  }

  @override
  Future<void> setLanguage(String language) {
    return prefInstance.setString(localStorageKey, language);
  }
}
