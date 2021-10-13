import 'dart:math';

import 'package:deriv_technical_analysis/src/indicators/calculations/sma_indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../cached_indicator.dart';
import '../indicator.dart';

/// Triangular Moving Average indicator
class TRIMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  TRIMAIndicator(Indicator<T> inputIndicator, int inputPeriod)
      : period = (inputPeriod / 2).ceil(),
        indicator = SMAIndicator<T>(inputIndicator, (inputPeriod / 2).ceil()),
        super.fromIndicator(inputIndicator);

  /// the period
  final int period;

  /// SMA Indicator calculated with half period
  final Indicator<T> indicator;

  @override
  T calculate(int index) {
    double sum = 0;
    for (int i = max(0, index - period + 1); i <= index; i++) {
      sum += indicator.getValue(i).quote;
    }

    final int realPeriod = min(period, index + 1);

    return createResult(index: index, quote: sum / realPeriod);
  }
}
