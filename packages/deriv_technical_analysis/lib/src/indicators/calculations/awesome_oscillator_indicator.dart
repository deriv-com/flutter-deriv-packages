import '../../models/data_input.dart';
import '../../models/models.dart';
import '../cached_indicator.dart';
import 'helper_indicators/hl2_indicator.dart';
import 'sma_indicator.dart';

///Awesome Oscillator Indicator
class AwesomeOscillatorIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  factory AwesomeOscillatorIndicator(IndicatorDataInput input,
      {int smaPeriodOne = 5, int smaPeriodTwo = 34}) {
    final HL2Indicator<T> hl2indicator = HL2Indicator<T>(input);
    return AwesomeOscillatorIndicator<T>._(
        input,
        SMAIndicator<T>(hl2indicator, smaPeriodOne),
        SMAIndicator<T>(hl2indicator, smaPeriodTwo));
  }

  AwesomeOscillatorIndicator._(
      IndicatorDataInput input, this._smaIndicatorOne, this._smaIndicatorTwo)
      : super(input);

  ///34-period simple moving average
  final SMAIndicator<T> _smaIndicatorOne;

  ///5-period simple moving average
  final SMAIndicator<T> _smaIndicatorTwo;

  @override
  T calculate(int index) {
    final IndicatorResult _smaValueOne = _smaIndicatorOne.getValue(index);
    final IndicatorResult _smaValueTwo = _smaIndicatorTwo.getValue(index);

    ///AO = SMA(MEDIAN PRICE, 5)-SMA(MEDIAN PRICE, 34)
    final double _quote = _smaValueOne.quote - _smaValueTwo.quote;

    return createResult(index: index, quote: _quote);
  }

  @override
  void copyValuesFrom(covariant AwesomeOscillatorIndicator<T> other) {
    super.copyValuesFrom(other);
    _smaIndicatorOne.copyValuesFrom(other._smaIndicatorOne);
    _smaIndicatorTwo.copyValuesFrom(other._smaIndicatorTwo);
  }

  @override
  void invalidate(int index) {
    _smaIndicatorOne.invalidate(index);
    _smaIndicatorTwo.invalidate(index);
    super.invalidate(index);
  }
}
