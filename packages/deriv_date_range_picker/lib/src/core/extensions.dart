import 'package:deriv_theme/deriv_theme_provider.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// Get theme.
  ThemeProvider get theme => DerivThemeProvider.getTheme(this);

  /// Get localization.
  MaterialLocalizations get localization => MaterialLocalizations.of(this);
}
