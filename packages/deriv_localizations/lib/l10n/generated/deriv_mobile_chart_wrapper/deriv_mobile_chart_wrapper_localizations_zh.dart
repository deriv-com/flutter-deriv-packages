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
    return '這將把 $indicator 指標重設為其預設設定。';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '刪除 $indicator 指標';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '重設 $indicator 指標';
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
    return '輸入介於 $min 和 $max 之間的值';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return '範圍 $min - $max';
  }

  @override
  String get labelDrawingTools => '繪圖工具';

  @override
  String get labelTools => '工具';

  @override
  String get labelLine => '線';

  @override
  String get labelRay => '射線';

  @override
  String get informTapToSetFirstPoint => '輕觸以設定第一點';

  @override
  String get informTapToSetFinalPoint => '輕觸以設定最終點';

  @override
  String get informNoActiveDrawingTools => '沒有可用的繪圖工具。';

  @override
  String get actionAddDrawingTool => '新增繪圖工具';

  @override
  String get labelOf => '的';

  @override
  String get labelDeleteAllDrawingTools => '刪除所有繪圖工具';

  @override
  String get informDeleteAllDrawingTools => '這將刪除所有作用中的繪圖工具。';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class DerivMobileChartWrapperLocalizationsZhCn extends DerivMobileChartWrapperLocalizationsZh {
  DerivMobileChartWrapperLocalizationsZhCn(): super('zh_CN');

  @override
  String get labelIndicators => '指标';

  @override
  String get labelActive => '活跃';

  @override
  String get labelAll => '全部';

  @override
  String get labelMomentum => '动量';

  @override
  String get labelVolatility => 'Volatility';

  @override
  String get labelMovingAverages => '移动平均线';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => '相对强弱指数 (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => '布林线 (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => '移动平均线 (MA)';

  @override
  String get labelMA => '移动平均线 (MA)';

  @override
  String get infoMACD => 'MACD 是用于股价技术分析的交易指标。可揭示股票价格走势的强度、方向、动量和持续时间变化。';

  @override
  String get infoRSI => '相对强度指数 (RSI) 由 J. Welles Wilder 发布。当前价格按介于 0 到 100 之间的百分比被标准化。该振荡线的 flutter_chart_id 具有误导性，因为其不与另一种工具或一组工具相比较，而是代表选定回顾窗口长度内相对于其他近期产品的当前价格。';

  @override
  String get infoBB => '布林线 (BB) 可用于测量与之前交易相对的价格变化高低点。';

  @override
  String get infoMA => '移动平均线 (MA) 通过过滤短期价格波动来帮助识别整体市场趋势。其使用历史数据计算特定时期内的平均价格，并在图表上绘线。如果 MA 线向上移动，则表示上升趋势，如果向下移动，则为下降趋势。当价格升至均线上方时，就会出现买入信号。';

  @override
  String get infoMaximumActiveIndicatorsAdded => '已经添加了最大数量的活跃指标。';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '添加 $indicator';
  }

  @override
  String get infoAddIndicator => '添加指标';

  @override
  String get labelDeleteAllIndicators => '删除所有指标';

  @override
  String get infoDeleteAllIndicators => '这将删除所有活跃指标。';

  @override
  String infoResetIndicators(Object indicator) {
    return '这将重置 $indicator 指标为其默认设置。';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '删除 $indicator 指标';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '重置 $indicator 指标';
  }

  @override
  String get infoDeleteIndicator => '确定要删除此指标吗？';

  @override
  String get labelCancel => '取消';

  @override
  String get labelDelete => '删除';

  @override
  String get labelDeleteAll => '全部删除';

  @override
  String get infoUpto3indicatorsAllowed => '最多允许 3 个活跃指标。';

  @override
  String get infoNoActiveIndicators => '没有活跃指标。';

  @override
  String get labelReset => '重置';

  @override
  String get labelApply => '申请';

  @override
  String get labelOK => '确定';

  @override
  String get labelRSILine => 'RSI 线';

  @override
  String get labelPeriod => '周期';

  @override
  String get labelMinRange => '最小范围';

  @override
  String get labelMaxRange => '最大范围';

  @override
  String get labelSource => '来源';

  @override
  String get labelClose => '收盘';

  @override
  String get labelOpen => '开盘';

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
  String get labelShowZones => '显示区域';

  @override
  String get labelOverbought => '超买';

  @override
  String get labelOversold => '超卖';

  @override
  String get labelMinSize => '最小尺寸';

  @override
  String get labelMaxSize => '最大尺寸';

  @override
  String get labelRange => '范围';

  @override
  String get labelOverboughtLine => '超买线';

  @override
  String get labelOversoldLine => '超卖线';

  @override
  String get labelMACDLine => 'MACD 线';

  @override
  String get labelFastMAPeriod => '快速均线周期';

  @override
  String get labelSlowMAPeriod => '慢速均线周期';

  @override
  String get labelSignalLine => '信号线';

  @override
  String get labelSignalPeriod => '信号周期';

  @override
  String get labelIncreasingBar => '增加柱线';

  @override
  String get labelDecreasingBar => '减小柱线';

  @override
  String get labelBollingerBandsTop => '布林线顶部';

  @override
  String get labelBollingerBandsMedian => '布林线中位数';

  @override
  String get labelBollingerBandsBottom => '布林线底部';

  @override
  String get labelChannelFill => '频道填充';

  @override
  String get labelFillColor => '填充颜色';

  @override
  String get labelStandardDeviations => '标准偏差';

  @override
  String get labelMovingAverageType => '移动平均线类型';

  @override
  String get labelMALine => 'MA 线';

  @override
  String get labelOffset => '偏移';

  @override
  String get labelType => '类型';

  @override
  String get labelSimple => '简单';

  @override
  String get labelExponential => '指数';

  @override
  String get labelWeighted => '加权';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => '零延迟';

  @override
  String get labelTimeSeries => '时间序列';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => '变量';

  @override
  String get labelTriangular => '三角形';

  @override
  String get label2Exponential => '2-指数';

  @override
  String get label3Exponential => '3-指数';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return '输入介于 $min 和 $max 之间的值';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return '范围 $min - $max';
  }

  @override
  String get labelDrawingTools => '绘图工具';

  @override
  String get labelTools => '工具';

  @override
  String get labelLine => '线';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => '轻触即可设置第一个点';

  @override
  String get informTapToSetFinalPoint => '轻触即可设置终点';

  @override
  String get informNoActiveDrawingTools => '没有有效的绘图工具。';

  @override
  String get actionAddDrawingTool => '添加绘图工具';

  @override
  String get labelOf => '的';

  @override
  String get labelDeleteAllDrawingTools => '删除所有绘图工具';

  @override
  String get informDeleteAllDrawingTools => '这将删除所有活跃的绘图工具。';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class DerivMobileChartWrapperLocalizationsZhTw extends DerivMobileChartWrapperLocalizationsZh {
  DerivMobileChartWrapperLocalizationsZhTw(): super('zh_TW');

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
  String get labelRelativeStrengthIndex => '相對強度指數 (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => '布林通道 (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => '移動平均值 (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD 是用於股票價格技術分析的交易指標。可揭露股票價格走勢的力量、方向、動量和期間變化。';

  @override
  String get infoRSI => '相對強度指數 (RSI) 由 J. Welles Wilder 發布。將目前價格以 0 到 100 之間的百分比標準化。此振盪指標的 flutter_chart_id 具有誤導性，因為其不與其他工具或一組工具相比較，而是代表所選回顧視窗長度內相對於其他近期產品的目前價格。';

  @override
  String get infoBB => '布林通道 (BB) 可用於測量與之前交易相對的價格變化高低點.';

  @override
  String get infoMA => '移動平均線 (MA) 透過過濾短期價格波動來幫助識別整體市場趨勢。其使用歷史資料計算特定期間內的平均價格，並在圖表上繪線。如果 MA 線向上移動，則表示上升趨勢，如果向下移動，則為下降趨勢。當價格升至均線上方時，就會出現買進訊號。';

  @override
  String get infoMaximumActiveIndicatorsAdded => '已新增最大數量的使用中指標。';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '新增 $indicator';
  }

  @override
  String get infoAddIndicator => '新增指標';

  @override
  String get labelDeleteAllIndicators => '刪除所有指標';

  @override
  String get infoDeleteAllIndicators => '這將刪除所有使用中指標。';

  @override
  String infoResetIndicators(Object indicator) {
    return '這將重設 $indicator 指標為其預設設定。';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '刪除 $indicator 指標';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '重設 $indicator 指標';
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
  String get infoUpto3indicatorsAllowed => '最多允許 3 個使用中指標。';

  @override
  String get infoNoActiveIndicators => '沒有使用中指標。';

  @override
  String get labelReset => '重設';

  @override
  String get labelApply => '申請';

  @override
  String get labelOK => '確定';

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
  String get labelSignalLine => '訊號線';

  @override
  String get labelSignalPeriod => '訊號週期';

  @override
  String get labelIncreasingBar => '增加條型線';

  @override
  String get labelDecreasingBar => '減少條型線';

  @override
  String get labelBollingerBandsTop => '布林通道頂部';

  @override
  String get labelBollingerBandsMedian => '布林通道中位數';

  @override
  String get labelBollingerBandsBottom => '布林通道底部';

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
    return '輸入介於 $min 和 $max 之間的值';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return '範圍 $min - $max';
  }

  @override
  String get labelDrawingTools => '繪圖工具';

  @override
  String get labelTools => '工具';

  @override
  String get labelLine => '線';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => '輕觸以設定第一點';

  @override
  String get informTapToSetFinalPoint => '輕觸以設定最終點';

  @override
  String get informNoActiveDrawingTools => '沒有可用的繪圖工具。';

  @override
  String get actionAddDrawingTool => '新增繪圖工具';

  @override
  String get labelOf => '的';

  @override
  String get labelDeleteAllDrawingTools => '刪除所有繪圖工具';

  @override
  String get informDeleteAllDrawingTools => '這將刪除所有作用中的繪圖工具。';
}
