import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

const List<Color> availableColors = [
  Color(0xFFFFFFFF), // White
  Color(0xFFF39230), // Orange
  Color(0xFFEF6B53), // Deep Orange
  Color(0xFFD73737), // Red
  Color(0xFF03BFF0), // Light Blue
  Color(0xFF3271B4), // Blue
  Color(0xFF2FBCB5), // Teal
  Color(0xFF8EC648), // Light Green
  Color(0xFF48A25C), // Green
  Color(0xFFFFF224), // Yellow
  Color(0xFFEE6EA9), // Pink
  Color(0xFF853289), // Purple
];

Map<String, String> getSourcesOptions(BuildContext context) => {
      'close': context.mobileChartWrapperLocalizations.labelClose,
      'open': context.mobileChartWrapperLocalizations.labelOpen,
      'high': context.mobileChartWrapperLocalizations.labelHigh,
      'low': context.mobileChartWrapperLocalizations.labelLow,
      'Hl/2': context.mobileChartWrapperLocalizations.labelHl2,
      'HlC/3': context.mobileChartWrapperLocalizations.labelHlc3,
      'HlCC/4': context.mobileChartWrapperLocalizations.labelHlcc4,
      'OHlc/4': context.mobileChartWrapperLocalizations.labelOhlc4,
    };

Map<MovingAverageType, String> getMAOptions(BuildContext context) => {
      MovingAverageType.simple:
          context.mobileChartWrapperLocalizations.labelSimple,
      MovingAverageType.exponential:
          context.mobileChartWrapperLocalizations.labelExponential,
      MovingAverageType.weighted:
          context.mobileChartWrapperLocalizations.labelWeighted,
      MovingAverageType.hull: context.mobileChartWrapperLocalizations.labelHull,
      MovingAverageType.zeroLag:
          context.mobileChartWrapperLocalizations.labelZeroLag,
      MovingAverageType.timeSeries:
          context.mobileChartWrapperLocalizations.labelTimeSeries,
      MovingAverageType.wellesWilder:
          context.mobileChartWrapperLocalizations.labelWellesWilder,
      MovingAverageType.variable:
          context.mobileChartWrapperLocalizations.labelVariable,
      MovingAverageType.triangular:
          context.mobileChartWrapperLocalizations.labelTriangular,
      MovingAverageType.doubleExponential:
          context.mobileChartWrapperLocalizations.label2Exponential,
      MovingAverageType.tripleExponential:
          context.mobileChartWrapperLocalizations.label3Exponential,
    };
