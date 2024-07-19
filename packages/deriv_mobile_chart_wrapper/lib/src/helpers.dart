import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';

/// Returns the path to the icon of the indicator for the given [config].
String getIndicatorIconPath(IndicatorConfig config) {
  switch (config.runtimeType) {
    case MACDIndicatorConfig:
      return macdIcon;
    case RSIIndicatorConfig:
      return rsiIcon;
    case BollingerBandsIndicatorConfig:
      return bollingerBandsIcon;
    case MAIndicatorConfig:
      return movingAverageIcon;
    default:
      return '';
  }
}
