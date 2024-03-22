import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Implementation of [BaseLanguageDataSource]
final class LanguageDataSource implements BaseLanguageDataSource {
  /// Instantiate [LanguageDataSource].
  LanguageDataSource({
    required this.prefInstance,
    this.localStorageKey = 'appLanguage',
  });

  /// Local storage key of application language to
  /// be stored in shared preferences. Default is `appLanguage`.
  final String localStorageKey;

  /// Instance of shared preferences.
  final SharedPreferences prefInstance;

  @override
  Future<String?> getLanguage({bool shouldReload = false}) async {
    if (shouldReload) {
      await prefInstance.reload();
    }
    return prefInstance.getString(localStorageKey);
  }

  @override
  Future<void> setLanguage(String language) =>
      prefInstance.setString(localStorageKey, language);
}
