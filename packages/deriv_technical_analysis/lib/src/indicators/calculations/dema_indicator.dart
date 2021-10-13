import 'package:deriv_technical_analysis/src/models/models.dart';

import '../cached_indicator.dart';
import '../indicator.dart';
import 'ema_indicator.dart';

/// Double EMA indicator.
class DEMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes.
  DEMAIndicator(Indicator<T> indicator, int period)
      : this._(indicator, EMAIndicator<T>(indicator, period), period);

  DEMAIndicator._(Indicator<T> indicator, EMAIndicator<T> ema, this.period)
      : _ema = ema,
        _emaEma = EMAIndicator<T>(ema, period),
        super.fromIndicator(indicator);

  /// The period.
  final int period;

  final EMAIndicator<T> _ema;
  final EMAIndicator<T> _emaEma;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote: (_ema.getValue(index).quote * 2) - _emaEma.getValue(index).quote,
      );

  @override
  void copyValuesFrom(covariant DEMAIndicator<T> other) {
    super.copyValuesFrom(other);

    _ema.copyValuesFrom(other._ema);
    _emaEma.copyValuesFrom(other._emaEma);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);

    _ema.invalidate(index);
    _emaEma.invalidate(index);
  }
}
