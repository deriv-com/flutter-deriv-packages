import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/difference_indicator.dart';
import 'package:deriv_technical_analysis/src/indicators/calculations/helper_indicators/mean_indicator.dart';
import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../cached_indicator.dart';
import '../ema_indicator.dart';
import '../helper_indicators/close_value_inidicator.dart';
import '../helper_indicators/high_value_indicator.dart';
import '../helper_indicators/low_value_indicator.dart';
import '../highest_value_indicator.dart';
import '../lowest_value_indicator.dart';

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

  @override
  void copyValuesFrom(covariant SMIIndicator<T> other) {
    super.copyValuesFrom(other);
    _avgRel.copyValuesFrom(other._avgRel);
    _avgDiff.copyValuesFrom(other._avgDiff);
  }

  @override
  void invalidate(int index) {
    _avgRel.invalidate(index);
    _avgDiff.invalidate(index);
    super.invalidate(index);
  }
}
