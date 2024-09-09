import 'package:deriv_mobile_chart_wrapper/src/enums.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

/// An enum to define label of indicators chip.
enum IndicatorTabLabel {
  active,
  all,
  momentum,
  volatility,
  movingAverages;

  static String activeCount(int count) => 'Active ($count)';

  String getTitle(BuildContext context) {
    switch (this) {
      case IndicatorTabLabel.active:
        return context.mobileChartWrapperLocalizations.labelActive;
      case IndicatorTabLabel.all:
        return context.mobileChartWrapperLocalizations.labelAll;
      case IndicatorTabLabel.momentum:
        return context.mobileChartWrapperLocalizations.labelMomentum;
      case IndicatorTabLabel.volatility:
        return context.mobileChartWrapperLocalizations.labelVolatility;
      case IndicatorTabLabel.movingAverages:
        return context.mobileChartWrapperLocalizations.labelMovingAverages;
    }
  }

  /// Defines each tab label is equivalent to which [IndicatorCategory].
  IndicatorCategory? get toIndicatorCategory {
    switch (this) {
      case IndicatorTabLabel.momentum:
        return IndicatorCategory.momentum;
      case IndicatorTabLabel.volatility:
        return IndicatorCategory.volatility;
      case IndicatorTabLabel.movingAverages:
        return IndicatorCategory.movingAverages;
      default:
        return null;
    }
  }
}
