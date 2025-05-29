import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class DerivMobileChartWrapperLocalizationsUz extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get labelIndicators => 'Ko\'rsatkichlar';

  @override
  String get labelActive => 'Faol';

  @override
  String get labelAll => 'Hammasi';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Volatility';

  @override
  String get labelMovingAverages => 'Harakatlanuvchi o\'rtacha';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Nisbiy Kuch Indeksi (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bands (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Harakatlanuvchi O\'rtacha (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD - bu qimmatli qog\'ozlar narxini texnik tahlil qilishda foydalaniladigan savdo ko\'rsatkichi. U aktsiya bahosidagi trend kuchi, yo\'nalishi, momentum va davomiyligidagi o\'zgarishlarni aniqlashi kerak.';

  @override
  String get infoRSI => 'Nisbiy Kuch Indeksi (RSI) J. Welles Wilder tomonidan nashr etilgan. Joriy narx 0 dan 100 gacha foiz sifatida normallashtiriladi. Ushbu oscillator flutter_chart_identifikatori noto\'g\'ri, chunki u asbobni boshqa asbob yoki asboblar to\'plamiga nisbatan solishtirmaydi, balki tanlangan mahsulot ichidagi boshqa so\'nggi qismlarga nisbatan joriy narxni ifodalaydi. Qayta ko\'rish oynasining uzunligi.';

  @override
  String get infoBB => 'Bollinger Bands (BB) oldingi savdolarga nisbatan narxning yuqori yoki pastligini o\'lchash uchun ishlatilishi mumkin.';

  @override
  String get infoMA => 'Harakatlanuvchi O\'rtacha (MA) qisqa muddatli narxlar o\'zgarishini filtrlash orqali umumiy bozor trend aniqlashga yordam beradi. Tarixiy ma\'lumotlardan foydalanib, u ma\'lum bir davr uchun o\'rtacha narxni hisoblab chiqadi va diagrammada chiziq chizadi. Agar MA chizig\'i yuqoriga qarab harakatlansa, bu ko\'tarilishning ko\'rsatkichidir, agar u pastga harakat qilsa, pasayish trenddir. Narx MA chizig\'idan yuqoriga ko\'tarilganda sotib olish signali paydo bo\'ladi.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Siz faol ko\'rsatkichlarning maksimal sonini qo\'shdingiz.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '$indicator qo‘shish';
  }

  @override
  String get infoAddIndicator => 'Ko\'rsatkich qo\'shish';

  @override
  String get labelDeleteAllIndicators => 'Barcha ko\'rsatgichlarni o\'chirish';

  @override
  String get infoDeleteAllIndicators => 'Bu barcha faol ko\'rsatkichlarni o\'chiradi.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Bu $indicator indikatorini standart sozlamalariga qaytaradi.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '$indicator ko\'rsatgichini o\'chirish';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return '$indicator indikatorini tiklash';
  }

  @override
  String get infoDeleteIndicator => 'Haqiqatan ham bu koʻrsatkichni oʻchirib tashlamoqchimisiz?';

  @override
  String get labelCancel => 'Bekor qilish';

  @override
  String get labelDelete => 'O\'chirish';

  @override
  String get labelDeleteAll => 'Hammasini o\'chirish';

  @override
  String get infoUpto3indicatorsAllowed => '3 tagacha faol ko\'rsatkichga ruxsat beriladi.';

  @override
  String get infoNoActiveIndicators => 'Faol ko\'rsatkichlar yo\'q.';

  @override
  String get labelReset => 'Qayta tiklash';

  @override
  String get labelApply => 'Qo\'llash';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'RSI liniyasi';

  @override
  String get labelPeriod => 'Davr';

  @override
  String get labelMinRange => 'Min diapazoni';

  @override
  String get labelMaxRange => 'Maks diapazoni';

  @override
  String get labelSource => 'Manba';

  @override
  String get labelClose => 'Yopish';

  @override
  String get labelOpen => 'Ochiq';

  @override
  String get labelHigh => 'Yuqori';

  @override
  String get labelLow => 'Past';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Zonalarni ko\'rsatish';

  @override
  String get labelOverbought => 'Haddan tashqari sotib olingan';

  @override
  String get labelOversold => 'Haddan tashqari sotilgan';

  @override
  String get labelMinSize => 'Min hajmi';

  @override
  String get labelMaxSize => 'Maks hajmi';

  @override
  String get labelRange => 'Diapazon';

  @override
  String get labelOverboughtLine => 'Haddan tashqari sotib olingan chiziq';

  @override
  String get labelOversoldLine => 'Haddan tashqari sotilgan chiziq';

  @override
  String get labelMACDLine => 'MACD liniyasi';

  @override
  String get labelFastMAPeriod => 'Tez MA davri';

  @override
  String get labelSlowMAPeriod => 'Sekin MA davri';

  @override
  String get labelSignalLine => 'Signal liniyasi';

  @override
  String get labelSignalPeriod => 'Signal davri';

  @override
  String get labelIncreasingBar => 'Kattalashtirish paneli';

  @override
  String get labelDecreasingBar => 'Pasayadigan bar';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands top';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands mediana';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bands bottom';

  @override
  String get labelChannelFill => 'Kanalni to\'ldirish';

  @override
  String get labelFillColor => 'Rangni to\'ldirish';

  @override
  String get labelStandardDeviations => 'Standart og\'ishlar';

  @override
  String get labelMovingAverageType => 'Harakatlanuvchi O\'rtacha Turi';

  @override
  String get labelMALine => 'MA liniyasi';

  @override
  String get labelOffset => 'Ofset';

  @override
  String get labelType => 'Turi';

  @override
  String get labelSimple => 'Oddiy';

  @override
  String get labelExponential => 'Eksponensial';

  @override
  String get labelWeighted => 'Og\'irlangan';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => 'Nol Kechikish';

  @override
  String get labelTimeSeries => 'Vaqt Seriyasi';

  @override
  String get labelWellesWilder => 'Uells Uaylder';

  @override
  String get labelVariable => 'O\'zgaruvchan';

  @override
  String get labelTriangular => 'Uchburchak';

  @override
  String get label2Exponential => '2-Eksponensial';

  @override
  String get label3Exponential => '3-Eksponensial';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return '$min va $max oralig\'idagi qiymatni kiriting';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return '$min - $max diapazoni';
  }

  @override
  String get labelDrawingTools => 'Chizma vositalari';

  @override
  String get labelTools => 'Asboblar';

  @override
  String get labelLine => 'Chiziq';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Birinchi nuqtani belgilash uchun bosing';

  @override
  String get informTapToSetFinalPoint => 'Oxirgi nuqtani belgilash uchun bosing';

  @override
  String get informNoActiveDrawingTools => 'Faol chizish vositalari yo\'q.';

  @override
  String get actionAddDrawingTool => 'Chizma vositasini qo\'shish';

  @override
  String get labelOf => 'ning';

  @override
  String get labelDeleteAllDrawingTools => 'Barcha chizish vositalarini o\'chirish';

  @override
  String get informDeleteAllDrawingTools => 'Bu barcha faol chizish vositalarini o\'chirib tashlaydi.';
}
