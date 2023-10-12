import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A helper indicator to get the [(H + L) / 2] value of a list of [IndicatorOHLC]
class HL2Indicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  HL2Indicator(IndicatorDataInput input) : super(input);

  @override
  T getValue(int index) {
    final IndicatorOHLC entry = entries[index];
    return createResult(index: index, quote: (entry.high + entry.low) / 2);
  }
}
