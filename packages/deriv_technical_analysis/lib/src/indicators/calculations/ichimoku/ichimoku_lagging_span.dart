import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../helper_indicators/close_value_inidicator.dart';

/// An `indicator` to calculate the `close` value the given number of offsets ago.
class IchimokuLaggingSpanIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes an [IchimokuLaggingSpanIndicator].
  IchimokuLaggingSpanIndicator(
    IndicatorDataInput input,
  )   : _closeValueIndicator = CloseValueIndicator<T>(input),
        super(input);

  final CloseValueIndicator<T> _closeValueIndicator;

  @override
  T calculate(int index) => _closeValueIndicator.getValue(index);
}
