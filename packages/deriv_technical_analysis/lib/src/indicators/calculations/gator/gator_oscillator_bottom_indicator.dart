import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/mma_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// Gator Oscillator Indicator Bottom bar
class GatorOscillatorIndicatorBottomBar<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  GatorOscillatorIndicatorBottomBar(
    Indicator<T> indicator, {
    int lipsPeriod = 5,
    int lipsOffset = 3,
    int teethPeriod = 8,
    int teethOffset = 5,
  }) : this.fromIndicators(
          MMAIndicator<T>(indicator, lipsPeriod),
          MMAIndicator<T>(indicator, teethPeriod),
          lipsOffset: lipsOffset,
          teethOffset: teethOffset,
        );

  /// Initializes GatorBottomBar from [lipsIndicator] and [teethIndicator].
  GatorOscillatorIndicatorBottomBar.fromIndicators(
    this.lipsIndicator,
    this.teethIndicator, {
    this.lipsOffset = 3,
    this.teethOffset = 5,
  }) : super.fromIndicator(lipsIndicator);

  /// Offset of lips
  final int lipsOffset;

  /// Offset of teeth
  final int teethOffset;

  /// Lips (middle smoothed moving average) indicator
  final MMAIndicator<T> lipsIndicator;

  /// Teeth (upper smoothed moving average) indicator
  final MMAIndicator<T> teethIndicator;

  @override
  T calculate(int index) {
    final int offsetDiff = (lipsOffset - teethOffset).abs();

    if (index < offsetDiff) {
      return createResult(index: index, quote: double.nan);
    }

    final T lipsIndicatorValue = lipsIndicator.getValue(index);
    final T teethIndicatorValue = teethIndicator.getValue(index - offsetDiff);

    // GatorBottomBar = – (Absolute value of (Teeth – Lips))
    final double quote =
        -(teethIndicatorValue.quote - lipsIndicatorValue.quote).abs();

    return createResult(index: index, quote: quote);
  }

  @override
  void copyValuesFrom(covariant GatorOscillatorIndicatorBottomBar<T> other) {
    super.copyValuesFrom(other);
    lipsIndicator.copyValuesFrom(other.lipsIndicator);
    teethIndicator.copyValuesFrom(other.teethIndicator);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);
    lipsIndicator.invalidate(index);
    teethIndicator.invalidate(index);
  }
}
