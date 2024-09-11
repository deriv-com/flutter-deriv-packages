import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Swahili (`sw`).
class DerivMobileChartWrapperLocalizationsSw extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get labelIndicators => 'Viashiria';

  @override
  String get labelActive => 'Inafanya kazi';

  @override
  String get labelAll => 'Wote';

  @override
  String get labelMomentum => 'Mwendo';

  @override
  String get labelVolatility => 'Ubadilishaji';

  @override
  String get labelMovingAverages => 'Wastani wa kusonga';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Kielelezo cha Nguvu ya Uhusiano (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bendi za Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Wastani wa kusonga (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD ni kiashiria cha biashara kinachotumiwa katika uchambuzi wa kiufundi wa bei za hisa. Inapaswa kufichua mabadiliko katika nguvu, mwelekeo, kasi, na muda wa mwenendo wa bei ya hisa.';

  @override
  String get infoRSI => 'Fahirisi ya Nguvu ya Relay (RSI) ilichapishwa na J. Welles Wilder. Bei ya sasa imeorodheshwa kama asilimia kati ya 0 na 100. Flutter_chart_id ya oscillator hii inatoa kwa sababu hailinganishi chombo kinachohusiana na chombo kingine au seti ya vyombo, lakini badala yake inawakilisha bei ya sasa ikilinganishwa na vipande vingine vya hivi karibuni ndani ya urefu wa dirisha lililochaguliwa.';

  @override
  String get infoBB => 'Bendi za Bollinger (BB) zinaweza kutumika kupima juu au chini wa bei kulinganishwa na biashara zilizopita.';

  @override
  String get infoMA => 'Wastani wa Kusonga (MA) husaidia kutambua mwenendo wa jumla wa soko kwa kuchuja mabadiliko ya bei ya muda mfupi. Kutumia data ya kihistoria, inahesabu bei ya wastani kwa kipindi maalum na inapanga mstari kwenye chati. Ikiwa mstari wa MA unasonga juu, ni kiashiria cha kuongezeka, mwenendo wa kushuka ikiwa unasonga chini. Ishara ya ununuzi hutokea wakati bei inapohamia juu ya mstari wa MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Umeongeza idadi kubwa ya viashiria vya kazi.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Ongeza $indicator';
  }

  @override
  String get infoAddIndicator => 'Ongeza kiashiria';

  @override
  String get labelDeleteAllIndicators => 'Futa viashiria vyote';

  @override
  String get infoDeleteAllIndicators => 'Hii itafuta viashiria vyote vya kazi.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Futa kiashiria cha $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'Je! Una hakika unataka kufuta kiashiria hiki?';

  @override
  String get labelCancel => 'Ghairi';

  @override
  String get labelDelete => 'Futa';

  @override
  String get labelDeleteAll => 'Futa Yote';

  @override
  String get infoUpto3indicatorsAllowed => 'Hadi viashiria 3 vya kazi zinaruhusiwa.';

  @override
  String get infoNoActiveIndicators => 'Hakuna viashiria vya kazi.';

  @override
  String get labelReset => 'Weka upya';

  @override
  String get labelApply => 'Tumia';

  @override
  String get labelOK => 'SAWA';

  @override
  String get labelRSILine => 'Mstari wa RSI';

  @override
  String get labelPeriod => 'Kipindi';

  @override
  String get labelMinRange => 'Kiwango cha chini';

  @override
  String get labelMaxRange => 'Kiwango cha juu';

  @override
  String get labelSource => 'chanzo';

  @override
  String get labelClose => 'Kufunga';

  @override
  String get labelOpen => 'Fungua';

  @override
  String get labelHigh => 'Juu';

  @override
  String get labelLow => 'Ndogo';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'HLC/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Onyesha Maeneo';

  @override
  String get labelOverbought => 'Kununua kupita kiasi';

  @override
  String get labelOversold => 'Uuzwa kupita kiasi';

  @override
  String get labelMinSize => 'Ukubwa wa chini';

  @override
  String get labelMaxSize => 'Ukubwa wa juu';

  @override
  String get labelRange => 'Mbalimbali';

  @override
  String get labelOverboughtLine => 'Mstari wa kununuliwa kupita';

  @override
  String get labelOversoldLine => 'Mstari uliouzwa zaidi';

  @override
  String get labelMACDLine => 'Mstari wa MACD';

  @override
  String get labelFastMAPeriod => 'Kipindi cha haraka cha MA';

  @override
  String get labelSlowMAPeriod => 'Kipindi cha polepole cha MA';

  @override
  String get labelSignalLine => 'Mstari wa ishara';

  @override
  String get labelSignalPeriod => 'Kipindi cha ishara';

  @override
  String get labelIncreasingBar => 'Kuongezeka kwa bar';

  @override
  String get labelDecreasingBar => 'Baa ya kupungua';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands juu';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands wastani';

  @override
  String get labelBollingerBandsBottom => 'Bandi za Bollinger chini';

  @override
  String get labelChannelFill => 'Kujaza kituo';

  @override
  String get labelFillColor => 'Jaza rangi';

  @override
  String get labelStandardDeviations => 'Upungufu wa kawaida';

  @override
  String get labelMovingAverageType => 'Aina ya wastani ya kusonga';

  @override
  String get labelMALine => 'Mstari wa MA';

  @override
  String get labelOffset => 'Kidhibiti';

  @override
  String get labelType => 'Aina';

  @override
  String get labelSimple => 'Rahisi';

  @override
  String get labelExponential => 'Mwanganyiko';

  @override
  String get labelWeighted => 'Uzito';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => 'Zero Lag';

  @override
  String get labelTimeSeries => 'Mfululizo wa Wakati';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Tofauti';

  @override
  String get labelTriangular => 'Pembetatu';

  @override
  String get label2Exponential => '2-Exponential';

  @override
  String get label3Exponential => '3-Mfanyiko';

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
}
