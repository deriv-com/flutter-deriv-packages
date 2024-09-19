import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Thai (`th`).
class DerivMobileChartWrapperLocalizationsTh extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get labelIndicators => 'ตัวบ่งชี้';

  @override
  String get labelActive => 'ใช้งานอยู่';

  @override
  String get labelAll => 'ทั้งหมด';

  @override
  String get labelMomentum => 'โมเมนตัม';

  @override
  String get labelVolatility => 'ความผันผวน';

  @override
  String get labelMovingAverages => 'ค่าเฉลี่ยเคลื่อนที่';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'ดัชนีความแข็งแรงสัมพัทธ์ (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bands (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'ค่าเฉลี่ยเคลื่อนที่ (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD เป็นตัวบ่งชี้ที่ใช้ในการวิเคราะห์ทางเทคนิคของราคาหุ้น มีวัตถุประสงค์เพื่อแสดงการเปลี่ยนแปลงในความแข็งแกร่ง ทิศทาง โมเมนตัม และระยะเวลาของแนวโน้มในราคาหุ้น';

  @override
  String get infoRSI => 'ดัชนีความแข็งแรงสัมพัทธ์หรือ Relative Strength Index (RSI) ถูกตีพิมพ์โดย J. Welles Wilder ราคาปัจจุบันถูกแปลงเป็นเปอร์เซ็นต์ระหว่าง 0 ถึง 100 ค่า flutter_chart_id ของตัวบ่งชี้นี้อาจทำให้เข้าใจผิดได้ เนื่องจากไม่ได้เปรียบเทียบตราสารอันหนึ่งกับตราสารอื่นหรือกลุ่มสินทรัพย์อื่น แต่จะแสดงราคาปัจจุบันเทียบกับราคาล่าสุดในช่วงระยะเวลาที่เลือกมองย้อนกลับไป';

  @override
  String get infoBB => 'Bollinger Bands (BB) สามารถใช้วัดความสูงหรือต่ำของราคาเมื่อเทียบกับการซื้อขายก่อนหน้านี้';

  @override
  String get infoMA => 'ค่าเฉลี่ยเคลื่อนที่หรือ Moving Average (MA) ช่วยในการระบุแนวโน้มตลาดโดยรวมโดยการกรองความผันผวนของราคาระยะสั้นออกไป โดยใช้ข้อมูลในอดีตเพื่อคำนวณราคาที่เฉลี่ยในช่วงเวลาที่กำหนดและแสดงเป็นเส้นบนกราฟ หากเส้น MA เคลื่อนที่ขึ้นแสดงถึงแนวโน้มขาขึ้น หากเคลื่อนที่ลงแสดงถึงแนวโน้มขาลง สัญญาณการซื้อเกิดขึ้นเมื่อราคาขยับเหนือเส้น MA';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'คุณได้เพิ่มตัวบ่งชี้ที่ใช้งานอยู่จนถึงจำนวนสูงสุดแล้ว';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'เพิ่ม $indicator';
  }

  @override
  String get infoAddIndicator => 'เพิ่มตัวบ่งชี้';

  @override
  String get labelDeleteAllIndicators => 'ลบตัวบ่งชี้ทั้งหมด';

  @override
  String get infoDeleteAllIndicators => 'สิ่งนี้จะลบตัวบ่งชี้ที่ใช้งานอยู่ทั้งหมด';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'ลบตัวบ่งชี้ $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'คุณแน่ใจหรือไม่ว่าต้องการลบตัวบ่งชี้นี้?';

  @override
  String get labelCancel => 'ยกเลิก';

  @override
  String get labelDelete => 'ลบ';

  @override
  String get labelDeleteAll => 'ลบทั้งหมด';

  @override
  String get infoUpto3indicatorsAllowed => 'อนุญาตให้ใช้ตัวบ่งชี้ที่ใช้งานอยู่สูงสุด 3 ตัว';

  @override
  String get infoNoActiveIndicators => 'ไม่มีตัวบ่งชี้ที่ใช้งานอยู่';

  @override
  String get labelReset => 'รีเซ็ท';

  @override
  String get labelApply => 'ใช้งาน';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'เส้น RSI';

  @override
  String get labelPeriod => 'ระยะเวลา';

  @override
  String get labelMinRange => 'ช่วงขั้นต่ำ';

  @override
  String get labelMaxRange => 'ช่วงสูงสุด';

  @override
  String get labelSource => 'แหล่งที่มา';

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
  String get labelShowZones => 'แสดงโซน';

  @override
  String get labelOverbought => 'การซื้อมากเกินไป';

  @override
  String get labelOversold => 'การขายมากเกินไป';

  @override
  String get labelMinSize => 'ขนาดขั้นต่ำ';

  @override
  String get labelMaxSize => 'ขนาดสูงสุด';

  @override
  String get labelRange => 'ช่วง';

  @override
  String get labelOverboughtLine => 'เส้นการซื้อมากเกินไป';

  @override
  String get labelOversoldLine => 'เส้นการขายมากเกินไป';

  @override
  String get labelMACDLine => 'เส้น MACD';

  @override
  String get labelFastMAPeriod => 'ระยะเวลา MA ที่เร็ว';

  @override
  String get labelSlowMAPeriod => 'ระยะเวลา MA ที่ช้า';

  @override
  String get labelSignalLine => 'เส้นสัญญาณ';

  @override
  String get labelSignalPeriod => 'ระยะเวลาสัญญาณ';

  @override
  String get labelIncreasingBar => 'แถบที่เพิ่มขึ้น';

  @override
  String get labelDecreasingBar => 'แถบที่ลดลง';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands อันบน';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands อันกลาง';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bands อันล่าง';

  @override
  String get labelChannelFill => 'เติม Channel';

  @override
  String get labelFillColor => 'เติมสี';

  @override
  String get labelStandardDeviations => 'ค่าเบี่ยงเบนมาตรฐาน';

  @override
  String get labelMovingAverageType => 'ประเภทค่าเฉลี่ยเคลื่อนที่ (MA)';

  @override
  String get labelMALine => 'เส้น MA';

  @override
  String get labelOffset => 'ออฟเซ็ท';

  @override
  String get labelType => 'ประเภท';

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
  String get labelTimeSeries => 'ชุดข้อมูลตามลำดับเวลา';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'แบบแปรผัน';

  @override
  String get labelTriangular => 'แบบสามเหลี่ยม';

  @override
  String get label2Exponential => '2-เลขชี้กำลัง';

  @override
  String get label3Exponential => '3- เลขชี้กำลัง';

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
