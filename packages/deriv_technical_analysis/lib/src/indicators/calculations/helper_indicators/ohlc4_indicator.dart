import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A helper indicator to get the [(O+ H + L+ C) / 4] value of a list of [IndicatorOHLC]
class OHLC4Indicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  OHLC4Indicator(IndicatorDataInput input) : super(input);

  @override
  T getValue(int index) {
    final IndicatorOHLC entry = entries[index];
    return createResult(
      index: index,
      quote: (entry.open + entry.high + entry.low + entry.close) / 4,
    );
  }
}
