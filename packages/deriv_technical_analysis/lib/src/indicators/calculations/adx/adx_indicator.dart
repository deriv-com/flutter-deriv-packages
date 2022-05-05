import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';

/// Average Directional Movement. Part of the Directional Movement System.
class ADXIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes an Average Directional Movement from the given [input]s. Part of the Directional Movement System.
  ADXIndicator(
    IndicatorDataInput input, {
    int diPeriod = 14,
    int adxPeriod = 14,
  })  : _averageDXIndicator =
            MMAIndicator<T>(DXIndicator<T>(input, period: diPeriod), adxPeriod),
        super(input);

  /// Initializes an Average Directional Movement from the given [Indicator]s. Part of the Directional Movement System.
  ADXIndicator.fromIndicator(
    PositiveDIIndicator<T> positiveDIIndicator,
    NegativeDIIndicator<T> negativeDIIndicator, {
    int adxPeriod = 14,
  })  : _averageDXIndicator = MMAIndicator<T>(
            DXIndicator<T>.fromIndicator(
              positiveDIIndicator,
              negativeDIIndicator,
            ),
            adxPeriod),
        super.fromIndicator(positiveDIIndicator);

  final MMAIndicator<T> _averageDXIndicator;

  @override
  T calculate(int index) => _averageDXIndicator.getValue(index);
}
