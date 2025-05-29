import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class DerivMobileChartWrapperLocalizationsMn extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get labelIndicators => 'Үзүүлэлт';

  @override
  String get labelActive => 'Идэвхтэй';

  @override
  String get labelAll => 'Бүгд';

  @override
  String get labelMomentum => 'Эрчим хүч';

  @override
  String get labelVolatility => 'Тогтмол байдал';

  @override
  String get labelMovingAverages => 'Хөдөлгөөнт дундаж';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Харьцангуй хүч чадлын индекс (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Боллингер хамтлагууд (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Хөдөлгөөнт дундаж (MA)';

  @override
  String get labelMA => 'МА';

  @override
  String get infoMACD => 'MACD нь хувьцааны үнийн техникийн шинжилгээнд ашиглагддаг арилжааны үзүүлэлт юм. Энэ нь хувьцааны үнийн чиг хандлагын хүч чадал, чиглэл, эрч хүч, үргэлжлэх хугацааны өөрчлөлтийг илрүүлэх ёстой.';

  @override
  String get infoRSI => 'Харьцангуй хүч чадлын индекс (RSI) -ийг Ж.Веллес Вилдер хэвлүүлсэн. Одоогийн үнэ 0-ээс 100-ийн хооронд хувиар хэвийн байна. Энэ осцилляторын flutter_chart_id нь багаж хэрэгслийг өөр багаж хэрэгсэл эсвэл багц багажтай харьцуулдаггүй тул төөрөгдүүлж байна, харин сонгосон lookback цонхны урт доторх бусад сүүлийн үеийн хэсгүүдтэй харьцангуй одоогийн үнийг илэрхийлдэг.';

  @override
  String get infoBB => 'Bollinger Bands (BB) нь өмнөх арилжаатай харьцангуй үнийн өндөр буюу доод түвшинг хэмжихэд ашиглаж болно.';

  @override
  String get infoMA => 'Хөдөлгөөнтэй дундаж (MA) нь богино хугацааны үнийн хэлбэлзлийг шүүлтүүрээр зах зээлийн ерөнхий чиг хандлагыг тодорхойлоход тусалдаг. Түүхэн өгөгдлийг ашиглан тодорхой хугацаанд дундаж үнийг тооцоолж, график дээр мөрийг тавьдаг. Хэрэв MA шугам дээшээ хөдөлвөл энэ нь uptrend, доошоо хөдөлвөл уналтын үзүүлэлт юм. Үнэ нь MA шугамаас дээш шилжих үед худалдан авах дохио үүсдэг.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Та идэвхтэй үзүүлэлтүүдийн хамгийн их тоог нэмсэн.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '$indicatorнэмэх';
  }

  @override
  String get infoAddIndicator => 'Үзүүлэлт нэмэх';

  @override
  String get labelDeleteAllIndicators => 'Бүх үзүүлэлтүүдийг устгах';

  @override
  String get infoDeleteAllIndicators => 'Энэ нь бүх идэвхтэй үзүүлэлтүүдийг устгах болно.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Энэ нь $indicator үзүүлэлтийг анхдагч тохиргоонд нь дахин тохируулах болно.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '$indicator үзүүлэлтийг устгах';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '$indicator үзүүлэлтийг дахин тохируулах';
  }

  @override
  String get infoDeleteIndicator => 'Та энэ үзүүлэлтийг устгахыг хүсч байна гэдэгт итгэлтэй байна уу?';

  @override
  String get labelCancel => 'Цуцлах';

  @override
  String get labelDelete => 'Устгах';

  @override
  String get labelDeleteAll => 'Бүгдийг устгах';

  @override
  String get infoUpto3indicatorsAllowed => '3 хүртэлх идэвхтэй үзүүлэлтийг зөвшөөрнө.';

  @override
  String get infoNoActiveIndicators => 'Идэвхтэй үзүүлэлт байхгүй.';

  @override
  String get labelReset => 'Дахин тохируулах';

  @override
  String get labelApply => 'Өргөдөл';

  @override
  String get labelOK => 'ОК';

  @override
  String get labelRSILine => 'RSI шугам';

  @override
  String get labelPeriod => 'Хугацаа';

  @override
  String get labelMinRange => 'Хамгийн бага хүрээ';

  @override
  String get labelMaxRange => 'Макс хүрээ';

  @override
  String get labelSource => 'Эх сурвалж';

  @override
  String get labelClose => 'Хаах';

  @override
  String get labelOpen => 'Нээлттэй';

  @override
  String get labelHigh => 'Өндөр';

  @override
  String get labelLow => 'Бага';

  @override
  String get labelHl2 => 'Хл/2';

  @override
  String get labelHlc3 => 'Хлц/3';

  @override
  String get labelHlcc4 => 'Хлц/4';

  @override
  String get labelOhlc4 => 'Охлц/4';

  @override
  String get labelShowZones => 'Бүсүүдийг харуулах';

  @override
  String get labelOverbought => 'Хэт их худалдан авсан';

  @override
  String get labelOversold => 'Хэт борлуулсан';

  @override
  String get labelMinSize => 'Хамгийн бага хэмжээ';

  @override
  String get labelMaxSize => 'Макс хэмжээ';

  @override
  String get labelRange => 'Хамрах хүрээ';

  @override
  String get labelOverboughtLine => 'Хэт их худалдан авсан шугам';

  @override
  String get labelOversoldLine => 'Хэт борлуулсан шугам';

  @override
  String get labelMACDLine => 'MACD шугам';

  @override
  String get labelFastMAPeriod => 'Хурдан MA хугацаа';

  @override
  String get labelSlowMAPeriod => 'Удаан MA хугацаа';

  @override
  String get labelSignalLine => 'Дохионы шугам';

  @override
  String get labelSignalPeriod => 'Дохионы хугацаа';

  @override
  String get labelIncreasingBar => 'Баар нэмэгдэж байна';

  @override
  String get labelDecreasingBar => 'Бар буурч байна';

  @override
  String get labelBollingerBandsTop => 'Боллингерийн топ хамтлагууд';

  @override
  String get labelBollingerBandsMedian => 'Боллингер хамтлагийн дундаж';

  @override
  String get labelBollingerBandsBottom => 'Боллингер хамтлагуудын доод хэсэг';

  @override
  String get labelChannelFill => 'Суваг дүүргэх';

  @override
  String get labelFillColor => 'Өнгө бөглөнө';

  @override
  String get labelStandardDeviations => 'Стандарт хазайлт';

  @override
  String get labelMovingAverageType => 'Хөдөлгөөнт дундаж төрөл';

  @override
  String get labelMALine => 'MA шугам';

  @override
  String get labelOffset => 'Офсет';

  @override
  String get labelType => 'Төрөл';

  @override
  String get labelSimple => 'Энгийн';

  @override
  String get labelExponential => 'Экспоненциаль';

  @override
  String get labelWeighted => 'Жинлэгдсэн';

  @override
  String get labelHull => 'Халл';

  @override
  String get labelZeroLag => 'Тэг хоцрогдол';

  @override
  String get labelTimeSeries => 'Цагийн цуврал';

  @override
  String get labelWellesWilder => 'Веллес Вилдер';

  @override
  String get labelVariable => 'Хувьсах';

  @override
  String get labelTriangular => 'Гурвалжин';

  @override
  String get label2Exponential => '2-Экспоненциаль';

  @override
  String get label3Exponential => '3-Экспоненциаль';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return '$min ба $maxхооронд утга оруулна уу';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Хүрээ $min - $max';
  }

  @override
  String get labelDrawingTools => 'Зургийн хэрэгсэл';

  @override
  String get labelTools => 'Багаж хэрэгсэл';

  @override
  String get labelLine => 'шугам';

  @override
  String get labelRay => 'Рэй';

  @override
  String get informTapToSetFirstPoint => 'Эхний цэгийг тохируулахын тулд товшино уу';

  @override
  String get informTapToSetFinalPoint => 'Эцсийн цэгийг тохируулахын тулд товшино уу';

  @override
  String get informNoActiveDrawingTools => 'Идэвхтэй зургийн хэрэгсэл байхгүй.';

  @override
  String get actionAddDrawingTool => 'Зургийн хэрэгсэл нэмэх';

  @override
  String get labelOf => '-ийн';

  @override
  String get labelDeleteAllDrawingTools => 'Бүх зургийн хэрэгслийг устгах';

  @override
  String get informDeleteAllDrawingTools => 'Энэ нь бүх идэвхтэй зургийн хэрэгслийг устгах болно.';
}
