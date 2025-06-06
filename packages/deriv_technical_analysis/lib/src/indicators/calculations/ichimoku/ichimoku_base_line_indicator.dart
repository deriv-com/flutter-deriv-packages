import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import 'ichimoku_line_indicator.dart';

/// An `indicator` to calculate average of `Highest High` and `Lowest Low` in the last given number of `period`s which is set to `26` by default.
class IchimokuBaseLineIndicator<T extends IndicatorResult>
    extends IchimokuLineIndicator<T> {
  /// Initializes an [IchimokuBaseLineIndicator].
  IchimokuBaseLineIndicator(
    IndicatorDataInput input, {
    int period = 26,
  }) : super(input, period: period);
}
