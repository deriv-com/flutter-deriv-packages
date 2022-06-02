import '../../../../deriv_technical_analysis.dart';

/// Calculates the value for Aroon Oscillator Indicator.
class AroonOscillatorIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  AroonOscillatorIndicator.fromIndicator(IndicatorDataInput indicatorDataInput,
      {int period = 14})
      : _upChannel = AroonUpIndicator<T>.fromIndicator(
            LowValueIndicator<T>(indicatorDataInput),
            period: period),
        _downChannel = AroonDownIndicator<T>.fromIndicator(
          HighValueIndicator<T>(indicatorDataInput),
          period: period,
        ),
        super(indicatorDataInput);

  /// Aroon up channel indicator.
  final AroonUpIndicator<T> _upChannel;

  /// Aroon down channel indicator.
  final AroonDownIndicator<T> _downChannel;

  @override
  T calculate(int index) => createResult(
      index: index,
      quote: _upChannel.getValue(index).quote -
          _downChannel.getValue(index).quote);

  @override
  void copyValuesFrom(covariant AroonOscillatorIndicator<T> other) {
    _downChannel.copyValuesFrom(other._downChannel);
    _upChannel.copyValuesFrom(other._upChannel);
    super.copyValuesFrom(other);
  }

  @override
  void invalidate(int index) {
    _downChannel.invalidate(index);
    _upChannel.invalidate(index);
    super.invalidate(index);
  }
}
