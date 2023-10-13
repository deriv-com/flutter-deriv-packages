import '../../../models/models.dart';
import '../../cached_indicator.dart';
import '../ema_indicator.dart';
import 'macd_indicator.dart';

///Signal of Moving Average Convergence Divergence Indicator.
///Normally a 9-day period EMA of MACD.
class SignalMACDIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  ///Initializes a signal of MACD indicator from the given [MACDIndicator].
  SignalMACDIndicator.fromIndicator(
    MACDIndicator<T> indicator, {
    int period = 9,
  })  : _signalMACDIndicator = EMAIndicator<T>(indicator, period),
        super.fromIndicator(indicator);

  final EMAIndicator<T> _signalMACDIndicator;

  @override
  T calculate(int index) => _signalMACDIndicator.getValue(index);

  @override
  void copyValuesFrom(covariant SignalMACDIndicator<T> other) {
    super.copyValuesFrom(other);
    _signalMACDIndicator.copyValuesFrom(other._signalMACDIndicator);
  }

  @override
  void invalidate(int index) {
    _signalMACDIndicator.invalidate(index);
    super.invalidate(index);
  }
}
