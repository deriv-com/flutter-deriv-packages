import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// Implementation of [BaseLanguageService].
class LanguageService implements BaseLanguageService {
  /// Instantiate [LanguageService].
  LanguageService({
    required this.languageRepository,
    required this.languageDataSource,
    this.supportedLanguages,
  });

  /// Instantance of [BaseLanguageRepository].
  final BaseLanguageRepository languageRepository;

  /// Instantance of [BaseLanguageDataSource].
  final BaseLanguageDataSource languageDataSource;

  /// List of supported languages.
  final List<LanguageEntity>? supportedLanguages;

  List<LanguageModel> _languages =
      _generateLanguages(<LanguageEntity>[], defaultLanguages);

  /// Default language of the app.
  LanguageModel get defaultLanguage => _languages.first;

  /// List of active languages.
  List<LanguageModel> get languages => _languages;

  @override
  Future<LanguageModel> getCurrentLanguage() async {
    final String? code = await languageDataSource.getLanguage();

    if (code == null) {
      return _languages.first;
    } else {
      return _languages
          .firstWhere((LanguageModel element) => element.code == code);
    }
  }

  @override
  Future<void> getActiveLanguages() async {
    final List<LanguageEntity> localLanguages =
        supportedLanguages ?? defaultLanguages;

    final List<String> activeLanguages =
        (await languageRepository.getSupportedLanguagesFromServer(
              onLanguageFetched: (List<String> value) {
                _setLanguges(value,
                    localLanguages); // useful for stream (refer to Deriv Go's getSupportedLanguagesFromServer method)
              },
            )) ??
            <String>[];

    _setLanguges(activeLanguages, localLanguages);
  }

  /// Set the active languages.
  void _setLanguges(
      List<String> activeLanguages, List<LanguageEntity> localLanguages) {
    _languages = _generateLanguages(
        localLanguages
            .where((LanguageEntity language) =>
                activeLanguages.contains(language.locale.languageCode))
            .toList(),
        localLanguages);
  }

  @override
  Future<void> loadAndSetLanguage(LanguageModel language) async {
    await languageRepository.loadLanguage(Locale(language.code));

    await languageDataSource.setLanguage(language.code);
  }

  @override
  void reconnectToServerWithNewLanguage(LanguageModel language) {
    languageRepository.reconnectToServerWithNewLanguage(Locale(language.code));
  }

  static List<LanguageModel> _generateLanguages(
    List<LanguageEntity> activeLanguages,
    List<LanguageEntity> localLanguages,
  ) =>
      localLanguages
          .where((LanguageEntity language) =>
              activeLanguages.isEmpty ||
              activeLanguages
                  .where((LanguageEntity element) =>
                      element.locale == language.locale)
                  .isNotEmpty)
          .map((LanguageEntity activeLanguage) => activeLanguage.toModel(
              'assets/icons/flags/ic_flag_${activeLanguage.locale.languageCode}.png'))
          .toList();
}
