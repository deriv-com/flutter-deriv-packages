import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A helper indicator which gets the close values of List of [IndicatorOHLC]
class MedianValueIndicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  MedianValueIndicator(IndicatorDataInput input) : super(input);

  @override
  T getValue(int index) => createResult(
        index: index,
        quote: (entries[index].high+entries[index].low)/2,
      );
}
