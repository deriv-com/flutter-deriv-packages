import 'package:flutter/material.dart';

/// `WidgetKeys` a centralized repository for defining unique keys
/// for widgets that Language Selector package provides.
class WidgetKeys {
  /// Key for [LanguageSelectorWidget] which is used for choosing the language.
  static const Key languageSelectorButtonKey =
      ValueKey<String>('language_selector_button');

  /// Key for [LanguageSelectorWidgetToggler] which is used for closing
  /// the language selector bottom sheet.
  static const Key languageSelectorBottomSheetTogglerKey =
      ValueKey<String>('language_selector_bottom_sheet_toggler');
}
