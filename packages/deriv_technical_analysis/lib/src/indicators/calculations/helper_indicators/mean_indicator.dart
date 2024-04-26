import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// A helper indicator to calculate Mean value of two indicators.
class MeanIndicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  MeanIndicator(this.indicator1, this.indicator2) : super(indicator1.input);

  /// First Indicator.
  final Indicator<T> indicator1;

  /// Second Indicator.
  final Indicator<T> indicator2;

  @override
  T getValue(int index) => createResult(
        index: index,
        quote: (indicator1.getValue(index).quote +
                indicator2.getValue(index).quote) /
            2,
      );
}
