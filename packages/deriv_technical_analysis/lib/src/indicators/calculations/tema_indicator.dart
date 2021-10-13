import 'package:deriv_technical_analysis/src/models/models.dart';

import '../cached_indicator.dart';
import '../indicator.dart';
import 'ema_indicator.dart';

/// Triple EMA indicator.
class TEMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  factory TEMAIndicator(Indicator<T> indicator, int period) {
    final EMAIndicator<T> ema = EMAIndicator<T>(indicator, period);
    final EMAIndicator<T> emaEma = EMAIndicator<T>(ema, period);
    final EMAIndicator<T> emaEmaEma = EMAIndicator<T>(emaEma, period);
    return TEMAIndicator<T>._(indicator, ema, emaEma, emaEmaEma, period);
  }

  TEMAIndicator._(
    Indicator<T> indicator,
    this._ema,
    this._emaEma,
    this._emaEmaEma,
    this.period,
  ) : super.fromIndicator(indicator);

  /// The period.
  final int period;

  final EMAIndicator<T> _ema;
  final EMAIndicator<T> _emaEma;
  final EMAIndicator<T> _emaEmaEma;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote:
            3 * (_ema.getValue(index).quote - _emaEma.getValue(index).quote) +
                _emaEmaEma.getValue(index).quote,
      );

  @override
  void copyValuesFrom(covariant TEMAIndicator<T> other) {
    super.copyValuesFrom(other);

    _ema.copyValuesFrom(other._ema);
    _emaEma.copyValuesFrom(other._emaEma);
    _emaEmaEma.copyValuesFrom(other._emaEmaEma);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);

    _ema.invalidate(index);
    _emaEma.invalidate(index);
    _emaEmaEma.invalidate(index);
  }
}
