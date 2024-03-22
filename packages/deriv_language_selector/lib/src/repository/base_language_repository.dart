import 'dart:async';

import 'package:flutter/material.dart';

/// Base class for Language Repository that will
/// be implemented by client apps.
abstract class BaseLanguageRepository {
  /// Get supported languages from server.
  /// [onLanguageFetched] is helpful for case when languages are fetched from a stream.
  /// It will update the active languages in [LanguageService] which is used by [LanguageCubit].
  ///
  /// Example: Deriv Go app fetches languages from a stream. Deriv Go can use
  /// this method to update the active languages in the app.
  /// P2P fetches from Remote Config as Future. P2P can ignore this parameter.
  FutureOr<List<String>?> getSupportedLanguagesFromServer({
    required ValueSetter<List<String>> onLanguageFetched,
  });

  /// Reconnect to server with new language.
  void reconnectToServerWithNewLanguage(Locale locale);

  /// Load the selected language.
  Future<void> loadLanguage(Locale locale);
}
