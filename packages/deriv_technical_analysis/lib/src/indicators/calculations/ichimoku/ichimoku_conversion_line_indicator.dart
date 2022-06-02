import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// An `indicator` to calculate average of `Highest High` and `Lowest Low` in the last given number of `period`s which is set to `9` by default.
class IchimokuConversionLineIndicator<T extends IndicatorResult>
    extends IchimokuLineIndicator<T> {
  /// Initializes an [IchimokuConversionLineIndicator].
  IchimokuConversionLineIndicator(
    IndicatorDataInput input, {
    int period = 9,
  }) : super(input, period: period);
}
