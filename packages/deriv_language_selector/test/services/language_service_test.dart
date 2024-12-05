import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock.dart';

void main() {
  group('LanguageService', () {
    late MockLanguageRepository mockLanguageRepository;
    late MockLanguageDataSource mockLanguageDataSource;
    late LanguageService languageService;

    setUp(() {
      registerFallbackValue(const Locale('en'));

      mockLanguageRepository = MockLanguageRepository();
      mockLanguageDataSource = MockLanguageDataSource();
      languageService = LanguageService(
        languageRepository: mockLanguageRepository,
        languageDataSource: mockLanguageDataSource,
        supportedLanguages: <LanguageEntity>[
          mockLanguageEntity
        ], // Provide a list of supported languages
      );
    });

    test('.getCurrentLanguage returns default language when no language is set',
        () async {
      when(() => mockLanguageDataSource.getLanguage())
          .thenAnswer((_) async => null);

      expect(await languageService.getCurrentLanguage(),
          languageService.defaultLanguage);
    });

    test('.getCurrentLanguage returns the set language', () async {
      when(() => mockLanguageDataSource.getLanguage())
          .thenAnswer((_) async => mockLanguageModel.code);

      expect(
          await languageService.getCurrentLanguage(),
          isA<LanguageModel>().having(
            (LanguageModel p0) => p0.code,
            'Language code',
            mockLanguageModel.code,
          ));
    });

    test('.loadAndSetLanguage calls load and set language', () async {
      when(() => mockLanguageRepository.loadLanguage(any()))
          .thenAnswer((_) async {});
      when(() => mockLanguageDataSource.setLanguage(mockLanguageModel.code))
          .thenAnswer((_) async {});

      await languageService.loadAndSetLanguage(mockLanguageModel);

      verify(() => mockLanguageDataSource.setLanguage(mockLanguageModel.code))
          .called(1);
      verify(() => mockLanguageRepository.loadLanguage(
              Locale(mockLanguageModel.code, mockLanguageModel.countryCode)))
          .called(1);
    });

    test(
        '.reconnectToServerWithNewLanguage calls `reconnectToServerWithNewLanguage` from `LanguageRepository`',
        () async {
      when(() => mockLanguageRepository.reconnectToServerWithNewLanguage(any()))
          .thenAnswer((_) async {});

      languageService.reconnectToServerWithNewLanguage(mockLanguageModel);

      verify(() => mockLanguageRepository.reconnectToServerWithNewLanguage(
              Locale(mockLanguageModel.code, mockLanguageModel.countryCode)))
          .called(1);
    });

    test('.getActiveLanguages sets the active languages', () async {
      when(() => mockLanguageRepository.getSupportedLanguagesFromServer(
            onLanguageFetched: any(named: 'onLanguageFetched'),
          )).thenAnswer((_) async => <String>[mockLanguageModel.code]);

      await languageService.getActiveLanguages();

      expect(
          languageService.languages,
          isA<List<LanguageModel>>().having(
              (List<LanguageModel> p0) => p0
                  .where((LanguageModel element) =>
                      element.code == mockLanguageModel.code)
                  .isNotEmpty,
              'description',
              true));
    });
  });
}
