import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import 'ichimoku_base_line_indicator.dart';
import 'ichimoku_conversion_line_indicator.dart';

/// An `indicator` to calculate average of the given [conversionLineIndicator] and [baseLineIndicator].
class IchimokuSpanAIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes an [IchimokuSpanAIndicator].
  IchimokuSpanAIndicator(
    IndicatorDataInput input, {
    IchimokuConversionLineIndicator<T>? conversionLineIndicator,
    IchimokuBaseLineIndicator<T>? baseLineIndicator,
  })  : conversionLineIndicator = conversionLineIndicator ??
            IchimokuConversionLineIndicator<T>(input),
        baseLineIndicator =
            baseLineIndicator ?? IchimokuBaseLineIndicator<T>(input),
        super(input);

  @override
  T calculate(int index) {
    final double spanAQuote = (conversionLineIndicator.getValue(index).quote +
            baseLineIndicator.getValue(index).quote) /
        2;
    return createResult(index: index, quote: spanAQuote);
  }

  /// The [IchimokuConversionLineIndicator] to calculate the spanA from.
  final IchimokuConversionLineIndicator<T> conversionLineIndicator;

  /// The [IchimokuBaseLineIndicator] to calculate the spanA from.
  final IchimokuBaseLineIndicator<T> baseLineIndicator;

  @override
  void copyValuesFrom(covariant IchimokuSpanAIndicator<T> other) {
    super.copyValuesFrom(other);
    conversionLineIndicator.copyValuesFrom(other.conversionLineIndicator);
    baseLineIndicator.copyValuesFrom(other.baseLineIndicator);
  }

  @override
  void invalidate(int index) {
    conversionLineIndicator.invalidate(index);
    baseLineIndicator.invalidate(index);
    super.invalidate(index);
  }
}
