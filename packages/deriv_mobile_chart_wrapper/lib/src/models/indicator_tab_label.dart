import 'package:deriv_mobile_chart_wrapper/src/enums.dart';

/// An enum to define label of indicators chip.
enum IndicatorTabLabel {
  active,
  all,
  momentum,
  volatility,
  movingAverages;

  static String activeCount(int count) => 'Active ($count)';

  String get title {
    switch (this) {
      case IndicatorTabLabel.active:
        return 'Active';
      case IndicatorTabLabel.all:
        return 'All';
      case IndicatorTabLabel.momentum:
        return 'Momentum';
      case IndicatorTabLabel.volatility:
        return 'Volatility';
      case IndicatorTabLabel.movingAverages:
        return 'Moving averages';
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
