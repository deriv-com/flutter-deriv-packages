import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

typedef SupportedLanguages = Set<Map<String, String>>;

final class LanguageService implements BaseLanguageService {
  final BaseLanguageRepository languageRepository;
  final LanguageDataSource languageDataSource;
  final List<LanguageEntity>? supportedLanguages;

  LanguageService({
    required this.languageRepository,
    required this.languageDataSource,
    this.supportedLanguages,
  });

  List<LanguageModel> _languages = _generateLanguages([], defaultLanguages);

  LanguageModel get defaultLanguage => _languages.first;

  List<LanguageModel> get languages => _languages;

  @override
  Future<LanguageModel> getCurrentLanguage() async {
    final code = await languageDataSource.getLanguage();

    if (code == null) {
      return _languages.first;
    } else {
      return _languages.firstWhere((element) => element.code == code);
    }
  }

  @override
  Future<void> getActiveLanguages({bool isStream = false}) async {
    final localLanguages = supportedLanguages ?? defaultLanguages;

    if (isStream) {
      _setLanguges([], localLanguages);

      /// In deriv go, they get active languages from the stream.
      /// This is to set up method for new event stream.
      await languageRepository.getSupportedLanguagesFromServer(
        onLanguagesFetched: (List<String> activeLanguages) {
          _setLanguges(activeLanguages, localLanguages);
        },
      );
    } else {
      final activeLanguages =
          await languageRepository.getSupportedLanguagesFromServer();

      _setLanguges(activeLanguages, localLanguages);
    }
  }

  _setLanguges(
      List<String> activeLanguages, List<LanguageEntity> localLanguages) {
    _languages = _generateLanguages(
        localLanguages
            .where((language) =>
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
  ) {
    return localLanguages
        .where((language) =>
            activeLanguages.isEmpty ||
            activeLanguages
                .where((element) => element.locale == language.locale)
                .isNotEmpty)
        .map((activeLanguage) => activeLanguage.toModel(
            'assets/icons/flags/ic_flag_${activeLanguage.locale.languageCode}.png'))
        .toList();
  }
}
