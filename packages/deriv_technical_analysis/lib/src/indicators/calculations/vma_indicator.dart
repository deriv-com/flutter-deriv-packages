import '../../models/models.dart';
import '../cached_indicator.dart';
import '../indicator.dart';
import 'cmo_indicator.dart';

/// Variable Moving Average Indicator
class VMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  VMAIndicator(this.indicator, this.period)
      : cmoIndicator = CMOIndicator<T>(indicator, 9),
        super.fromIndicator(indicator);

  /// Indicator to calculate VMAA on
  final Indicator<T> indicator;

  /// Chande Momentum Oscillator indicator
  final CachedIndicator<T> cmoIndicator;

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

  @override
  void copyValuesFrom(covariant VMAIndicator<T> other) {
    super.copyValuesFrom(other);
    cmoIndicator.copyValuesFrom(other.cmoIndicator);
  }

  @override
  void invalidate(int index) {
    cmoIndicator.invalidate(index);
    super.invalidate(index);
  }
}
