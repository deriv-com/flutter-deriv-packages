import 'package:flutter/material.dart';

import 'package:deriv_theme/deriv_theme_provider.dart';
import 'package:deriv_theme/theme_provider.dart';

/// Extension methods for [BuildContext].
extension ContextExtension on BuildContext {
  /// Gets [ThemeProvider].
  ThemeProvider get theme => DerivThemeProvider.getTheme(this);
}
