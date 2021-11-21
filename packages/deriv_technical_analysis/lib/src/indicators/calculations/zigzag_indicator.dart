import 'package:deriv_technical_analysis/src/models/models.dart';

import '../../../deriv_technical_analysis.dart';
import '../cached_indicator.dart';

/// The ZigZag Indicator that shows if value changes enough
class ZigZagIndicator<T extends IndicatorResult> extends CachedIndicator<T> {
  /// Initializes
  ZigZagIndicator(this.inputs, double distance)
      : _distancePercent = distance / 100,
        _firstSwingIndex = _calculateFirstSwing(inputs.entries),
        super(inputs);

  /// Calculating values that changes enough
  final IndicatorDataInput inputs;

  /// The minimum distance between two point in %
  final double _distancePercent;

  final int _firstSwingIndex;

  static int _calculateFirstSwing(List<IndicatorOHLC> ticks) {
    int firstIndex = -1;

    if (ticks.isNotEmpty) {
      for (int index = 1; index < ticks.length; index++) {
        if ((ticks[index - 1].low > ticks[index].low &&
                ticks[index + 1].low > ticks[index].low) ||
            (ticks[index - 1].high < ticks[index].high &&
                ticks[index + 1].high < ticks[index].high)) {
          firstIndex = index;
          break;
        }
      }
    }

    return firstIndex;
  }

  @override
  T calculate(int index) {
    final IndicatorOHLC thisTick = inputs.entries[index];

    // if index is 0 return nan value
    if (index == 0) {
      return createResult(index: index, quote: double.nan);
    }

    // is the point of given index swing up
    bool isSwingUp(int index) =>
        inputs.entries[index - 1].high < inputs.entries[index].high &&
        inputs.entries[index + 1].high < inputs.entries[index].high;

    // is the point of given index swing down
    bool isSwingDown(int index) =>
        inputs.entries[index - 1].low > inputs.entries[index].low &&
        inputs.entries[index + 1].low > inputs.entries[index].low;

    // if index is first swing, return itself
    if (_firstSwingIndex == index) {
      return isSwingUp(index)
          ? createResult(index: index, quote: thisTick.high)
          : createResult(index: index, quote: thisTick.low);
    }

    // if index is last index, return itself
    if (index == inputs.entries.length - 1) {
      return createResult(index: index, quote: thisTick.close);
    }

    // if thee point is SwingDown or SwingUp
    if (isSwingDown(index) || isSwingUp(index)) {
      // found first not nan point before this point
      for (int i = index - 1; i > 0; i--) {
        if (getValue(i).quote.isNaN) {
          continue;
        }
        final IndicatorOHLC previousTick = inputs.entries[i];

        // if this point and last point has different swings
        if (isSwingUp(index) && isSwingDown(i)) {
          final double distanceInPercent = previousTick.low * _distancePercent;

          if ((previousTick.low - thisTick.high).abs() > distanceInPercent) {
            return createResult(index: index, quote: thisTick.high);
          } else {
            return createResult(index: index, quote: double.nan);
          }
        }

        // if this point and last point has different swings
        else if (isSwingDown(index) && isSwingUp(i)) {
          final double distanceInPercent = previousTick.high * _distancePercent;

          if ((previousTick.high - thisTick.low).abs() > distanceInPercent) {
            return createResult(index: index, quote: thisTick.low);
          } else {
            return createResult(index: index, quote: double.nan);
          }
        }

        // if this point and last point has similar swings down
        else if (isSwingDown(index) && isSwingDown(i)) {
          if (i != _firstSwingIndex && thisTick.low < previousTick.low) {
            results[i] = createResult(index: i, quote: double.nan);
            return createResult(index: index, quote: thisTick.low);
          } else if (i == _firstSwingIndex) {
            final double distanceInPercent =
                previousTick.low * _distancePercent;

            if ((previousTick.low - thisTick.low).abs() > distanceInPercent) {
              return createResult(index: index, quote: thisTick.low);
            } else {
              return createResult(index: index, quote: double.nan);
            }
          } else {
            return createResult(index: index, quote: double.nan);
          }
        }

        // if this point and last point has similar swings up
        else if (isSwingUp(index) && isSwingUp(i)) {
          if (i != _firstSwingIndex && thisTick.high > previousTick.high) {
            results[i] = createResult(index: i, quote: double.nan);
            return createResult(index: index, quote: thisTick.high);
          } else if (i == _firstSwingIndex) {
            final double distanceInPercent =
                previousTick.high * _distancePercent;

            if ((previousTick.high - thisTick.high).abs() > distanceInPercent) {
              return createResult(index: index, quote: thisTick.high);
            } else {
              return createResult(index: index, quote: double.nan);
            }
          } else {
            return createResult(index: index, quote: double.nan);
          }
        }

        // if none of the conditions was true
        else {
          return createResult(index: index, quote: double.nan);
        }
      }
    }

    return createResult(index: index, quote: double.nan);
  }
}
