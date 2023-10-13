import 'dart:math';

import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../highest_value_indicator.dart';

/// Aroon Up Indicator
class AroonUpIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes a gain indicator from the given [maxValueIndicator].
  /// maxValueIndicator the indicator for the max price
  /// (default is HighValueIndicator)
  AroonUpIndicator.fromIndicator(this.maxValueIndicator, {int period = 14})
      : _period = period,
        // + 1 needed for last possible iteration in loop
        _highestValueIndicator =
            HighestValueIndicator<T>(maxValueIndicator, period + 1),
        super.fromIndicator(maxValueIndicator);

  /// Indicator to calculate Aroon up on.
  final Indicator<T> maxValueIndicator;

  /// Indicator to calculate highest value.
  final HighestValueIndicator<T> _highestValueIndicator;

  /// The period
  final int _period;

  @override
  T calculate(int index) {
    // Getting the number of bars since the highest close price
    final int endIndex = max(0, index - _period);
    int nbBars = 0;
    for (int i = index; i > endIndex; i--) {
      if (maxValueIndicator.getValue(i).quote ==
          (_highestValueIndicator.getValue(index).quote)) {
        break;
      }
      nbBars++;
    }
    return createResult(
        index: index, quote: (_period - nbBars) / _period * 100);
  }

  @override
  void copyValuesFrom(covariant AroonUpIndicator<T> other) {
    _highestValueIndicator.copyValuesFrom(other._highestValueIndicator);
    super.copyValuesFrom(other);
  }

  @override
  void invalidate(int index) {
    _highestValueIndicator.invalidate(index);
    super.invalidate(index);
  }
}
