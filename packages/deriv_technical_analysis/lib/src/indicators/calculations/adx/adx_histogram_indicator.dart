import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/adx/negative_di_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/adx/positive_di_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/difference_indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A Histogram ADX Indicator which will be calculated from the given Positive and Negative DI Indicator
class ADXHistogramIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes an ADX Histogram from the given Indicators.
  ADXHistogramIndicator.fromIndicator(
    PositiveDIIndicator<T> positiveDIIndicator,
    NegativeDIIndicator<T> negativeDIIndicator,
  )   : _differenceIndicator = DifferenceIndicator<T>(
          positiveDIIndicator,
          negativeDIIndicator,
        ),
        super.fromIndicator(positiveDIIndicator);

  final DifferenceIndicator<T> _differenceIndicator;

  @override
  T calculate(int index) => _differenceIndicator.getValue(index);
}
