import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/utils/popup_dialogs_helper.dart';
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

String getIndicatorAbbreviationWithCount(
        IndicatorConfig config, BuildContext context) =>
    '${getIndicatorAbbreviation(config, context)} ${config.number > 0 ? config.number : ''}';

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

/// Returns the path to the icon of the drawing tool
/// for the given [drawingToolType].
String getDrawingToolIconPath(Type drawingToolType) {
  switch (drawingToolType) {
    case LineDrawingToolConfig:
      return lineIcon;
    case RayDrawingToolConfig:
      return rsiIcon;
    default:
      return '';
  }
}

/// Returns the list of drawing tools available for the chart.
List<DrawingToolItemModel> getDrawingToolsList(BuildContext context) {
  List<DrawingToolItemModel> drawingTools = <DrawingToolItemModel>[
    DrawingToolItemModel(
      title: context.mobileChartWrapperLocalizations.labelLine,
      icon: lineIcon,
      config: const LineDrawingToolConfig(
        lineStyle: LineStyle(thickness: 0.9, color: BrandColors.coral),
      ),
    ),
    DrawingToolItemModel(
      title: context.mobileChartWrapperLocalizations.labelRay,
      icon: macdIcon,
      config: const RayDrawingToolConfig(),
    ),
  ];

  return drawingTools;
}

String getDrawingToolTitleWithCount(
  BuildContext context,
  DrawingToolConfig config,
) =>
    '${getDrawingToolTitle(
      context,
      config,
    )} ${config.number > 0 ? config.number : ''}';

String getDrawingToolTitle(
  BuildContext context,
  DrawingToolConfig config,
) {
  switch (config.runtimeType) {
    case LineDrawingToolConfig:
      return context.mobileChartWrapperLocalizations.labelLine;
    case RayDrawingToolConfig:
      return context.mobileChartWrapperLocalizations.labelRay;
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

Future<void> showResetIndicatorDialog(
  BuildContext context, {
  required IndicatorConfig config,
  required Function() onResetPressed,
}) {
  return showAlertDialog(
      context: context,
      title: context.mobileChartWrapperLocalizations.labelResetIndicator(
        getIndicatorAbbreviationWithCount(config, context),
      ),
      content: Text(
        context.mobileChartWrapperLocalizations.infoResetIndicators(
          getIndicatorAbbreviationWithCount(config, context),
        ),
        style: TextStyles.subheading,
      ),
      positiveActionLabel: context.mobileChartWrapperLocalizations.labelReset,
      negativeButtonLabel: context.mobileChartWrapperLocalizations.labelCancel,
      showLoadingIndicator: false,
      onPositiveActionPressed: () {
        onResetPressed.call();
        Navigator.pop(context);
      },
      onNegativeActionPressed: () {
        Navigator.pop(context);
      });
}
