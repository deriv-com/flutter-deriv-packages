import 'dart:math';

import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/gain_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/loss_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// Chande Momentum Oscillator indicator.
class CMOIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  CMOIndicator(Indicator<T> indicator, this.period)
      : _gainIndicator = GainIndicator<T>.fromIndicator(indicator),
        _lossIndicator = LossIndicator<T>.fromIndicator(indicator),
        super.fromIndicator(indicator);
  final GainIndicator<T> _gainIndicator;
  final LossIndicator<T> _lossIndicator;

  /// The period.
  final int period;

  @override
  T calculate(int index) {
    double sumOfGains = 0;
    for (int i = max(1, index - period + 1); i <= index; i++) {
      sumOfGains += _gainIndicator.getValue(i).quote;
    }
    double sumOfLosses = 0;
    for (int i = max(1, index - period + 1); i <= index; i++) {
      sumOfLosses += _lossIndicator.getValue(i).quote;
    }
    return createResult(
      index: index,
      quote: ((sumOfGains - sumOfLosses) / (sumOfGains + sumOfLosses)) * 100,
    );
  }

  @override
  void copyValuesFrom(covariant CMOIndicator<T> other) {
    super.copyValuesFrom(other);
    _gainIndicator.copyValuesFrom(other._gainIndicator);
    _lossIndicator.copyValuesFrom(other._lossIndicator);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);
    _gainIndicator.invalidate(index);
    _lossIndicator.invalidate(index);
  }
}
