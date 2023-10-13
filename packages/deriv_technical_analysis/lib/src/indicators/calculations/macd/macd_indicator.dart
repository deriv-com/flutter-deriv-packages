import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../ema_indicator.dart';
import '../helper_indicators/close_value_inidicator.dart';

/// Moving Average Convergence Divergence Indicator.
class MACDIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Creates a  Moving average convergence divergence indicator from the given [input]],
  /// with short term ema set to `12` periods([fastMAPeriod]) and long term ema set to `26` periods([slowMAPeriod]) as default.
  MACDIndicator(
    IndicatorDataInput input, {
    int fastMAPeriod = 12,
    int slowMAPeriod = 26,
  }) : this.fromIndicator(
          CloseValueIndicator<T>(input),
          fastMAPeriod: fastMAPeriod,
          slowMAPeriod: slowMAPeriod,
        );

  /// Creates a  Moving average convergence divergence indicator from a given [indicator],
  /// with short term ema set to `12` periods([fastMAPeriod]) and long term ema set to `26` periods([slowMAPeriod]) as default.
  MACDIndicator.fromIndicator(
    Indicator<T> indicator, {
    int fastMAPeriod = 12,
    int slowMAPeriod = 26,
  })  : _shortTermEma = EMAIndicator<T>(indicator, fastMAPeriod),
        _longTermEma = EMAIndicator<T>(indicator, slowMAPeriod),
        super.fromIndicator(indicator);

  final EMAIndicator<T> _shortTermEma;
  final EMAIndicator<T> _longTermEma;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote: _shortTermEma.getValue(index).quote -
            _longTermEma.getValue(index).quote,
      );

  @override
  void copyValuesFrom(covariant MACDIndicator<T> other) {
    super.copyValuesFrom(other);
    _shortTermEma.copyValuesFrom(other._shortTermEma);
    _longTermEma.copyValuesFrom(other._longTermEma);
  }

  @override
  void invalidate(int index) {
    _shortTermEma.invalidate(index);
    _longTermEma.invalidate(index);
    super.invalidate(index);
  }
}
