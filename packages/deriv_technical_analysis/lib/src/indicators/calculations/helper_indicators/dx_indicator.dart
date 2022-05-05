import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// Directional movement line Indicator.
class DXIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes a Directional movement line Indicator from given [input].
  DXIndicator(
    IndicatorDataInput input, {
    int period = 14,
  }) : this.fromIndicator(
          PositiveDIIndicator<T>(input, period: period),
          NegativeDIIndicator<T>(input, period: period),
        );

  /// Initializes a Directional movement line Indicator from given [PositiveDIIndicator] and [NegativeDIIndicator].
  DXIndicator.fromIndicator(
    this.positiveDIIndicator,
    this.negativeDIIndicator,
  ) : super.fromIndicator(positiveDIIndicator);

  /// The positive ADX DI indicator to calculate DXIndicator from
  final PositiveDIIndicator<T> positiveDIIndicator;

  /// The negative ADX DI indicator to calculate DXIndicator from
  final NegativeDIIndicator<T> negativeDIIndicator;

  @override
  T calculate(int index) {
    final double pdiValue = positiveDIIndicator.getValue(index).quote;
    final double ndiValue = negativeDIIndicator.getValue(index).quote;
    final double sumDI = pdiValue + ndiValue;
    final double diffDI = (pdiValue - ndiValue).abs();
    if (sumDI == 0) {
      return createResult(index: index, quote: 0);
    }
    return createResult(index: index, quote: (diffDI / sumDI) * 100);
  }
}
