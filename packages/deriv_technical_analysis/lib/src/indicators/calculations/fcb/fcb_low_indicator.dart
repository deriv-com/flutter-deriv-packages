import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// FractalChaosBand Low Indicator
class FCBLowIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  FCBLowIndicator(IndicatorDataInput input) : super(input);

  @override
  T calculate(int index) {
    if (index < 4) {
      return createResult(index: index, quote: double.nan);
    }
    if (entries[index - 2].low < entries[index - 1].low &&
        entries[index - 2].low < entries[index].low &&
        entries[index - 2].low < entries[index - 3].low &&
        entries[index - 2].low < entries[index - 4].low) {
      return createResult(index: index, quote: entries[index - 2].low);
    } else {
      return createResult(index: index, quote: getValue(index - 1).quote);
    }
  }
}
