import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class DerivMobileChartWrapperLocalizationsMn extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get labelIndicators => 'Indicators';

  @override
  String get labelActive => 'Active';

  @override
  String get labelAll => 'All';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Volatility';

  @override
  String get labelMovingAverages => 'Moving averages';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Relative Strength Index (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bands (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Moving Average (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD is a trading indicator used in technical analysis of stock prices. It is supposed to reveal changes in the strength, direction, momentum, and duration of a trend in a stock\'s price.';

  @override
  String get infoRSI => 'The Relative Strength Index (RSI) was published by J. Welles Wilder. The current price is normalized as a percentage between 0 and 100. The flutter_chart_id of this oscillator is misleading because it does not compare the instrument relative to another instrument or set of instruments, but rather represents the current price relative to other recent pieces within the selected lookback window length.';

  @override
  String get infoBB => 'Bollinger Bands (BB) can be used to measure the highness or lowness of the price relative to previous trades.';

  @override
  String get infoMA => 'The Moving Average (MA) helps to identify the overall market trend by filtering out short-term price fluctuations. Using historical data, it calculates the average price over a specific period and plots a line on the chart. If the MA line moves upwards, it’s an indicator of an uptrend, a downtrend if it moves downwards. A buy signal occurs when the price moves above the MA line.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'You\'ve added the maximum number of active indicators.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Add $indicator';
  }

  @override
  String get infoAddIndicator => 'Add indicator';

  @override
  String get labelDeleteAllIndicators => 'Delete all indicators';

  @override
  String get infoDeleteAllIndicators => 'This will delete all active indicators.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Delete $indicator indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'Are you sure you want to delete this indicator?';

  @override
  String get labelCancel => 'Cancel';

  @override
  String get labelDelete => 'Delete';

  @override
  String get labelDeleteAll => 'Delete All';

  @override
  String get infoUpto3indicatorsAllowed => 'Up to 3 active indicators allowed.';

  @override
  String get infoNoActiveIndicators => 'No active indicators.';

  @override
  String get labelReset => 'Reset';

  @override
  String get labelApply => 'Apply';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'RSI line';

  @override
  String get labelPeriod => 'Period';

  @override
  String get labelMinRange => 'Min range';

  @override
  String get labelMaxRange => 'Max range';

  @override
  String get labelSource => 'Source';

  @override
  String get labelClose => 'Close';

  @override
  String get labelOpen => 'Open';

  @override
  String get labelHigh => 'High';

  @override
  String get labelLow => 'Low';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Show Zones';

  @override
  String get labelOverbought => 'Overbought';

  @override
  String get labelOversold => 'Oversold';

  @override
  String get labelMinSize => 'Min size';

  @override
  String get labelMaxSize => 'Max size';

  @override
  String get labelRange => 'Range';

  @override
  String get labelOverboughtLine => 'Overbought line';

  @override
  String get labelOversoldLine => 'Oversold line';

  @override
  String get labelMACDLine => 'MACD line';

  @override
  String get labelFastMAPeriod => 'Fast MA period';

  @override
  String get labelSlowMAPeriod => 'Slow MA period';

  @override
  String get labelSignalLine => 'Signal line';

  @override
  String get labelSignalPeriod => 'Signal period';

  @override
  String get labelIncreasingBar => 'Increasing bar';

  @override
  String get labelDecreasingBar => 'Decreasing bar';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands top';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands median';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bands bottom';

  @override
  String get labelChannelFill => 'Channel fill';

  @override
  String get labelFillColor => 'Fill color';

  @override
  String get labelStandardDeviations => 'Standard deviations';

  @override
  String get labelMovingAverageType => 'Moving Average Type';

  @override
  String get labelMALine => 'MA line';

  @override
  String get labelOffset => 'Offset';

  @override
  String get labelType => 'Type';

  @override
  String get labelSimple => 'Simple';

  @override
  String get labelExponential => 'Exponential';

  @override
  String get labelWeighted => 'Weighted';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => 'Zero Lag';

  @override
  String get labelTimeSeries => 'Time Series';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variable';

  @override
  String get labelTriangular => 'Triangular';

  @override
  String get label2Exponential => '2-Exponential';

  @override
  String get label3Exponential => '3-Exponential';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Enter a value between $min and $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Range $min - $max';
  }

  @override
  String get labelDrawingTools => 'Drawing tools';

  @override
  String get labelTools => 'Tools';

  @override
  String get labelLine => 'Line';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Tap to set first point';

  @override
  String get informTapToSetFinalPoint => 'Tap to set final point';

  @override
  String get informNoActiveDrawingTools => 'No active drawing tools.';

  @override
  String get actionAddDrawingTool => 'Add drawing tool';

  @override
  String get labelOf => '-ийн';

  @override
  String get labelDeleteAllDrawingTools => 'Бүх зургийн хэрэгслийг устгах';

  @override
  String get informDeleteAllDrawingTools => 'Энэ нь бүх идэвхтэй зургийн хэрэгслийг устгах болно.';
}
