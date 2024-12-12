import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// Entity class for language.
class LanguageEntity {
  /// Instantiate [LanguageEntity].
  LanguageEntity({
    required this.name,
    required this.locale,
  });

  /// Name of the language. Example: English, Deutsch, etc.
  final String name;

  /// Locale of the language. Example: en, de, etc.
  final Locale locale;

  /// Converts [LanguageEntity] to [LanguageModel].
  LanguageModel toModel(String flag) => LanguageModel(
        name: name,
        code: locale.languageCode,
        flag: flag,
        countryCode: locale.countryCode ?? '',
      );
}
