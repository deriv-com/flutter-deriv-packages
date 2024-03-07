import 'dart:async';
import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv_ui/deriv_ui.dart';

part 'language_state.dart';

/// Language Bloc that manages the language localization in the app.
class LanguageCubit extends Cubit<LanguageState> {
  /// Instantiate [LanguageCubit].
  LanguageCubit({
    required this.languageService,
  }) : super(LanguageLoadedState(
          language: languageService.defaultLanguage,
          activeLanguages: languageService.languages,
        )) {
    _loadCurrentLanguage();
  }

  /// Language service.
  final LanguageService languageService;

  /// Updates the language.
  Future<void> updateLanguage(
    LanguageModel language,
  ) async {
    await languageService.loadAndSetLanguage(language);
    emit(LanguageLoadedState(
        language: language, activeLanguages: languageService.languages));
    languageService.reconnectToServerWithNewLanguage(language);
  }

  Future<void> _loadCurrentLanguage() async {
    final LanguageModel language = await languageService.getCurrentLanguage();
    await languageService.getActiveLanguages();
    await updateLanguage(language);
  }
}
