import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// Modified moving average indicator.
class MMAIndicator<T extends IndicatorResult> extends AbstractEMAIndicator<T> {
  /// Initialzes a modifed moving average indicator.
  MMAIndicator(
    Indicator<T> indicator,
    int period,
  ) : super(indicator, period, 1.0 / period);
}
