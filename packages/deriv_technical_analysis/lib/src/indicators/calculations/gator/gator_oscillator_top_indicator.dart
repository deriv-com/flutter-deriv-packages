import 'package:deriv_technical_analysis/src/indicators/cached_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/mma_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/indicator.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

/// Gator Oscillator Indicator Top bar
class GatorOscillatorIndicatorTopBar<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  GatorOscillatorIndicatorTopBar(
    Indicator<T> indicator, {
    int jawPeriod = 13,
    int jawOffset = 8,
    int teethPeriod = 8,
    int teethOffset = 5,
  }) : this.fromIndicators(
          MMAIndicator<T>(indicator, jawPeriod),
          MMAIndicator<T>(indicator, teethPeriod),
          jawOffset: jawOffset,
          teethOffset: teethOffset,
        );

  /// Initializes GatorBottomBar from [lipsIndicator] and [teethIndicator].
  GatorOscillatorIndicatorTopBar.fromIndicators(
    this.jawIndicator,
    this.teethIndicator, {
    this.jawOffset = 8,
    this.teethOffset = 5,
  }) : super.fromIndicator(jawIndicator);

  /// Jaw (lower smoothed moving average) indicator
  final MMAIndicator<T> jawIndicator;

  /// Offset of jaw
  final int jawOffset;

  /// Offset of teeth
  final int teethOffset;

  /// Teeth (upper smoothed moving average) indicator
  final MMAIndicator<T> teethIndicator;

  @override
  T calculate(int index) {
    final int offsetDiff = (jawOffset - teethOffset).abs();

    if (index < offsetDiff) {
      return createResult(index: index, quote: double.nan);
    }

    final T jawIndicatorValue = jawIndicator.getValue(index - offsetDiff);
    final T teethIndicatorValue = teethIndicator.getValue(index);

    // GatorTopBar = Absolute value of(Jaw - Teeth)
    final double quote =
        (jawIndicatorValue.quote - teethIndicatorValue.quote).abs();

    return createResult(index: index, quote: quote);
  }

  @override
  void copyValuesFrom(covariant GatorOscillatorIndicatorTopBar<T> other) {
    super.copyValuesFrom(other);
    jawIndicator.copyValuesFrom(other.jawIndicator);
    teethIndicator.copyValuesFrom(other.teethIndicator);
  }

  @override
  void invalidate(int index) {
    super.invalidate(index);
    jawIndicator.invalidate(index);
    teethIndicator.invalidate(index);
  }
}
