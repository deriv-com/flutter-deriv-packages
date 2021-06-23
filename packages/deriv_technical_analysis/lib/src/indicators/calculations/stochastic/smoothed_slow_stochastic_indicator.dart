import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';
import '../sma_indicator.dart';
import 'slow_stochastic_indicator.dart';

/// A stochastic oscillator is a popular technical indicator for generating overbought and oversold signals.
class SmoothedSlowStochasticIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes a Fast Stochastic Indicator.
  SmoothedSlowStochasticIndicator(
    SlowStochasticIndicator<T> slowPercentKStochasticIndicator, {
    int period = 3,
  })  : _smaIndicator =
            SMAIndicator<T>(slowPercentKStochasticIndicator, period),
        super.fromIndicator(slowPercentKStochasticIndicator);

  final SMAIndicator<T> _smaIndicator;

  @override
  T calculate(int index) =>
      createResult(index: index, quote: _smaIndicator.getValue(index).quote);

  @override
  void copyValuesFrom(covariant SmoothedSlowStochasticIndicator<T> other) {
    super.copyValuesFrom(other);
    _smaIndicator.copyValuesFrom(other._smaIndicator);
  }

  @override
  void invalidate(int index) {
    _smaIndicator.invalidate(index);
    super.invalidate(index);
  }
}
