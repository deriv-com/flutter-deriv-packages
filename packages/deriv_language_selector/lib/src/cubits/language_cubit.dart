import 'dart:async';
import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deriv_ui/deriv_ui.dart';

part 'language_state.dart';

/// {@template language_cubit}
/// A [Cubit] which manages the language state of the app.
/// {@endtemplate}
class LanguageCubit extends Cubit<LanguageState> {
  /// {@macro language_cubit}
  LanguageCubit({
    required this.languageService,
    this.isActiveLanguageStream = false,
  }) : super(LanguageLoadedState(
          language: languageService.defaultLanguage,
          activeLanguages: languageService.languages,
        )) {
    _loadCurrentLanguage();
  }

  /// Language service.
  final LanguageService languageService;

  /// Determines if the language from server
  /// should be listened to. Default is false.
  final bool isActiveLanguageStream;

  /// Updates the language and emits [LanguageLoadedState].
  Future<void> updateLanguage(
    LanguageModel language,
  ) async {
    await languageService.loadAndSetLanguage(language);

    emit(LanguageLoadedState(
        language: language, activeLanguages: languageService.languages));
    languageService.reconnectToServerWithNewLanguage(language);
  }

  /// Loads the current language and emits [LanguageLoadedState].
  Future<void> _loadCurrentLanguage() async {
    final LanguageModel language = await languageService.getCurrentLanguage();
    await languageService.getActiveLanguages(
      isStream: isActiveLanguageStream,
    );
    await updateLanguage(language);
  }
}
