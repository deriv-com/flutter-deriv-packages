import 'package:deriv_technical_analysis/deriv_technical_analysis.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/difference_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/mean_indicator.dart';

/// Stochastic Momentum Index indicator
///
/// p = period, sp = smoothingPeriod, dsp = doubleSmoothingPeriod
/// ll = LowestLow, hh = HighestHigh
///
/// ll = lowest (low, p)
/// hh = highest (high, p)
/// diff = hh - ll
/// rDiff = close - (hh+ll) / 2
///
/// avgRel = ema(ema(rDiff, sp), dsp)
/// avgDiff = ema(ema(diff, sp), dsp)
///
/// SMI = avgDiff != 0 ? (avgRel/(avgDiff / 2) * 100) : 0
///
/// https://in.tradingview.com/script/HLbqdCku-Stochastic-Momentum-Index-SMI/
class SMIIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes and returns an instance of [SMIIndicator].
  factory SMIIndicator(
    IndicatorDataInput input, {
    int period = 10,
    int smoothingPeriod = 3,
    int doubleSmoothingPeriod = 3,
  }) {
    final LowestValueIndicator<T> ll =
        LowestValueIndicator<T>(LowValueIndicator<T>(input), period);
    final HighestValueIndicator<T> hh =
        HighestValueIndicator<T>(HighValueIndicator<T>(input), period);

    final DifferenceIndicator<T> diff = DifferenceIndicator<T>(hh, ll);
    final DifferenceIndicator<T> rDiff = DifferenceIndicator<T>(
      CloseValueIndicator<T>(input),
      MeanIndicator<T>(hh, ll),
    );

    return SMIIndicator<T>._(
      input,
      EMAIndicator<T>(
        EMAIndicator<T>(rDiff, smoothingPeriod),
        doubleSmoothingPeriod,
      ),
      EMAIndicator<T>(
        EMAIndicator<T>(diff, smoothingPeriod),
        doubleSmoothingPeriod,
      ),
    );
  }

  SMIIndicator._(IndicatorDataInput input, this._avgRel, this._avgDiff)
      : super(input);

  final EMAIndicator<T> _avgDiff;
  final EMAIndicator<T> _avgRel;

  @override
  T calculate(int index) {
    final double avgRel = _avgRel.getValue(index).quote;
    final double avgDiff = _avgDiff.getValue(index).quote;
    final double smi = avgDiff != 0 ? (avgRel / (avgDiff / 2) * 100) : 0;

    return createResult(index: index, quote: smi);
  }
}
