import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Arabic (`ar`).
class DerivMobileChartWrapperLocalizationsAr extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get labelIndicators => 'المؤشرات';

  @override
  String get labelActive => 'نشط';

  @override
  String get labelAll => 'الكل';

  @override
  String get labelMomentum => 'الزخم';

  @override
  String get labelVolatility => 'التقلبات';

  @override
  String get labelMovingAverages => 'المتوسطات المتحركة';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'مؤشر القوة النسبية (RSI)';

  @override
  String get labelRSI => 'مؤشر القوة النسبية';

  @override
  String get labelBollingerBands => 'البولنجر باند (BB)';

  @override
  String get labelBB => 'ب ب';

  @override
  String get labelMovingAverage => 'المتوسط المتحرك (MA)';

  @override
  String get labelMA => 'ماجستير';

  @override
  String get infoMACD => 'مؤشر MACD هو مؤشر تداول يستخدم في التحليل الفني لأسعار الأسهم. ومن المفترض أن يكشف عن التغيرات في قوة واتجاه وزخم ومدة الاتجاه في سعر السهم.';

  @override
  String get infoRSI => 'تم نشر مؤشر القوة النسبية (RSI) بواسطة J. Welles Wilder. يتم تطبيع السعر الحالي كنسبة مئوية بين 0 و 100. إن معرف flutter_chart_id لهذا المذبذب مضلل لأنه لا يقارن الأداة بالنسبة إلى أداة أخرى أو مجموعة من الأدوات، بل يمثل السعر الحالي بالنسبة إلى القطع الحديثة الأخرى ضمن طول نافذة الاسترجاع المحددة.';

  @override
  String get infoBB => 'يمكن استخدام مؤشر بولينجر باند (BB) لقياس مدى ارتفاع أو انخفاض السعر بالنسبة للصفقات السابقة.';

  @override
  String get infoMA => 'يساعد المتوسط المتحرك (MA) على تحديد الاتجاه العام للسوق من خلال تصفية تقلبات الأسعار على المدى القصير. وباستخدام البيانات التاريخية، يحسب المتوسط المتحرك متوسط السعر خلال فترة محددة ويرسم خطًا على الرسم البياني. إذا تحرك خط المتوسط المتحرك المتحرك لأعلى، فهذا مؤشر على وجود اتجاه صعودي، ويكون مؤشرًا على اتجاه هبوطي إذا تحرك لأسفل. وتحدث إشارة الشراء عندما يتحرك السعر فوق خط المتوسط المتحرك.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'لقد أضفت الحد الأقصى لعدد المؤشرات النشطة.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'إضافة $indicator';
  }

  @override
  String get infoAddIndicator => 'إضافة مؤشر';

  @override
  String get labelDeleteAllIndicators => 'حذف جميع المؤشرات';

  @override
  String get infoDeleteAllIndicators => 'سيؤدي ذلك إلى حذف جميع المؤشرات النشطة.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'حذف المؤشر $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'هل أنت متأكد من رغبتك في حذف هذا المؤشر؟';

  @override
  String get labelCancel => 'إلغاء';

  @override
  String get labelDelete => 'حذف';

  @override
  String get labelDeleteAll => 'حذف الكل';

  @override
  String get infoUpto3indicatorsAllowed => 'يُسمح بحد أقصى 3 مؤشرات نشطة.';

  @override
  String get infoNoActiveIndicators => 'لا توجد مؤشرات نشطة.';

  @override
  String get labelReset => 'إعادة تعيين';

  @override
  String get labelApply => 'قدم طلبك';

  @override
  String get labelOK => 'حسناً';

  @override
  String get labelRSILine => 'خط مؤشر القوة النسبية RSI';

  @override
  String get labelPeriod => 'الفترة';

  @override
  String get labelMinRange => 'الحد الأدنى للنطاق';

  @override
  String get labelMaxRange => 'الحد الأقصى للنطاق';

  @override
  String get labelSource => 'المصدر';

  @override
  String get labelClose => 'إغلاق';

  @override
  String get labelOpen => 'افتح';

  @override
  String get labelHigh => 'عالية';

  @override
  String get labelLow => 'منخفضة';

  @override
  String get labelHl2 => 'هـ / 2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'أولك/4';

  @override
  String get labelShowZones => 'مناطق العرض';

  @override
  String get labelOverbought => 'الإفراط في الشراء';

  @override
  String get labelOversold => 'المبالغة في البيع';

  @override
  String get labelMinSize => 'الحد الأدنى للحجم';

  @override
  String get labelMaxSize => 'الحد الأقصى للحجم';

  @override
  String get labelRange => 'النطاق';

  @override
  String get labelOverboughtLine => 'خط ذروة الشراء';

  @override
  String get labelOversoldLine => 'خط المبيع الزائد';

  @override
  String get labelMACDLine => 'خط MACD';

  @override
  String get labelFastMAPeriod => 'فترة المتوسط المتحرك السريع';

  @override
  String get labelSlowMAPeriod => 'فترة بطء المتوسط المتحرك البطيء';

  @override
  String get labelSignalLine => 'خط الإشارة';

  @override
  String get labelSignalPeriod => 'فترة الإشارة';

  @override
  String get labelIncreasingBar => 'زيادة الشريط';

  @override
  String get labelDecreasingBar => 'شريط تنازلي';

  @override
  String get labelBollingerBandsTop => 'قمة بولينجر باندز';

  @override
  String get labelBollingerBandsMedian => 'متوسط بولينجر باندز';

  @override
  String get labelBollingerBandsBottom => 'قاع بولينجر باندز';

  @override
  String get labelChannelFill => 'تعبئة القناة';

  @override
  String get labelFillColor => 'لون التعبئة';

  @override
  String get labelStandardDeviations => 'الانحرافات المعيارية';

  @override
  String get labelMovingAverageType => 'نوع المتوسط المتحرك';

  @override
  String get labelMALine => 'خط MA';

  @override
  String get labelOffset => 'الأوفست';

  @override
  String get labelType => 'النوع';

  @override
  String get labelSimple => 'بسيطة';

  @override
  String get labelExponential => 'الأسي';

  @override
  String get labelWeighted => 'مرجح';

  @override
  String get labelHull => 'هال';

  @override
  String get labelZeroLag => 'التأخر الصفري';

  @override
  String get labelTimeSeries => 'السلاسل الزمنية';

  @override
  String get labelWellesWilder => 'ويلز وايلدر';

  @override
  String get labelVariable => 'متغير';

  @override
  String get labelTriangular => 'مثلث الشكل';

  @override
  String get label2Exponential => '2-الأسي';

  @override
  String get label3Exponential => '3-الإكسبونسي';

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
