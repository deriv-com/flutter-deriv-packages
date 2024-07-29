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

List<String> getSourcesOptions(BuildContext context) => [
      context.mobileChartWrapperLocalizations.labelClose,
      context.mobileChartWrapperLocalizations.labelOpen,
      context.mobileChartWrapperLocalizations.labelHigh,
      context.mobileChartWrapperLocalizations.labelLow,
      context.mobileChartWrapperLocalizations.labelHl2,
      context.mobileChartWrapperLocalizations.labelHlcc4,
      context.mobileChartWrapperLocalizations.labelOhlc4,
    ];

List<String> getMAOptions(BuildContext context) => [
      context.mobileChartWrapperLocalizations.labelSimple,
      context.mobileChartWrapperLocalizations.labelExponential,
      context.mobileChartWrapperLocalizations.labelWeighted,
      context.mobileChartWrapperLocalizations.labelHull,
      context.mobileChartWrapperLocalizations.labelZeroLag,
      context.mobileChartWrapperLocalizations.labelTimeSeries,
      context.mobileChartWrapperLocalizations.labelWellesWilder,
      context.mobileChartWrapperLocalizations.labelVariable,
      context.mobileChartWrapperLocalizations.labelTriangular,
      context.mobileChartWrapperLocalizations.label2Exponential,
      context.mobileChartWrapperLocalizations.label3Exponential,
    ];
