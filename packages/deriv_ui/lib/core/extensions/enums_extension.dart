import 'package:flutter/material.dart';
import 'package:flutter_multipliers/core/enums.dart';
import 'package:flutter_multipliers/core/extensions/extensions.dart';

/// Extension methods for [ChartInterval] enum
extension ChartIntervalConvertExtension on ChartInterval {
  /// Converts [ChartInterval] values to seconds
  int toSeconds() {
    const int oneSecond = 1;
    const int oneMinute = 60 * oneSecond;
    const int oneHour = 60 * oneMinute;
    const int oneDay = 24 * oneHour;

    switch (this) {
      case ChartInterval.oneTick:
        return oneSecond;
      case ChartInterval.oneMinute:
        return oneMinute;
      case ChartInterval.twoMinutes:
        return 2 * oneMinute;
      case ChartInterval.treeMinutes:
        return 3 * oneMinute;
      case ChartInterval.fiveMinutes:
        return 5 * oneMinute;
      case ChartInterval.tenMinutes:
        return 10 * oneMinute;
      case ChartInterval.fifteenMinutes:
        return 15 * oneMinute;
      case ChartInterval.thirtyMinutes:
        return 30 * oneMinute;
      case ChartInterval.oneHour:
        return oneHour;
      case ChartInterval.twoHours:
        return 2 * oneHour;
      case ChartInterval.fourHours:
        return 4 * oneHour;
      case ChartInterval.eightHours:
        return 8 * oneHour;
      case ChartInterval.oneDay:
        return oneDay;

      default:
        return 0;
    }
  }

  /// Converts [ChartInterval] values to milliseconds
  int toMilliseconds() => toSeconds() * 1000;

  /// Converts [ChartInterval] values to string
  String getIntervalLabel(
    BuildContext context, {
    bool isAbbreviate = false,
  }) {
    switch (this) {
      case ChartInterval.oneTick:
        return isAbbreviate
            ? context.localization.label1TickAbbreviate
            : context.localization.label1Tick;
      case ChartInterval.oneMinute:
        return isAbbreviate
            ? context.localization.label1MinAbbreviate
            : context.localization.label1Min;
      case ChartInterval.twoMinutes:
        return isAbbreviate
            ? context.localization.label2MinsAbbreviate
            : context.localization.label2Mins;
      case ChartInterval.treeMinutes:
        return isAbbreviate
            ? context.localization.label3MinsAbbreviate
            : context.localization.label3Mins;
      case ChartInterval.fiveMinutes:
        return isAbbreviate
            ? context.localization.label5MinsAbbreviate
            : context.localization.label5Mins;
      case ChartInterval.tenMinutes:
        return isAbbreviate
            ? context.localization.label10MinsAbbreviate
            : context.localization.label10Mins;
      case ChartInterval.fifteenMinutes:
        return isAbbreviate
            ? context.localization.label15MinsAbbreviate
            : context.localization.label15Mins;
      case ChartInterval.thirtyMinutes:
        return isAbbreviate
            ? context.localization.label30MinsAbbreviate
            : context.localization.label30Mins;
      case ChartInterval.oneHour:
        return isAbbreviate
            ? context.localization.label1HourAbbreviate
            : context.localization.label1Hour;
      case ChartInterval.twoHours:
        return isAbbreviate
            ? context.localization.label2HoursAbbreviate
            : context.localization.label2Hours;
      case ChartInterval.fourHours:
        return isAbbreviate
            ? context.localization.label4HoursAbbreviate
            : context.localization.label4Hours;
      case ChartInterval.eightHours:
        return isAbbreviate
            ? context.localization.label8HoursAbbreviate
            : context.localization.label8Hours;
      case ChartInterval.oneDay:
        return isAbbreviate
            ? context.localization.label1DayAbbreviate
            : context.localization.label1Day;

      default:
        return '';
    }
  }
}

/// Extension methods for [TradeType] enum
extension TradeTypeExtension on TradeType {
  /// Convert enum to local string
  String toLocalString(
    BuildContext context,
  ) {
    final Map<TradeType, String> tradeTypesMap = <TradeType, String>{
      TradeType.rise: context.localization.labelRise,
      TradeType.fall: context.localization.labelFall,
      TradeType.down: context.localization.labelDown,
      TradeType.up: context.localization.labelUp,
      TradeType.higher: context.localization.labelHigher,
      TradeType.lower: context.localization.labelLower,
      TradeType.touch: context.localization.labelTouch,
      TradeType.noTouch: context.localization.labelNoTouch,
      TradeType.callSpread: context.localization.labelCallSpread,
      TradeType.putSpread: context.localization.labelPutSpread
    };
    return tradeTypesMap[this] ?? '';
  }

  /// Convert enum to string
  String toShortString() => toString().split('.').last;
}
