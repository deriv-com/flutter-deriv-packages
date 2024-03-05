import 'package:flutter/material.dart';

abstract class BaseLanguageRepository {
  /// Get supported languages from server.
  Future<List<String>> getSupportedLanguagesFromServer();

  /// Reconnect to server with new language.
  void reconnectToServerWithNewLanguage(Locale locale);

  /// Load the selected language.
  Future<void> loadLanguage(Locale locale);
}
