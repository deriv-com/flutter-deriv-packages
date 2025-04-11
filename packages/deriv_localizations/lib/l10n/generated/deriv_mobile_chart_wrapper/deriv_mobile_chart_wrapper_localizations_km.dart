import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Khmer Central Khmer (`km`).
class DerivMobileChartWrapperLocalizationsKm
    extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsKm([String locale = 'km'])
      : super(locale);

  @override
  String get labelIndicators => 'សូចនាករ';

  @override
  String get labelActive => 'សក្តិសម';

  @override
  String get labelAll => 'ទាំងអស់';

  @override
  String get labelMomentum => 'សន្ទុះ';

  @override
  String get labelVolatility => 'ប្រែប្រួល';

  @override
  String get labelMovingAverages => 'មធ្យមភាគចល័ត';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'សន្ទស្សន៍កម្លាំងទាក់ទង (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'ក្រុមតន្រ្តី Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'មធ្យមភាគចល័ត (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD =>
      'MACD គឺជាសូចនាករជួញដូរដែលត្រូវបានប្រើក្នុងការវិភាគបច្ចេកទេសនៃតម្លៃភាគហ៊ុន។ វាត្រូវបានគេសន្មត់ថាដើម្បីបង្ហាញពីការផ្លាស់ប្តូរកម្លាំង ទិសដៅ សន្ទុះ និងរយៈពេលនៃនិន្នាការក្នុងតម្លៃភាគហ៊ុន។';

  @override
  String get infoRSI =>
      'សន្ទស្សន៍កម្លាំងទាក់ទង (RSI) ត្រូវបានបោះពុម្ពផ្សាយដោយ J. Welles Wilder ។ តម្លៃបច្ចុប្បន្នត្រូវបានធ្វើឱ្យមានលក្ខណៈធម្មតាជាភាគរយរវាង 0 និង 100 ។ flutter_chart_id នៃលំយោលនេះគឺជាការបំភាន់ពីព្រោះវាមិនប្រៀបធៀបឧបករណ៍ទាក់ទងទៅនឹងឧបករណ៍ផ្សេងទៀត ឬសំណុំនៃឧបករណ៍នោះទេ ប៉ុន្តែផ្ទុយទៅវិញតំណាងឱ្យតម្លៃបច្ចុប្បន្នទាក់ទងទៅនឹងបំណែកថ្មីៗផ្សេងទៀតនៅក្នុងប្រវែងបង្អួចមើលត្រឡប់មកវិញដែលបានជ្រើសរើស។';

  @override
  String get infoBB =>
      'ក្រុមតន្រ្តី Bollinger (BB) អាចត្រូវបានប្រើដើម្បីវាស់ស្ទង់កម្ពស់ ឬកម្រិតទាបនៃតម្លៃទាក់ទងទៅនឹងការជួញដូរពីមុន។';

  @override
  String get infoMA =>
      'មធ្យមភាគចល័ត (MA) ជួយកំណត់អត្តសញ្ញាណនិន្នាការទីផ្សារទូទៅដោយការច្រោះការប្រងប្រួលតម្លៃរយៈពេលខ្លី។ ដោយប្រើទិន្នន័យប្រវត្តិសាស្ត្រ វាគណនាតម្លៃជាមធ្យមក្នុងរយៈពេលជាក់លាក់មួយ ហើយគូសបន្ទាត់នៅលើតារាង។ ប្រសិនបើបន្ទាត់ MA ផ្លាស់ទីឡើងលើ វាជាសូចនាករនៃនិន្នាការឡើងលើ និន្នាការធ្លាក់ចុះ ប្រសិនបើវាផ្លាស់ទីចុះក្រោម។ សញ្ញាទិញកើតឡើងនៅពេលដែលតម្លៃផ្លាស់ទីខ្ពស់ជាងបន្ទាត់ MA ។';

  @override
  String get infoMaximumActiveIndicatorsAdded =>
      'អ្នកបានបន្ថែមចំនួនអតិបរមានៃសូចនាករសកម្ម។';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'បន្ថែម $indicator';
  }

  @override
  String get infoAddIndicator => 'បន្ថែមសូចនាករ';

  @override
  String get labelDeleteAllIndicators => 'លុបសូចនាករទាំងអស់។';

  @override
  String get infoDeleteAllIndicators => 'នេះនឹងលុបសូចនាករសកម្មទាំងអស់។';

  @override
  String infoResetIndicators(Object indicator) {
    return 'នេះនឹងកំណត់សូចនាករ $indicator ឡើងវិញទៅការកំណត់លំនាំដើមរបស់វា។';
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
  String get infoDeleteIndicator => 'តើអ្នកពិតជាចង់លុបសូចនាករនេះមែនទេ?';

  @override
  String get labelCancel => 'បោះបង់';

  @override
  String get labelDelete => 'លុប';

  @override
  String get labelDeleteAll => 'លុបទាំងអស់';

  @override
  String get infoUpto3indicatorsAllowed =>
      'អនុញ្ញាតឱ្យមានសូចនាករសកម្មរហូតដល់ 3 ។';

  @override
  String get infoNoActiveIndicators => 'មគ្គុទ្ទេសក៍សកម្មទេ។';

  @override
  String get labelReset => 'កំណត់ឡើងវិញ';

  @override
  String get labelApply => 'ដាក់ពាក្យ';

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
  String get labelClose => 'បិទ';

  @override
  String get labelOpen => 'បើក';

  @override
  String get labelHigh => 'ខ្ពស់';

  @override
  String get labelLow => 'ទាប';

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
  String get labelOverboughtLine => 'បន្ទាត់ទិញលើស';

  @override
  String get labelOversoldLine => 'បន្ទាត់លក់លើស';

  @override
  String get labelMACDLine => 'បន្ទាត់ MACD';

  @override
  String get labelFastMAPeriod => 'រយៈពេល MA លឿន';

  @override
  String get labelSlowMAPeriod => 'រយៈពេល MA យឺត';

  @override
  String get labelSignalLine => 'បន្ទាត់សញ្ញា';

  @override
  String get labelSignalPeriod => 'រយៈពេលសញ្ញា';

  @override
  String get labelIncreasingBar => 'បារកើនឡើង';

  @override
  String get labelDecreasingBar => 'បារថយចុះ';

  @override
  String get labelBollingerBandsTop => 'កំពូលក្រុមតន្រ្តី Bollinger';

  @override
  String get labelBollingerBandsMedian => 'មធ្យមក្រុមតន្រ្តី Bollinger';

  @override
  String get labelBollingerBandsBottom => 'បាតក្រុមតន្រ្តី Bollinger';

  @override
  String get labelChannelFill => 'បំពេញឆានែល';

  @override
  String get labelFillColor => 'បំពេញពណ៌';

  @override
  String get labelStandardDeviations => 'គម្លាតស្តង់ដារ';

  @override
  String get labelMovingAverageType => 'ប្រភេទមធ្យមភាគចល័ត';

  @override
  String get labelMALine => 'បន្ទាត់ MA';

  @override
  String get labelOffset => 'ផ្លាស់ទី';

  @override
  String get labelType => 'ប្រភេទ';

  @override
  String get labelSimple => 'សាមញ្ញ';

  @override
  String get labelExponential => 'អិចស្ប៉ូណង់ស្យែល';

  @override
  String get labelWeighted => 'ទម្ងន់';

  @override
  String get labelHull => 'ស្រោមសំបុត្រ';

  @override
  String get labelZeroLag => 'យឺតសូន្យ';

  @override
  String get labelTimeSeries => 'ស៊េរីពេលវេលា';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'អថេរ';

  @override
  String get labelTriangular => 'ត្រីកោណ';

  @override
  String get label2Exponential => 'អិចស្ប៉ូណង់ស្យែល 2';

  @override
  String get label3Exponential => 'អិចស្ប៉ូណង់ស្យែល 3';

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
  String get informNoActiveDrawingTools => 'មិនមានឧបករណ៍គូរសកម្មទេ។';

  @override
  String get actionAddDrawingTool => 'បន្ថែមឧបករណ៍គូរ';

  @override
  String get labelOf => 'នៃ';

  @override
  String get labelDeleteAllDrawingTools => 'លុបឧបករណ៍គូរទាំងអស់។';

  @override
  String get informDeleteAllDrawingTools => 'នេះនឹងលុបឧបករណ៍គូរសកម្មទាំងអស់។';
}
