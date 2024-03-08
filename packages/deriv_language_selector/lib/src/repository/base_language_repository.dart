import 'package:flutter/material.dart';

/// Base class for Language Repository that will
/// be implemented by client apps.
abstract class BaseLanguageRepository {
  /// Get supported languages from server.
  Future<List<String>> getSupportedLanguagesFromServer();

  /// Reconnect to server with new language.
  void reconnectToServerWithNewLanguage(Locale locale);

  /// Load the selected language.
  Future<void> loadLanguage(Locale locale);
}
