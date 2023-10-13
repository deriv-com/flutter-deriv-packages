import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';
import 'bollinger_bands_lower_indicator.dart';
import 'bollinger_bands_upper_indicator.dart';

/// Bollinger Band Width indicator.
class BollingerBandWidthIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes.
  ///
  /// [bbu] the upper band Indicator.
  /// [bbm] the middle band Indicator. Typically an SMAIndicator is used.
  /// [bbl] the lower band Indicator.
  BollingerBandWidthIndicator(
    this.bbu,
    this.bbm,
    this.bbl, {
    this.hundred = 100,
  }) : super(bbm.input);

  /// The upper band Indicator.
  final BollingerBandsUpperIndicator<T> bbu;

  /// The middle band Indicator. Typically an SMAIndicator is used.
  final CachedIndicator<T> bbm;

  /// The lower band Indicator.
  final BollingerBandsLowerIndicator<T> bbl;

  /// Typically is 100.
  final double hundred;

  @override
  T calculate(int index) => createResult(
        index: index,
        quote: ((bbu.getValue(index).quote - bbl.getValue(index).quote) /
                bbm.getValue(index).quote) *
            hundred,
      );

  @override
  void copyValuesFrom(covariant BollingerBandWidthIndicator<T> other) {
    super.copyValuesFrom(other);
    bbm.copyValuesFrom(other.bbm);
    bbu.copyValuesFrom(other.bbu);
    bbl.copyValuesFrom(other.bbl);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);
    bbm.invalidate(index);
    bbu.invalidate(index);
    bbl.invalidate(index);
  }
}
