abstract class BaseLanguageDataSource {
  Future<String?> getLanguage({bool shouldReload = false});

  Future<void> setLanguage(String language);
}
