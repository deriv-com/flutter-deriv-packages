import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// A helper indicator to get the open value of a list of [IndicatorDataInput]
class OpenValueIndicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  OpenValueIndicator(IndicatorDataInput input) : super(input);

  @override
  T getValue(int index) => createResult(
        index: index,
        quote: entries[index].open,
      );
}
