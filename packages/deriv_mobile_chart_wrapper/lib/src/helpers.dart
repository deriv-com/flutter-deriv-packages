import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

/// Returns abbreviation name of the indicator for the given [config].
String getIndicatorAbbreviation(IndicatorConfig config, BuildContext context) {
  // TODO(Ramin): use config.shortTitle after updating to the new version of
  // chart package.
  switch (config.runtimeType) {
    case MACDIndicatorConfig:
      return context.mobileChartWrapperLocalizations.labelMACD;
    case RSIIndicatorConfig:
      return context.mobileChartWrapperLocalizations.labelRSI;
    case BollingerBandsIndicatorConfig:
      return context.mobileChartWrapperLocalizations.labelBB;
    case MAIndicatorConfig:
      return context.mobileChartWrapperLocalizations.labelMA;
    default:
      return '';
  }
}

/// Returns the path to the icon of the indicator for the given [config].
String getIndicatorIconPath(IndicatorConfig config) {
  switch (config.runtimeType) {
    case MACDIndicatorConfig:
      return macdIcon;
    case RSIIndicatorConfig:
      return rsiIcon;
    case BollingerBandsIndicatorConfig:
      return bollingerBandsIcon;
    case MAIndicatorConfig:
      return movingAverageIcon;
    default:
      return '';
  }
}

Map<String, String> getSourcesOptions(BuildContext context) => {
      'close': context.mobileChartWrapperLocalizations.labelClose,
      'open': context.mobileChartWrapperLocalizations.labelOpen,
      'high': context.mobileChartWrapperLocalizations.labelHigh,
      'low': context.mobileChartWrapperLocalizations.labelLow,
      'Hl/2': context.mobileChartWrapperLocalizations.labelHl2,
      'HlC/3': context.mobileChartWrapperLocalizations.labelHlc3,
      'HlCC/4': context.mobileChartWrapperLocalizations.labelHlcc4,
      'OHlC/4': context.mobileChartWrapperLocalizations.labelOhlc4,
    };

Map<MovingAverageType, String> getTypesOptions(BuildContext context) => {
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
