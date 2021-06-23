import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';
import '../sma_indicator.dart';
import 'fast_stochastic_indicator.dart';

/// %D also known as the Slow Stochastic Indicator.
/// It is a 3-period moving average of %K.
class SlowStochasticIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes a Slow Stochastic Indicator from the given [IndicatorDataInput].
  SlowStochasticIndicator(
    IndicatorDataInput input, {
    int period = 3,
  })  : _stochasticOscillatorDIndicator =
            SMAIndicator<T>(FastStochasticIndicator<T>(input), period),
        super(input);

  /// Initializes a Slow Stochastic Indicator from the given [FastStochasticIndicator].
  SlowStochasticIndicator.fromIndicator(
    Indicator<T> fastStochasticIndicator,
  )   : _stochasticOscillatorDIndicator =
            SMAIndicator<T>(fastStochasticIndicator, 3),
        super.fromIndicator(fastStochasticIndicator);

  final SMAIndicator<T> _stochasticOscillatorDIndicator;

  @override
  T calculate(int index) => createResult(
      index: index,
      quote: _stochasticOscillatorDIndicator.getValue(index).quote);

  @override
  void copyValuesFrom(covariant SlowStochasticIndicator<T> other) {
    super.copyValuesFrom(other);
    _stochasticOscillatorDIndicator
        .copyValuesFrom(other._stochasticOscillatorDIndicator);
  }

  @override
  void invalidate(int index) {
    _stochasticOscillatorDIndicator.invalidate(index);
    super.invalidate(index);
  }
}
