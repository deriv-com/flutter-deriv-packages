import 'package:deriv_technical_analysis/src/models/data_input.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../cached_indicator.dart';
import 'helper_indicators/high_value_indicator.dart';
import 'helper_indicators/low_value_indicator.dart';
import 'highest_value_indicator.dart';
import 'lowest_value_indicator.dart';

/// Parabolic Sar Indicator
class ParabolicSarIndicator<T extends IndicatorResult>
    extends CachedIndicator<T> {
  /// Initializes
  ParabolicSarIndicator(
    IndicatorDataInput input, {
    this.accelerationStart = 0.02,
    this.maxAcceleration = 0.2,
    this.accelerationIncrement = 0.02,
  })  : _highPriceIndicator = HighValueIndicator<T>(input),
        _lowPriceIndicator = LowValueIndicator<T>(input),
        accelerationFactor = accelerationStart,
        super(input);

  /// Maximum Acceleration Factor
  final double maxAcceleration;

  /// Acceleration factor steps.
  ///
  /// [accelerationFactor] increases by this amount each time a new extreme point
  /// is reached, with a maximum of [maxAcceleration].
  final double accelerationIncrement;

  /// The start value for Acceleration Factor.
  final double accelerationStart;

  /// Acceleration factor
  @protected
  double accelerationFactor;

  /// `true` if uptrend, `false` if downtrend.
  @protected
  late bool isUptrend;

  /// index of start bar of the current trend
  @protected
  int startTrendIndex = 0;

  final LowValueIndicator<T> _lowPriceIndicator;
  final HighValueIndicator<T> _highPriceIndicator;

  /// the extreme point of the current calculation
  @protected
  late double currentExtremePoint;

  /// depending on trend the maximum or minimum extreme point value of trend
  @protected
  late double minMaxExtremePoint;

  @override
  T calculate(int index) {
    double sar = double.nan;
    if (index == 0) {
      // no trend detection possible for the first index.
      return createResult(index: index, quote: sar);
    } else if (index == 1) {
      return _createResultForSecondIndex(index);
    }

    final double priorSar = getValue(index - 1).quote;
    if (isUptrend) {
      sar = priorSar + (accelerationFactor * (currentExtremePoint - priorSar));
      isUptrend = _lowPriceIndicator.getValue(index).quote > sar;
      if (!isUptrend) {
        sar = _switchDowntrend(index);
      } else {
        _updateExtremePointOnUptrend(index);
        if (currentExtremePoint > minMaxExtremePoint) {
          _incrementAcceleration();
          minMaxExtremePoint = currentExtremePoint;
        }
      }
    } else {
      sar = priorSar - (accelerationFactor * (priorSar - currentExtremePoint));
      isUptrend = _highPriceIndicator.getValue(index).quote >= sar;
      if (isUptrend) {
        sar = _switchUptrend(index);
      } else {
        _updateExtremePointOnDownTrend(index);
        if (currentExtremePoint < minMaxExtremePoint) {
          _incrementAcceleration();
          minMaxExtremePoint = currentExtremePoint;
        }
      }
    }
    return createResult(index: index, quote: sar);
  }

  void _updateExtremePointOnDownTrend(int index) =>
      currentExtremePoint = LowestValueIndicator<T>(
        _lowPriceIndicator,
        index - startTrendIndex,
      ).getValue(index).quote;

  void _updateExtremePointOnUptrend(int index) =>
      currentExtremePoint = HighestValueIndicator<T>(
        _highPriceIndicator,
        index - startTrendIndex,
      ).getValue(index).quote;

  double _switchDowntrend(int index) {
    final double sar = minMaxExtremePoint;
    startTrendIndex = index;
    accelerationFactor = accelerationStart;
    currentExtremePoint = entries[index].low;
    minMaxExtremePoint = currentExtremePoint;
    return sar;
  }

  double _switchUptrend(int index) {
    final double sar = minMaxExtremePoint;
    startTrendIndex = index;
    accelerationFactor = accelerationStart;
    currentExtremePoint = entries[index].high;
    minMaxExtremePoint = currentExtremePoint;
    return sar;
  }

  T _createResultForSecondIndex(int index) {
    double sar;
    // start trend detection
    isUptrend = entries.first.close < (entries[index].close);
    if (!isUptrend) {
      // down trend
      // put sar on max price of candlestick
      sar = _highPriceIndicator.getValue(index).quote;
    } else {
      // up trend
      // put sar on min price of candlestick
      sar = _lowPriceIndicator.getValue(index).quote;
    }
    currentExtremePoint = sar;
    minMaxExtremePoint = currentExtremePoint;
    return createResult(index: index, quote: sar);
  }

  void _incrementAcceleration() {
    if (accelerationFactor >= maxAcceleration) {
      accelerationFactor = maxAcceleration;
    } else {
      accelerationFactor = accelerationFactor + accelerationIncrement;
    }
  }

  @override
  void copyValuesFrom(covariant ParabolicSarIndicator<T> other) {
    super.copyValuesFrom(other);

    isUptrend = other.isUptrend;
    accelerationFactor = other.accelerationFactor;
    startTrendIndex = other.startTrendIndex;
    currentExtremePoint = other.currentExtremePoint;
    minMaxExtremePoint = other.minMaxExtremePoint;
  }
}
