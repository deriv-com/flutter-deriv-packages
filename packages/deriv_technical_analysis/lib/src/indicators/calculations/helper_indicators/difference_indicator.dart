import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// Difference values between two indicators
class DifferenceIndicator<T extends IndicatorResult> extends Indicator<T> {
  /// Initializes
  ///
  /// (first minus second)
  DifferenceIndicator(this.first, this.second) : super(first.input);

  /// First indicator
  final Indicator<T> first;

  /// Second indicator
  final Indicator<T> second;

  @override
  T getValue(int index) => createResult(
        index: index,
        quote: first.getValue(index).quote - second.getValue(index).quote,
      );
}
