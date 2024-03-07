part of 'language_cubit.dart';

/// Abstract for language state.
abstract class LanguageState {
  /// Instantiate [LanguageState].
  LanguageState({
    required this.language,
    required this.activeLanguages,
  });

  /// Instance of [LanguageModel].
  final LanguageModel language;

  /// Languages currently actively supported in the app.
  final List<LanguageModel> activeLanguages;
}

/// Language Loaded state.
class LanguageLoadedState extends LanguageState {
  /// Instantiate [LanguageLoadedState].
  LanguageLoadedState(
      {required LanguageModel language,
      required List<LanguageModel> activeLanguages})
      : super(language: language, activeLanguages: activeLanguages);
}
