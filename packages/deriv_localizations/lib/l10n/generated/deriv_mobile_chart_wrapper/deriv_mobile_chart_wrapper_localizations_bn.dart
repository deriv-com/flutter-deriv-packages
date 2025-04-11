import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class DerivMobileChartWrapperLocalizationsBn extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get labelIndicators => 'সূচক';

  @override
  String get labelActive => 'সক্রিয়';

  @override
  String get labelAll => 'সব';

  @override
  String get labelMomentum => 'মোমেন্টাম';

  @override
  String get labelVolatility => 'অস্থিরতা';

  @override
  String get labelMovingAverages => 'মুভিং গড়';

  @override
  String get labelMACD => 'ম্যাকডি';

  @override
  String get labelRelativeStrengthIndex => 'আপেক্ষিক শক্তি সূচক (আরএসআই)';

  @override
  String get labelRSI => 'আরএসআই';

  @override
  String get labelBollingerBands => 'বোলিঙ্গার ব্যান্ড (বিবি)';

  @override
  String get labelBB => 'বিবি';

  @override
  String get labelMovingAverage => 'মুভিং এভারেজ (এমএ)';

  @override
  String get labelMA => 'মা';

  @override
  String get infoMACD => 'এমএসিডি স্টকের দামের প্রযুক্তিগত বিশ্লেষণে ব্যবহৃত একটি ট্রেডিং সূচক। এটি কোনও স্টকের দামের প্রবণতার শক্তি, দিক, গতি এবং সময়কালের পরিবর্তনগুলি প্রকাশ করবে বলে মনে করা হয়।';

  @override
  String get infoRSI => 'আপেক্ষিক শক্তি সূচক (আরএসআই) প্রকাশ করেছিলেন জে ওয়েলস ওয়াইল্ডার। বর্তমান মূল্য 0 থেকে 100 এর মধ্যে শতাংশ হিসাবে স্বাভাবিক করা হয়। এই অসিলেটরের ফ্লুটার_চার্ট_আইডি বিভ্রান্তিকর কারণ এটি অন্য যন্ত্র বা যন্ত্রের সেটের সাথে তুলনা করে না, বরং নির্বাচিত লুকব্যাক উইন্ডো দৈর্ঘ্যের মধ্যে অন্যান্য সাম্প্রতিক টুকরোগুলির তুলনায় বর্তমান দামের প্রতিনিধিত্ব করে।';

  @override
  String get infoBB => 'পূর্ববর্তী ট্রেডগুলির তুলনায় মূল্যের উচ্চতা বা নিম্নতা পরিমাপ করতে বোলিঙ্গার ব্যান্ড (বিবি) ব্যবহার করা যেতে পারে।';

  @override
  String get infoMA => 'মুভিং এভারেজ (এমএ) স্বল্পমেয়াদী মূল্যের ওঠানামা ফিল্টার করে সামগ্রিক বাজারের প্রবণতা সনাক্ত করতে ঐতিহাসিক ডেটা ব্যবহার করে, এটি একটি নির্দিষ্ট সময়কালে গড় মূল্য গণনা করে এবং চার্টে একটি লাইন প্লট করে। এমএ লাইন যদি উপরের দিকে চলে যায় তবে এটি একটি আপট্রেন্ডের সূচক, নীচের দিকে চলে গেলে একটি ডাউনট্রেন্ড। মূল্য এমএ লাইনের উপরে চলে গেলে একটি ক্রয় সংকেত ঘটে।';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'আপনি সর্বাধিক সংখ্যক সক্রিয় সূচক যুক্ত করেছেন।';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'যোগ করুন $indicator';
  }

  @override
  String get infoAddIndicator => 'সূচক যোগ করুন';

  @override
  String get labelDeleteAllIndicators => 'সমস্ত সূচক মুছুন';

  @override
  String get infoDeleteAllIndicators => 'এটি সমস্ত সক্রিয় সূচক মুছে ফেলবে।';

  @override
  String infoResetIndicators(Object indicator) {
    return 'এটি $indicator সূচকটিকে তার ডিফল্ট সেটিংসে পুনরায় সেট করবে।';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '$indicator সূচক মুছুন';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'রিসেট $indicator সূচক';
  }

  @override
  String get infoDeleteIndicator => 'আপনি কি নিশ্চিত যে আপনি এই সূচকটি মুছে ফেলতে চান?';

  @override
  String get labelCancel => 'বাতিল করুন';

  @override
  String get labelDelete => 'মুছে ফেলুন';

  @override
  String get labelDeleteAll => 'সব মুছে ফেলুন';

  @override
  String get infoUpto3indicatorsAllowed => '3 টি পর্যন্ত সক্রিয় সূচক অনুমোদিত।';

  @override
  String get infoNoActiveIndicators => 'কোন সক্রিয় সূচক নেই।';

  @override
  String get labelReset => 'রিসেট করুন';

  @override
  String get labelApply => 'আবেদন করুন';

  @override
  String get labelOK => 'ঠিক আছে';

  @override
  String get labelRSILine => 'আরএসআই লাইন';

  @override
  String get labelPeriod => 'সময়কাল';

  @override
  String get labelMinRange => 'নিম্ন পরিসীমা';

  @override
  String get labelMaxRange => 'সর্বোচ্চ ব্যাপ্তি';

  @override
  String get labelSource => 'উৎস';

  @override
  String get labelClose => 'বন্ধ করুন';

  @override
  String get labelOpen => 'খোলা';

  @override
  String get labelHigh => 'উচ্চ';

  @override
  String get labelLow => 'নিম্ন';

  @override
  String get labelHl2 => 'এইচএল/2';

  @override
  String get labelHlc3 => 'এইচএলসি/3';

  @override
  String get labelHlcc4 => 'এইচএলসিসি/4';

  @override
  String get labelOhlc4 => 'ওএইচএলসি/4';

  @override
  String get labelShowZones => 'অঞ্চল দেখান';

  @override
  String get labelOverbought => 'অতিরিক্ত খরচ';

  @override
  String get labelOversold => 'অতিরিক্ত বিক্রি';

  @override
  String get labelMinSize => 'ন্যূনতম আকার';

  @override
  String get labelMaxSize => 'সর্বোচ্চ আকার';

  @override
  String get labelRange => 'পরিসীমা';

  @override
  String get labelOverboughtLine => 'ওভারবাউট লাইন';

  @override
  String get labelOversoldLine => 'ওভারসোল্ড লাইন';

  @override
  String get labelMACDLine => 'এমএসিডি লাইন';

  @override
  String get labelFastMAPeriod => 'দ্রুত এমএ পিরিয়ড';

  @override
  String get labelSlowMAPeriod => 'ধীর এমএ পিরিয়ড';

  @override
  String get labelSignalLine => 'সিগন্যাল লাইন';

  @override
  String get labelSignalPeriod => 'সংকেত সময়কাল';

  @override
  String get labelIncreasingBar => 'বর্ধমান বার';

  @override
  String get labelDecreasingBar => 'হ্রাস করা বার';

  @override
  String get labelBollingerBandsTop => 'বোলিংগার ব্যান্ড শীর্ষ';

  @override
  String get labelBollingerBandsMedian => 'বোলিঙ্গার ব্যান্ডের মাঝারি';

  @override
  String get labelBollingerBandsBottom => 'বোলিঙ্গার ব্যান্ড নীচে';

  @override
  String get labelChannelFill => 'চ্যানেল পূরণ';

  @override
  String get labelFillColor => 'রঙ পূরণ করুন';

  @override
  String get labelStandardDeviations => 'মান বিচ্যুতি';

  @override
  String get labelMovingAverageType => 'মুভিং এভারেজ প্রকার';

  @override
  String get labelMALine => 'এমএ লাইন';

  @override
  String get labelOffset => 'অফসেট';

  @override
  String get labelType => 'টাইপ';

  @override
  String get labelSimple => 'সহজ';

  @override
  String get labelExponential => 'এক্সপোনেন্সিয়াল';

  @override
  String get labelWeighted => 'ওজনযুক্ত';

  @override
  String get labelHull => 'হাল';

  @override
  String get labelZeroLag => 'জিরো ল্যাগ';

  @override
  String get labelTimeSeries => 'টাইম সিরিজ';

  @override
  String get labelWellesWilder => 'ওয়েলস ওয়াইল্ডার';

  @override
  String get labelVariable => 'পরিবর্তনশীল';

  @override
  String get labelTriangular => 'ত্রিভুজ';

  @override
  String get label2Exponential => '2-এক্সপোনেন্সিয়াল';

  @override
  String get label3Exponential => '3-এক্সপোনেন্সিয়াল';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return '$min এবং $maxএর মধ্যে একটি মান লিখুন';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'রেঞ্জ $min - $max';
  }

  @override
  String get labelDrawingTools => 'অঙ্কন টুলস';

  @override
  String get labelTools => 'সরঞ্জাম';

  @override
  String get labelLine => 'লাইন';

  @override
  String get labelRay => 'রশ্মি';

  @override
  String get informTapToSetFirstPoint => 'প্রথম পয়েন্ট সেট করতে আলতো চাপুন';

  @override
  String get informTapToSetFinalPoint => 'চূড়ান্ত পয়েন্ট সেট করতে ট্যাপ করুন';

  @override
  String get informNoActiveDrawingTools => 'সক্রিয় অঙ্কন সরঞ্জাম নেই।';

  @override
  String get actionAddDrawingTool => 'অঙ্কন টুল যোগ করুন';

  @override
  String get labelOf => 'এর';

  @override
  String get labelDeleteAllDrawingTools => 'সমস্ত অঙ্কন সরঞ্জাম মুছে';

  @override
  String get informDeleteAllDrawingTools => 'এটি সমস্ত সক্রিয় অঙ্কন সরঞ্জাম মুছে ফেলবে।';
}
