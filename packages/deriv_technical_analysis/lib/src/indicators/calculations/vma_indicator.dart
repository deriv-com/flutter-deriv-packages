import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/cmo_indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../cached_indicator.dart';
import '../indicator.dart';

/// Variable Moving Average Indicator
class VMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  VMAIndicator(this.indicator, this.period)
      : cmoIndicator = CMOIndicator<T>(indicator, 9),
        super.fromIndicator(indicator);

  /// Indicator to calculate VMAA on
  final Indicator<T> indicator;

  /// Chande Momentum Oscillator indicator
  final Indicator<T> cmoIndicator;

  /// Period
  final int period;

  @override
  T calculate(int index) {
    if (index == 0) {
      return indicator.getValue(index);
    }

    final double a = 2 / (period + 1);
    double cmo = (cmoIndicator.getValue(index).quote / 100).abs();
    if (cmo.isNaN) {
      cmo = 0;
    }
    final double prev = getValue(index - 1).quote;
    final double src = indicator.getValue(index).quote;

    final double result = a * cmo * (src - prev) + prev;
    return createResult(index: index, quote: result);
  }
}
