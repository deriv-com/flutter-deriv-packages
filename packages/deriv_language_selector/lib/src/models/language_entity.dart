import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class LanguageEntity {
  final String name;
  final Locale locale;

  LanguageEntity({
    required this.name,
    required this.locale,
  });

  LanguageModel toModel(String flag) {
    return LanguageModel(
      name: name,
      code: locale.languageCode,
      flag: flag,
    );
  }
}
