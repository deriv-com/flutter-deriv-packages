import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Thai (`th`).
class DerivMobileChartWrapperLocalizationsTh extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get labelIndicators => 'ตัวบ่งชี้';

  @override
  String get labelActive => 'แอคทีฟ';

  @override
  String get labelAll => 'ทั้งหมด';

  @override
  String get labelMomentum => 'โมเมนตัม';

  @override
  String get labelVolatility => 'ความผันผัน';

  @override
  String get labelMovingAverages => 'ค่าเฉลี่ยเคลื่อนที่';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'ดัชนีความแข็งแรงสัมพัทธ์ (RSI)';

  @override
  String get labelRSI => 'อาร์เอสไอ';

  @override
  String get labelBollingerBands => 'โบลลิงเกอร์แบนด์ (BB)';

  @override
  String get labelBB => 'บีบี';

  @override
  String get labelMovingAverage => 'ค่าเฉลี่ยเคลื่อนที่ (MA)';

  @override
  String get labelMA => 'แม่';

  @override
  String get infoMACD => 'MACD เป็นตัวบ่งชี้การซื้อขายที่ใช้ในการวิเคราะห์ทางเทคนิคของราคาหุ้นมันควรจะเปิดเผยการเปลี่ยนแปลงในความแข็งแกร่งทิศทางโมเมนตัมและระยะเวลาของแนวโน้มในราคาหุ้น';

  @override
  String get infoRSI => 'ดัชนีความแข็งแกร่งสัมพัทธ์ (RSI) เผยแพร่โดย เจ เวลเลส ไวลดอร์ราคาปัจจุบันเป็นปกติเป็นเปอร์เซ็นต์ระหว่าง 0 ถึง 100flutter_chart_id ของออสซิลเลเตอร์นี้ทำให้เข้าใจผิดเพราะไม่ได้เปรียบเทียบตราสารที่เกี่ยวข้องกับตราสารอื่น หรือชุดตราสารหนึ่ง แต่เป็นตัวแทนของราคาปัจจุบันเมื่อเทียบกับชิ้นส่วนล่าสุดอื่น ๆ ภายในความยาวหน้าต่างมองย้อนกลับที่เลือก';

  @override
  String get infoBB => 'Bollinger Bands (BB) สามารถใช้เพื่อวัดความสูงหรือต่ำของราคาเมื่อเทียบกับการซื้อขายครั้งก่อน';

  @override
  String get infoMA => 'ค่าเฉลี่ยเคลื่อนที่ (MA) ช่วยระบุแนวโน้มของตลาดโดยรวมโดยการกรองความผันผวนของราคาระยะสั้นการใช้ข้อมูลในอดีตจะคำนวณราคาเฉลี่ยในช่วงเวลาที่เฉพาะเจาะจงและแสดงเส้นบนแผนภูมิหากเส้น MA เคลื่อนไปขึ้นมันเป็นตัวบ่งชี้ของแนวโน้มขาขึ้น เทรนด์ขาลงหากเคลื่อนที่ลงลงสัญญาณการซื้อเกิดขึ้นเมื่อราคาเคลื่อนที่เหนือบรรทัด MA';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'คุณได้เพิ่มจำนวนตัวบ่งชี้ที่ใช้งานได้สูงสุดแล้ว';

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
  String labelDeleteIndicator(Object indicator) {
    return 'ลบตัวบ่งชี้ $indicator';
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
  String get infoUpto3indicatorsAllowed => 'อนุญาตให้ใช้ตัวบ่งชี้ที่ใช้งานได้สูงสุด 3 ตัว';

  @override
  String get infoNoActiveIndicators => 'คุณยังไม่มีตัวบ่งชี้ที่ใช้งานอยู่';

  @override
  String get labelReset => 'รีเซ็ต';

  @override
  String get labelApply => 'สมัคร';

  @override
  String get labelOK => 'โอเค';

  @override
  String get labelRSILine => 'สาย RSI';

  @override
  String get labelPeriod => 'ระยะเวลา';

  @override
  String get labelMinRange => 'ช่วงขั้นต่ำ';

  @override
  String get labelMaxRange => 'ช่วงสูงสุด';

  @override
  String get labelSource => 'แหล่งที่มา';

  @override
  String get labelClose => 'ปิด';

  @override
  String get labelOpen => 'เปิด';

  @override
  String get labelHigh => 'สูง';

  @override
  String get labelLow => 'ต่ำ';

  @override
  String get labelHl2 => 'เอชเอล/2';

  @override
  String get labelHlc3 => 'เอชแอลซี/3';

  @override
  String get labelHlcc4 => 'เอชลซีซี/4';

  @override
  String get labelOhlc4 => 'โอเอลซี/4';

  @override
  String get labelShowZones => 'แสดงโซน';

  @override
  String get labelOverbought => 'ซื้อมากเกินไป';

  @override
  String get labelOversold => 'ขายมากเกินไป';

  @override
  String get labelMinSize => 'ขนาดขั้นต่ำ';

  @override
  String get labelMaxSize => 'ขนาดสูงสุด';

  @override
  String get labelRange => 'เรนจ์';

  @override
  String get labelOverboughtLine => 'สายซื้อมากเกินไป';

  @override
  String get labelOversoldLine => 'สายขายมากเกินไป';

  @override
  String get labelMACDLine => 'สาย MACD';

  @override
  String get labelFastMAPeriod => 'ระยะเวลา MA ที่รวดเร็ว';

  @override
  String get labelSlowMAPeriod => 'ระยะเวลา MA ช้า';

  @override
  String get labelSignalLine => 'สายสัญญาณ';

  @override
  String get labelSignalPeriod => 'ระยะเวลาสัญญาณ';

  @override
  String get labelIncreasingBar => 'แถบเพิ่มขึ้น';

  @override
  String get labelDecreasingBar => 'แถบลดลง';

  @override
  String get labelBollingerBandsTop => 'เสื้อแถบโบลลิงเจอร์';

  @override
  String get labelBollingerBandsMedian => 'แถบโบลลิงเกอร์เฉลี่ย';

  @override
  String get labelBollingerBandsBottom => 'แถบโบลลิงเกอร์ด้านล่าง';

  @override
  String get labelChannelFill => 'เติมช่อง';

  @override
  String get labelFillColor => 'เติมสี';

  @override
  String get labelStandardDeviations => 'เบี่ยงเบนมาตรฐาน';

  @override
  String get labelMovingAverageType => 'ประเภทค่าเฉลี่ยเคลื่อนที่';

  @override
  String get labelMALine => 'สาย MA';

  @override
  String get labelOffset => 'ออฟเซต';

  @override
  String get labelType => 'ประเภท';

  @override
  String get labelSimple => 'เรียบง่าย';

  @override
  String get labelExponential => 'เลขชี้กำลัง';

  @override
  String get labelWeighted => 'ถ่วงน้ำหนัก';

  @override
  String get labelHull => 'ฮัลล์';

  @override
  String get labelZeroLag => 'ความล่าช้าเป็นศูนย์';

  @override
  String get labelTimeSeries => 'ซีรี่ส์เวลา';

  @override
  String get labelWellesWilder => 'เวลเลส ไวล์เดอร์';

  @override
  String get labelVariable => 'ตัวแปร';

  @override
  String get labelTriangular => 'สามเหลี่ยม';

  @override
  String get label2Exponential => '2-เลขชี้กำลัง';

  @override
  String get label3Exponential => '3- เลขชี้กำลัง';
}
