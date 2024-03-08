import 'package:deriv_ui/deriv_ui.dart';

/// Base class for language service.
abstract class BaseLanguageService {
  /// Get active languages for the app.
  Future<void> getActiveLanguages();

  /// Load and set the language.
  Future<void> loadAndSetLanguage(LanguageModel language);

  /// Reconnect to server with new language.
  void reconnectToServerWithNewLanguage(LanguageModel language);

  /// Get the current language.
  Future<LanguageModel> getCurrentLanguage();
}
