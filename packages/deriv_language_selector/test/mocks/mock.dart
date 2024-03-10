import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockLanguageService extends Mock implements LanguageService {}

class MockLanguageDataSource extends Mock implements BaseLanguageDataSource {}

class MockLanguageRepository extends Mock implements BaseLanguageRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

final LanguageModel mockLanguageModel = LanguageModel(
  code: 'en',
  name: 'English',
  flag: 'en',
);

final LanguageEntity mockLanguageEntity = LanguageEntity(
  locale: const Locale('en'),
  name: 'English',
);
