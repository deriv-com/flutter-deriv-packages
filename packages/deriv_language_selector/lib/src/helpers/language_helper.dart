import 'package:deriv_language_selector/deriv_language_selector.dart';
import 'package:flutter/material.dart';

Locale getLocaleFromString(String code) {
  final List<String> codes = code.split('_');
  final Locale locale = Locale(codes[0], codes.length > 1 ? codes[1] : null);
  return locale;
}

List<LanguageEntity> defaultLanguages = [
  LanguageEntity(
    name: 'English',
    locale: const Locale('en'),
  ),
  LanguageEntity(
    name: 'Deutsch',
    locale: const Locale('de'),
  ),
  LanguageEntity(
    name: 'Español',
    locale: const Locale('es'),
  ),
  LanguageEntity(
    name: 'Русский',
    locale: const Locale('ru'),
  ),
  LanguageEntity(
    name: 'Tiếng Việt',
    locale: const Locale('vi'),
  ),
  LanguageEntity(
    name: 'Français',
    locale: const Locale('fr'),
  ),
  LanguageEntity(
    name: 'ไทย',
    locale: const Locale('th'),
  ),
  LanguageEntity(
    name: 'Italiano',
    locale: const Locale('it'),
  ),
  LanguageEntity(
    name: 'Polski',
    locale: const Locale('pl'),
  ),
  LanguageEntity(
    name: 'Português',
    locale: const Locale('pt'),
  ),
  LanguageEntity(
    name: 'العربية',
    locale: const Locale('ar'),
  ),
  LanguageEntity(
    name: '中文',
    locale: const Locale('zh'),
  ),
];
