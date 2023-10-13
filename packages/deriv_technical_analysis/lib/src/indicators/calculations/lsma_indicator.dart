import '../../models/models.dart';
import '../cached_indicator.dart';
import '../indicator.dart';
import 'sma_indicator.dart';
import 'wma_indicator.dart';

/// Least Square Moving Average indicator
class LSMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  LSMAIndicator(this.indicator, this.period)
      : wma = WMAIndicator<T>(indicator, period),
        sma = SMAIndicator<T>(indicator, period),
        super.fromIndicator(indicator);

  /// Period
  final int period;

  /// Indicator
  final Indicator<T> indicator;

  /// Weighted Moving Average
  final CachedIndicator<T> wma;

  /// Simple Moving Average
  final CachedIndicator<T> sma;

  @override
  T calculate(int index) {
    final double result =
        3 * wma.getValue(index).quote - 2 * sma.getValue(index).quote;
    return createResult(
      index: index,
      quote: result,
    );
  }

  @override
  void copyValuesFrom(covariant LSMAIndicator<T> other) {
    super.copyValuesFrom(other);
    sma.copyValuesFrom(other.sma);
    wma.copyValuesFrom(other.wma);
  }

  @override
  void invalidate(int index) {
    sma.invalidate(index);
    wma.invalidate(index);
    super.invalidate(index);
  }
}
