import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/cmo_indicator.dart';

/// Vidya Moving Average Indicator.
class VidyaMAIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  VidyaMAIndicator(this.indicator, this.period)
      : _cmo = CMOIndicator<T>(indicator, 9),
        _f = 2 / (period + 1),
        super.fromIndicator(indicator);

  final CMOIndicator<T> _cmo;

  /// Input indicator to calculate Vidya on.
  final Indicator<T> indicator;

  final double _f;

  /// The period
  final int period;

  // Pricei x F x ABS(CMOi) + VIDYAi-1 x (1 - F x ABS(CMOi))
  @override
  T calculate(int index) {
    double result;
    if (index <= 0) {
      result = indicator.getValue(index).quote;
    } else {
    result = indicator.getValue(index).quote *
            _f *
            _cmo.getValue(index).quote.abs() +
        getValue(index - 1).quote * (1 - _f * _cmo.getValue(index).quote.abs());

    }
    return createResult(index: index, quote: result);
  }
}
