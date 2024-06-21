import 'package:deriv_localizations/l10n/generated/deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
import 'package:flutter/material.dart';

/// Extension for [BuildContext]
extension ContextExtension on BuildContext {
  /// Get derivPasskeysLocalizations.
  DerivMobileChartWrapperLocalizations
      get mobileChartWrapperLocalizations =>
          DerivMobileChartWrapperLocalizations.of(this);
}
