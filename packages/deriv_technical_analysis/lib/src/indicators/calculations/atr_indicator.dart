import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// Average true range indicator.
class ATRIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes an average true range indicator.
  ATRIndicator(
    IndicatorDataInput input, {
    int period = 14,
  })  : _averageTrueRangeIndicator =
            MMAIndicator<T>(TRIndicator<T>(input), period),
        super(input);

  final MMAIndicator<T> _averageTrueRangeIndicator;

  @override
  T calculate(int index) => _averageTrueRangeIndicator.getValue(index);

  @override
  void copyValuesFrom(covariant ATRIndicator<T> other) {
    super.copyValuesFrom(other);
    _averageTrueRangeIndicator.copyValuesFrom(other._averageTrueRangeIndicator);
  }

  @override
  void invalidate(int index) {
    _averageTrueRangeIndicator.invalidate(index);
    super.invalidate(index);
  }
}
