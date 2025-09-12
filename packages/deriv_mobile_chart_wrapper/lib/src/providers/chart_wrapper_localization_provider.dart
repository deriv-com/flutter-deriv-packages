import 'package:deriv_localizations/l10n/generated/deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
import 'package:flutter/material.dart';

/// Provider for DerivMobileChartWrapperLocalizations.
class ChartWrapperLocalizationProvider extends InheritedWidget {
  /// Creates a LocalizationProvider.
  const ChartWrapperLocalizationProvider({
    required this.localizations,
    required super.child,
    super.key,
  });

  /// The localizations instance.
  final DerivMobileChartWrapperLocalizations localizations;

  /// Gets the localizations from the nearest LocalizationProvider ancestor.
  static DerivMobileChartWrapperLocalizations of(BuildContext context) {
    final ChartWrapperLocalizationProvider? provider = context
        .dependOnInheritedWidgetOfExactType<ChartWrapperLocalizationProvider>();
    assert(
      provider != null,
      'No LocalizationProvider found in context',
    );
    return provider!.localizations;
  }

  @override
  bool updateShouldNotify(ChartWrapperLocalizationProvider oldWidget) =>
      localizations != oldWidget.localizations;
}
