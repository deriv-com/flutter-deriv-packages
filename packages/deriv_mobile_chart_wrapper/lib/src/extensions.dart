import 'package:deriv_localizations/l10n/generated/deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Extension for [BuildContext].
extension ContextExtension on BuildContext {
  /// Get DerivMobileChartWrapperLocalizations.
  DerivMobileChartWrapperLocalizations get mobileChartWrapperLocalizations =>
      DerivMobileChartWrapperLocalizations.of(this);

  ThemeProvider get themeProvider => DerivThemeProvider.getTheme(this);
}
