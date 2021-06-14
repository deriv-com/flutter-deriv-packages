import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

import '../../indicator.dart';

/// A helper indicator to calculate median value of two indicators.
class MedianIndicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  MedianIndicator(this.indicator1, this.indicator2) : super(indicator1.input);

  /// Indicator
  final Indicator<T> indicator1;

  /// Indicator
  final Indicator<T> indicator2;

  @override
  T getValue(int index) => createResult(
        index: index,
        quote: (indicator1.getValue(index).quote +
                indicator2.getValue(index).quote) /
            2,
      );
}
