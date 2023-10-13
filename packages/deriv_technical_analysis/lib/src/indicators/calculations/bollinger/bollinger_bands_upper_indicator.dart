import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';

/// Bollinger bands upper indicator
class BollingerBandsUpperIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes.
  ///
  ///  [bbm]       the middle band Indicator. Typically an SMAIndicator is
  ///                  used.
  ///  [deviation] the deviation above and below the middle, factored by k.
  ///                  Typically a StandardDeviationIndicator is used.
  ///  [k]         the scaling factor to multiply the deviation by. Typically 2
  BollingerBandsUpperIndicator(this.bbm, this.deviation, {this.k = 2})
      : super.fromIndicator(deviation);

  /// Deviation indicator
  final CachedIndicator<T> deviation;

  /// The middle indicator of the BollingerBand
  final CachedIndicator<T> bbm;

  /// Default is 2.
  final double k;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote:
            bbm.getValue(index).quote + (deviation.getValue(index).quote * k),
      );

  @override
  void copyValuesFrom(covariant BollingerBandsUpperIndicator<T> other) {
    super.copyValuesFrom(other);
    deviation.copyValuesFrom(other.deviation);
    bbm.copyValuesFrom(other.bbm);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);

    deviation.invalidate(index);
    bbm.invalidate(index);
  }
}
