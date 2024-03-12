import 'package:deriv_ui/deriv_ui.dart';

/// Base class for language service which interacts with
/// [BaseLanguageRepository] and [BaseLanguageDataSource].
abstract class BaseLanguageService {
  /// Get active languages for the app.
  /// This will call [BaseLanguageRepository.getSupportedLanguagesFromServer]
  /// and set the active languages which will be used by [LanguageCubit].
  Future<void> getActiveLanguages();

  /// Start loading the resources for `locale` and
  /// saves the provided language in shared preferences through [BaseLanguageDataSource].
  Future<void> loadAndSetLanguage(LanguageModel language);

  /// Reconnect to server with new language.
  void reconnectToServerWithNewLanguage(LanguageModel language);

  /// Get the current language.
  Future<LanguageModel> getCurrentLanguage();
}
