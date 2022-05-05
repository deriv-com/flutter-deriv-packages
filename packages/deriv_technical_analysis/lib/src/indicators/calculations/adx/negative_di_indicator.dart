import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// Negative Directional indicator. Part of the Directional Movement System.
class NegativeDIIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  ///Initializes a Negative Directional indicator.
  NegativeDIIndicator(
    IndicatorDataInput input, {
    int period = 14,
  })  : _avgMinusDMIndicator =
            MMAIndicator<T>(NegativeDMIndicator<T>(input), period),
        _atrIndicator = ATRIndicator<T>(input, period: period),
        super(input);

  final MMAIndicator<T> _avgMinusDMIndicator;
  final ATRIndicator<T> _atrIndicator;

  @override
  T calculate(int index) => createResult(
      index: index,
      quote: (_avgMinusDMIndicator.getValue(index).quote /
              _atrIndicator.getValue(index).quote) *
          100);

  @override
  void copyValuesFrom(covariant NegativeDIIndicator<T> other) {
    super.copyValuesFrom(other);
    _avgMinusDMIndicator.copyValuesFrom(other._avgMinusDMIndicator);
    _atrIndicator.copyValuesFrom(other._atrIndicator);
  }

  @override
  void invalidate(int index) {
    _avgMinusDMIndicator.invalidate(index);
    _atrIndicator.invalidate(index);
    super.invalidate(index);
  }
}
