import 'dart:math';

import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../lowest_value_indicator.dart';

/// Aroon Down indicator.
class AroonDownIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes a gain indicator from the given [minValueIndicator].
  /// minValueIndicator the indicator for the min price
  /// (default is LowValueIndicator)
  AroonDownIndicator.fromIndicator(this.minValueIndicator, {int period = 14})
      : _period = period,
        // + 1 needed for last possible iteration in loop
        _lowestValueIndicator =
            LowestValueIndicator<T>(minValueIndicator, period + 1),
        super.fromIndicator(minValueIndicator);

  /// Indicator to calculate Aroon Down on.
  final Indicator<T> minValueIndicator;

  /// Indicator to calculate Aroon Down on.
  final LowestValueIndicator<T> _lowestValueIndicator;

  /// The period
  final int _period;

  @override
  T calculate(int index) {
    // Getting the number of bars since the lowest close price
    final int endIndex = max(0, index - _period);
    int nbBars = 0;
    for (int i = index; i > endIndex; i--) {
      if (minValueIndicator.getValue(i).quote ==
          (_lowestValueIndicator.getValue(index).quote)) {
        break;
      }
      nbBars++;
    }
    return createResult(
        index: index, quote: ((_period - nbBars) / _period) * 100);
  }

  @override
  void copyValuesFrom(covariant AroonDownIndicator<T> other) {
    super.copyValuesFrom(other);
    _lowestValueIndicator.copyValuesFrom(other._lowestValueIndicator);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);
    _lowestValueIndicator.invalidate(index);
  }
}
