/// Base class for language data source

abstract class BaseLanguageDataSource {
  /// Get the current language from shared preferences.
  Future<String?> getLanguage({bool shouldReload = false});

  /// Set the language in shared preferences.
  Future<void> setLanguage(String language);
}
