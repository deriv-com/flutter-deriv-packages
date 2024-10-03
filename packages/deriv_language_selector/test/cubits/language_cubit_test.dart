import 'package:bloc_test/bloc_test.dart';
import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/components/language_selector/models/language_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock.dart';

void main() {
  group('LanguageCubit', () {
    late MockLanguageService mockLanguageService;
    late LanguageCubit languageCubit;

    setUp(() {
      mockLanguageService = MockLanguageService();

      registerFallbackValue(mockLanguageModel);

      when(() => mockLanguageService.defaultLanguage)
          .thenReturn(mockLanguageModel);
      when(() => mockLanguageService.languages)
          .thenReturn(<LanguageModel>[mockLanguageModel]);
      when(() => mockLanguageService.getCurrentLanguage())
          .thenAnswer((_) async => mockLanguageModel);
      when(() => mockLanguageService.getActiveLanguages())
          .thenAnswer((_) async {});
      when(() => mockLanguageService.loadAndSetLanguage(any()))
          .thenAnswer((_) async {});
      when(() => mockLanguageService.reconnectToServerWithNewLanguage(any()))
          .thenAnswer((_) async {});

      languageCubit = LanguageCubit(languageService: mockLanguageService, onLanguageChanged: (_) {});
    });

    blocTest<LanguageCubit, LanguageState>(
      'emits [LanguageLoadedState] when updateLanguage is called',
      build: () => languageCubit,
      seed: () => LanguageLoadedState(
        language: LanguageModel(name: 'name', code: 'code', flag: 'flag'),
        activeLanguages: mockLanguageService.languages,
      ),
      act: (LanguageCubit cubit) => cubit.updateLanguage(mockLanguageModel),
      expect: () => <LanguageState>[
        LanguageLoadedState(
          language: mockLanguageModel,
          activeLanguages: mockLanguageService.languages,
        ),
      ],
    );

    blocTest<LanguageCubit, LanguageState>(
      'emits [LanguageLoadedState] when updateActiveLanguages is called',
      build: () => languageCubit,
      seed: () => LanguageLoadedState(
        language: LanguageModel(name: 'name', code: 'code', flag: 'flag'),
        activeLanguages: mockLanguageService.languages,
      ),
      act: (LanguageCubit cubit) => cubit.updateActiveLanguages(),
      expect: () => <LanguageState>[
        LanguageLoadedState(
          language: mockLanguageModel,
          activeLanguages: mockLanguageService.languages,
        ),
      ],
    );
  });
}
