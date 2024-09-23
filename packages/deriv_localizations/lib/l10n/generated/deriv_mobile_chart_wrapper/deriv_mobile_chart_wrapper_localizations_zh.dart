import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Chinese (`zh`).
class DerivMobileChartWrapperLocalizationsZh extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get labelIndicators => '指標';

  @override
  String get labelActive => '活躍';

  @override
  String get labelAll => '全部';

  @override
  String get labelMomentum => '動量';

  @override
  String get labelVolatility => '波動性';

  @override
  String get labelMovingAverages => '移動平均線';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => '相對強度指數（RSI）';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => '布林格帶（BB）';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => '移動平均值 (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD 是交易指標，用於股票價格的技術分析。可顯示股票價格中趨勢的強度、方向、動量和持續時間的變化。';

  @override
  String get infoRSI => '相對強度指數（RSI）由 J. Welles Wilder 發布。將目前價格以 0 到 100 之間的百分比標準化。此振盪器的 flutter_chart_id 具有誤導性，因為它不與其他工具或一組工具相比較，而是代表所選回顧窗口長度內與其他最近的股票相對的目前價格。';

  @override
  String get infoBB => '布林格帶（BB）可用於測量與之前交易相對於價格的高度或低度。';

  @override
  String get infoMA => '移動平均線（MA）通過過濾短期價格波動來幫助識別整體市場趨勢。它使用歷史資料，計算特定期間的平均價格，並在圖表繪線。如果 MA 線向上移動，則是上升趨勢的指標，如果向下移動則是下降趨勢的指標。當價格走在 MA 線上方時，就會出現買入信號。';

  @override
  String get infoMaximumActiveIndicatorsAdded => '已新增使用中指標數目上限。';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '新增 $indicator';
  }

  @override
  String get infoAddIndicator => '新增指標';

  @override
  String get labelDeleteAllIndicators => '刪除所有指標';

  @override
  String get infoDeleteAllIndicators => '這將刪除所有活躍指標。';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '刪除 $indicator 指標';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => '確定要刪除此指標嗎？';

  @override
  String get labelCancel => '取消';

  @override
  String get labelDelete => '刪除';

  @override
  String get labelDeleteAll => '刪除全部';

  @override
  String get infoUpto3indicatorsAllowed => '最多允許 3 個活躍指標。';

  @override
  String get infoNoActiveIndicators => '沒有活躍指標。';

  @override
  String get labelReset => '重設';

  @override
  String get labelApply => '申請';

  @override
  String get labelOK => '好';

  @override
  String get labelRSILine => 'RSI 線';

  @override
  String get labelPeriod => '週期';

  @override
  String get labelMinRange => '最小範圍';

  @override
  String get labelMaxRange => '最大範圍';

  @override
  String get labelSource => '來源';

  @override
  String get labelClose => '關閉';

  @override
  String get labelOpen => '開啟';

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
  String get labelShowZones => '顯示區域';

  @override
  String get labelOverbought => '超買';

  @override
  String get labelOversold => '超賣';

  @override
  String get labelMinSize => '最小尺寸';

  @override
  String get labelMaxSize => '最大尺寸';

  @override
  String get labelRange => '範圍';

  @override
  String get labelOverboughtLine => '超買線';

  @override
  String get labelOversoldLine => '超賣線';

  @override
  String get labelMACDLine => 'MACD 線';

  @override
  String get labelFastMAPeriod => '快速 MA 週期';

  @override
  String get labelSlowMAPeriod => '慢速 MA 週期';

  @override
  String get labelSignalLine => '信號線';

  @override
  String get labelSignalPeriod => '信號週期';

  @override
  String get labelIncreasingBar => '增加條型線';

  @override
  String get labelDecreasingBar => '減少條型線';

  @override
  String get labelBollingerBandsTop => '布林格帶頂部';

  @override
  String get labelBollingerBandsMedian => '布林格帶中位數';

  @override
  String get labelBollingerBandsBottom => '布林格帶底部';

  @override
  String get labelChannelFill => '通道填充';

  @override
  String get labelFillColor => '填色';

  @override
  String get labelStandardDeviations => '標準偏差';

  @override
  String get labelMovingAverageType => '移動平均線類型';

  @override
  String get labelMALine => 'MA 線';

  @override
  String get labelOffset => '偏移';

  @override
  String get labelType => '類型';

  @override
  String get labelSimple => '簡單';

  @override
  String get labelExponential => '指數式';

  @override
  String get labelWeighted => '加權';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => '零延遲';

  @override
  String get labelTimeSeries => '時間序列';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => '變量';

  @override
  String get labelTriangular => '三角形';

  @override
  String get label2Exponential => '2-指數式';

  @override
  String get label3Exponential => '3-指數式';

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
  String get labelOf => 'of';

  @override
  String get labelDeleteAllDrawingTools => 'Delete all drawing tools';

  @override
  String get informDeleteAllDrawingTools => 'This will delete all active drawing tools.';
}
