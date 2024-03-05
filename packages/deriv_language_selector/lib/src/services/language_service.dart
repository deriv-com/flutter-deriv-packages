import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SupportedLanguages = Set<Map<String, String>>;

final class LanguageService implements BaseLanguageService {
  final BaseLanguageRepository languageRepository;
  final String localStorageKey;
  final List<LanguageEntity>? supportedLanguages;
  final SharedPreferences? sharedPreferences;

  LanguageService({
    required this.languageRepository,
    this.supportedLanguages,
    this.sharedPreferences,
    this.localStorageKey = 'appLanguage',
  }) {
    _init();
  }

  late SharedPreferences _prefInstance;
  late LanguageDataSource _languageDataSource;
  late List<LanguageModel> _languages;
  late List<LanguageEntity> _supportedLanguages;

  /// instantiating shared preferences.
  Future<void> _init() async {
    _prefInstance = sharedPreferences ?? await SharedPreferences.getInstance();
    _languageDataSource = LanguageDataSource(
      localStorageKey: localStorageKey,
      sharedPreferences: _prefInstance,
    );
    _supportedLanguages = supportedLanguages ?? defaultLanguages;
    _languages = _setLanguages(_supportedLanguages);
  }

  @override
  Future<LanguageModel> getCurrentLanguage() async {
    final code = await _languageDataSource.getLanguage();

    if (code == null) {
      return _languages.first;
    } else {
      return _languages.firstWhere((element) => element.code == code);
    }
  }

  @override
  Future<List<LanguageModel>> getActiveLanguages() async {
    final activeLanguages =
        await languageRepository.getSupportedLanguagesFromServer();

    _languages = _setLanguages(_supportedLanguages
        .where((language) =>
            activeLanguages.contains(language.locale.languageCode))
        .toList());

    return _languages;
  }

  @override
  Future<void> loadAndSetLanguage(LanguageModel language) async {
    await languageRepository.loadLanguage(Locale(language.code));

    await _languageDataSource.setLanguage(language.code);
  }

  @override
  void reconnectToServerWithNewLanguage(LanguageModel language) {
    languageRepository.reconnectToServerWithNewLanguage(Locale(language.code));
  }

  _setLanguages(List<LanguageEntity> activeLanguages) {
    _languages = _supportedLanguages
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
