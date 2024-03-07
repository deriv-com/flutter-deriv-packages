part of 'language_cubit.dart';

/// Abstract form language state.
abstract class LanguageState {
  /// Instantiate [LanguageState].
  LanguageState({
    required this.language,
    required this.activeLanguages,
  });

  /// Language
  final LanguageModel language;

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
