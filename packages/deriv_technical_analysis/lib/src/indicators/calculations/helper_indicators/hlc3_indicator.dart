import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A helper indicator to get the [(H + L+ C) / 3] value of a list of [IndicatorOHLC]
class HLC3Indicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  HLC3Indicator(IndicatorDataInput input) : super(input);

  @override
  T getValue(int index) {
    final IndicatorOHLC entry = entries[index];
    return createResult(
      index: index,
      quote: (entry.high + entry.low + entry.close) / 3,
    );
  }
}
