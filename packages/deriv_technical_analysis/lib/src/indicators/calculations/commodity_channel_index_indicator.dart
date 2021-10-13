import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../cached_indicator.dart';
import 'helper_indicators/hlc3_indicator.dart';
import 'sma_indicator.dart';
import 'statistics/mean_deviation_indicator.dart';

/// Commodity Channel Index Indicator.
class CommodityChannelIndexIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes CCI indicator.
  CommodityChannelIndexIndicator(
    IndicatorDataInput input,
    int period, {
    double factor = 0.015,
  }) : this._(input, period, HLC3Indicator<T>(input), factor: factor);

  CommodityChannelIndexIndicator._(
    IndicatorDataInput input,
    this.period,
    HLC3Indicator<T> typicalPriceIndicator, {
    required this.factor,
  })  : _typicalPriceIndicator = typicalPriceIndicator,
        _smaIndicator = SMAIndicator<T>(typicalPriceIndicator, period),
        _meanDeviationIndicator =
            MeanDeviationIndicator<T>(typicalPriceIndicator, period),
        super(input);

  /// Factor. Usually is `0.015`.
  final double factor;

  /// The period.
  final int period;

  final HLC3Indicator<T> _typicalPriceIndicator;

  final SMAIndicator<T> _smaIndicator;
  final MeanDeviationIndicator<T> _meanDeviationIndicator;

  @override
  T calculate(int index) {
    final double typicalPrice = _typicalPriceIndicator.getValue(index).quote;
    final double movingAverage = _smaIndicator.getValue(index).quote;
    final double meanDeviation = _meanDeviationIndicator.getValue(index).quote;

    if (meanDeviation == 0) {
      return createResult(index: index, quote: 0);
    }

    return createResult(
      index: index,
      quote: (typicalPrice - movingAverage) / (meanDeviation * factor),
    );
  }

  @override
  void copyValuesFrom(covariant CommodityChannelIndexIndicator<T> other) {
    super.copyValuesFrom(other);

    _smaIndicator.copyValuesFrom(other._smaIndicator);
    _meanDeviationIndicator.copyValuesFrom(other._meanDeviationIndicator);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);

    _smaIndicator.invalidate(index);
    _meanDeviationIndicator.invalidate(index);
  }
}
