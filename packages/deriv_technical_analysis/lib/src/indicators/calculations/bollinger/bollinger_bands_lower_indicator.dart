import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';

/// Bollinger bands lower indicator
class BollingerBandsLowerIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes.
  ///
  /// [k]         Defaults value to 2.
  ///
  /// [bbm]       the middle band Indicator. Typically an SMAIndicator is used.
  ///
  /// [indicator] the deviation above and below the middle, factored by k.
  ///             Typically a StandardDeviationIndicator is used.
  BollingerBandsLowerIndicator(this.bbm, this.indicator, {this.k = 2})
      : super.fromIndicator(bbm);

  /// Indicator
  final CachedIndicator<T> indicator;

  /// The middle indicator of the BollingerBand
  final CachedIndicator<T> bbm;

  /// Default is 2.
  final double k;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote:
            bbm.getValue(index).quote - (indicator.getValue(index).quote * k),
      );

  @override
  void copyValuesFrom(covariant BollingerBandsLowerIndicator<T> other) {
    super.copyValuesFrom(other);
    indicator.copyValuesFrom(other.indicator);
    bbm.copyValuesFrom(other.bbm);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);

    indicator.invalidate(index);
    bbm.invalidate(index);
  }
}
