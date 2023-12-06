import 'dart:math';

import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// An indicator which calculates the previous values of the given indicator.
class PreviousValueIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes A [PreviousValueIndicator].
  PreviousValueIndicator.fromIndicator(
    this.indicator, {
    this.period = 1,
  })  : assert(period > 0),
        super.fromIndicator(indicator);

  /// The [indicator] to calculate the previous value of.
  final Indicator<T> indicator;

  /// The period to calculate the previous value from.
  final int period;

  @override
  T calculate(int index) {
    final int previousIndex = max(0, index - period);

    return createResult(
      index: index,
      quote: indicator.getValue(previousIndex).quote,
    );
  }
}
