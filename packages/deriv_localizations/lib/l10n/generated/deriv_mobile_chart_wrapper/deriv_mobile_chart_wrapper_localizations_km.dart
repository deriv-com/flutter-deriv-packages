import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Khmer Central Khmer (`km`).
class DerivMobileChartWrapperLocalizationsKm extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsKm([String locale = 'km']) : super(locale);

  @override
  String get labelIndicators => 'សូចនាករ';

  @override
  String get labelActive => 'ដំណើរការ';

  @override
  String get labelAll => 'ទាំងអស់';

  @override
  String get labelMomentum => 'សន្ទុះ';

  @override
  String get labelVolatility => 'ភាពប្រែប្រួល';

  @override
  String get labelMovingAverages => 'តម្តៃការផ្លាស់ប្តូរមធ្យម';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'សន្ទស្សន៍កម្លាំងដែលទាក់ទង (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bands (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'តម្លៃមធ្យមផ្លាស់ទី (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD គឺជាសូចនាករជួញដូរដែលប្រើក្នុងការវិភាគបច្ចេកទេសនៃតម្លៃភាគហ៊ុន។ វាត្រូវបានសន្មត់ថាបង្ហាញពីការផ្លាស់ប្តូរនៅក្នុងកម្លាំង ទិសដៅ សន្ទុះ និងរយៈពេលនៃនិន្នាការតម្លៃភាគហ៊ុន។';

  @override
  String get infoRSI => 'សន្ទស្សន៍កម្លាំងដែលទាក់ទងឬ Relative Strength Index (RSI) ត្រូវបានបោះពុម្ពដោយ J. Welles Wilder។ តម្លៃបច្ចុប្បន្នត្រូវបានធ្វើឱ្យធម្មតាជាភាគរយចន្លោះពី 0 និង 100។ តម្លៃ flutter_chart_id នៃសូចនាករនេះអាចមានការយល់ច្រឡំព្រោះវាមិនប្រៀបធៀបឧបករណ៍ដែលទាក់ទងទៅនឹងឧបករណ៍ផ្សេងទៀត ឬសំណុំនៃឧបករណ៍នោះទេ ប៉ុន្តែបង្ហាញតម្លៃបច្ចុប្បន្នប្រៀបធៀបនឹងតម្លៃចុងក្រោយក្នុងអំឡុងពេលដែលបានជ្រើសរើសនៃការមើលត្រឡប់មកវិញ។';

  @override
  String get infoBB => 'Bollinger Bands (BB) អាច​ត្រូវ​បាន​ប្រើ​ដើម្បី​វាស់​ស្ទង់​ភាព​ខ្ពស់​ឬ​ទាប​នៃ​តម្លៃ​ទាក់ទង​នឹង​ការ​ជួញដូរ​មុនៗ។';

  @override
  String get infoMA => 'Moving Average (MA) ជួយកំណត់និន្នាការទីផ្សារទាំងមូលដោយត្រងចេញនូវការប្រែប្រួលតម្លៃរយៈពេលខ្លី។ ដោយប្រើទិន្នន័យប្រវត្តិសាស្ត្រ វាគណនាតម្លៃមធ្យមក្នុងរយៈពេលជាក់លាក់មួយ ហើយបង្ហាញជាបន្ទាត់នៅលើគំនូសតាង។ ប្រសិនបើបន្ទាត់ MA ផ្លាស់ទីឡើងលើ វាគឺជាសូចនាករនៃទិសដៅកើនឡើង ប្រសិនបើផ្លាស់ទីចុះក្រោមវាបង្ហាញទិសដៅធ្លាក់ចុះ។ សញ្ញាការទិញកើតឡើងនៅពេលតម្លៃផ្លាស់ទីនៅខាងលើបន្ទាត់ MA ។';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'អ្នកបានបន្ថែមសូចនាករសកម្មដល់ចំនួនអតិបរមាហើយ។';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'បន្ថែម $indicator';
  }

  @override
  String get infoAddIndicator => 'បន្ថែមសូចនាករ';

  @override
  String get labelDeleteAllIndicators => 'លុបសូចនាករទាំងអស់';

  @override
  String get infoDeleteAllIndicators => 'វានឹងលុបសូចនាករសកម្មទាំងអស់។';

  @override
  String infoResetIndicators(Object indicator) {
    return 'វានឹងកំណត់សូចនាករ $indicator ឡើងវិញទៅតាមការកំណត់លំនាំដើមរបស់វា។';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'លុបសូចនាករ $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'កំណត់សូចនាករ $indicator ឡើងវិញ';
  }

  @override
  String get infoDeleteIndicator => 'តើអ្នកប្រាកដថាចង់លុបសូចនាករនេះមែនទេ?';

  @override
  String get labelCancel => 'បោះបង់';

  @override
  String get labelDelete => 'លុប';

  @override
  String get labelDeleteAll => 'លុបទាំងអស់';

  @override
  String get infoUpto3indicatorsAllowed => 'អនុញ្ញាតឲ្យប្រើសូចនាករដែលដំណើរការបានហូតដល់ 3។';

  @override
  String get infoNoActiveIndicators => 'មិនមានសូចនាករដែលដំណើរការទេ។';

  @override
  String get labelReset => 'កំណត់ឡើងវិញ';

  @override
  String get labelApply => 'ប្រើប្រាស់';

  @override
  String get labelOK => 'យល់ព្រម';

  @override
  String get labelRSILine => 'បន្ទាត់ RSI';

  @override
  String get labelPeriod => 'រយៈពេល';

  @override
  String get labelMinRange => 'ចន្លោះអប្បបរមា';

  @override
  String get labelMaxRange => 'ចន្លោះអតិបរមា';

  @override
  String get labelSource => 'ប្រភព';

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
  String get labelShowZones => 'បង្ហាញតំបន់';

  @override
  String get labelOverbought => 'ទិញលើស';

  @override
  String get labelOversold => 'លក់លើស';

  @override
  String get labelMinSize => 'ទំហំអប្បបរមា';

  @override
  String get labelMaxSize => 'ទំហំអតិបរមា';

  @override
  String get labelRange => 'ចន្លោះ';

  @override
  String get labelOverboughtLine => 'បន្ទាត់ការទិញលើស';

  @override
  String get labelOversoldLine => 'បន្ទាត់ការលក់លើស';

  @override
  String get labelMACDLine => 'បន្ទាត់ MACD';

  @override
  String get labelFastMAPeriod => 'រយៈពេល MA ដែលលឿន';

  @override
  String get labelSlowMAPeriod => 'រយៈពេល MA ដែលយឺត';

  @override
  String get labelSignalLine => 'បន្ទាត់សញ្ញា';

  @override
  String get labelSignalPeriod => 'រយៈពេលនៃសញ្ញា';

  @override
  String get labelIncreasingBar => 'របារដែលកើនឡើង';

  @override
  String get labelDecreasingBar => 'បារដែលថយចុះ';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands ខាងលើ';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands មធ្យម';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bands ខាងក្រោម';

  @override
  String get labelChannelFill => 'ការបំពេញឆានែល';

  @override
  String get labelFillColor => 'បំពេញពណ៌';

  @override
  String get labelStandardDeviations => 'គម្លាតស្តង់ដារ';

  @override
  String get labelMovingAverageType => 'ប្រភេទតម្លៃមធ្យមផ្លាស់ទី';

  @override
  String get labelMALine => 'បន្ទាត់ MA';

  @override
  String get labelOffset => 'អុហ្វសិត';

  @override
  String get labelType => 'ប្រភេទ';

  @override
  String get labelSimple => 'សាមញ្ញ';

  @override
  String get labelExponential => 'អិចស្ប៉ូណង់ស្យែល';

  @override
  String get labelWeighted => 'Weighted';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => 'Zero Lag';

  @override
  String get labelTimeSeries => 'សំណុំទិន្នន័យតាមលំដាប់ពេលវេលា';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'អថេរ';

  @override
  String get labelTriangular => 'រាងត្រីកោណ';

  @override
  String get label2Exponential => '2-អិចស្ប៉ូណង់ស្យែល';

  @override
  String get label3Exponential => '3-អិចស្ប៉ូណង់ស្យែល';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'បញ្ចូលតម្លៃរវាង $min និង $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'ចន្លោះ $min - $max';
  }

  @override
  String get labelDrawingTools => 'ឧបករណ៍គូរ';

  @override
  String get labelTools => 'ឧបករណ៍';

  @override
  String get labelLine => 'បន្ទាត់';

  @override
  String get labelRay => 'កាំរស្មី';

  @override
  String get informTapToSetFirstPoint => 'ប៉ះដើម្បីកំណត់ចំណុចដំបូង';

  @override
  String get informTapToSetFinalPoint => 'ប៉ះដើម្បីកំណត់ចំណុចចុងក្រោយ';

  @override
  String get informNoActiveDrawingTools => 'មិនមានឧបករណ៍គំនូរដែលប្រើប្រាស់ទេ។';

  @override
  String get actionAddDrawingTool => 'បន្ថែមឧបករណ៍គូរ';

  @override
  String get labelOf => 'នៃ';

  @override
  String get labelDeleteAllDrawingTools => 'លុបឧបករណ៍គូរទាំងអស់';

  @override
  String get informDeleteAllDrawingTools => 'វានឹងលុបឧបករណ៍គំនូរដែលប្រើប្រាស់ទាំងអស់។';
}
