import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mocks/mock.dart';

void main() {
  group('LanguageDataSource', () {
    late SharedPreferences mockSharedPreferences;
    late LanguageDataSource dataSource;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      dataSource = LanguageDataSource(prefInstance: mockSharedPreferences);
    });

    test('.getLanguage returns stored language (no reload)', () async {
      const String expectedLanguage = 'en';
      when(() => mockSharedPreferences.getString(dataSource.localStorageKey))
          .thenReturn(expectedLanguage);

      final String? language = await dataSource.getLanguage();

      expect(language, expectedLanguage);
      verifyNever(() => mockSharedPreferences.reload());
    });

    test('.getLanguage reloads and returns stored language', () async {
      const String expectedLanguage = 'en';
      when(() => mockSharedPreferences.getString(dataSource.localStorageKey))
          .thenReturn(expectedLanguage);
      when(() => mockSharedPreferences.reload()).thenAnswer((_) async {});

      final String? language = await dataSource.getLanguage(shouldReload: true);

      expect(language, expectedLanguage);
      verify(() => mockSharedPreferences.reload()).called(1);
    });

    test('.getLanguage returns null if no language stored', () async {
      when(() => mockSharedPreferences.getString(dataSource.localStorageKey))
          .thenReturn(null);

      final String? language = await dataSource.getLanguage();

      expect(language, null);
    });

    test('.setLanguage stores the provided language', () async {
      const String language = 'es';

      when(() => mockSharedPreferences.setString(
          dataSource.localStorageKey, language)).thenAnswer((_) async => true);

      await dataSource.setLanguage(language);

      verify(() => mockSharedPreferences.setString(
          dataSource.localStorageKey, language)).called(1);
    });
  });
}
