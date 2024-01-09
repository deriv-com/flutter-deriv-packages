import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeProvider get theme => DerivThemeProvider.getTheme(this);
}
