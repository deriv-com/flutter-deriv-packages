import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'deriv_mobile_chart_wrapper_localizations_ar.dart';
import 'deriv_mobile_chart_wrapper_localizations_bn.dart';
import 'deriv_mobile_chart_wrapper_localizations_de.dart';
import 'deriv_mobile_chart_wrapper_localizations_en.dart';
import 'deriv_mobile_chart_wrapper_localizations_es.dart';
import 'deriv_mobile_chart_wrapper_localizations_fr.dart';
import 'deriv_mobile_chart_wrapper_localizations_it.dart';
import 'deriv_mobile_chart_wrapper_localizations_km.dart';
import 'deriv_mobile_chart_wrapper_localizations_ko.dart';
import 'deriv_mobile_chart_wrapper_localizations_mn.dart';
import 'deriv_mobile_chart_wrapper_localizations_pl.dart';
import 'deriv_mobile_chart_wrapper_localizations_pt.dart';
import 'deriv_mobile_chart_wrapper_localizations_ru.dart';
import 'deriv_mobile_chart_wrapper_localizations_si.dart';
import 'deriv_mobile_chart_wrapper_localizations_sw.dart';
import 'deriv_mobile_chart_wrapper_localizations_th.dart';
import 'deriv_mobile_chart_wrapper_localizations_tr.dart';
import 'deriv_mobile_chart_wrapper_localizations_uz.dart';
import 'deriv_mobile_chart_wrapper_localizations_vi.dart';
import 'deriv_mobile_chart_wrapper_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of DerivMobileChartWrapperLocalizations
/// returned by `DerivMobileChartWrapperLocalizations.of(context)`.
///
/// Applications need to include `DerivMobileChartWrapperLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DerivMobileChartWrapperLocalizations.localizationsDelegates,
///   supportedLocales: DerivMobileChartWrapperLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DerivMobileChartWrapperLocalizations.supportedLocales
/// property.
abstract class DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DerivMobileChartWrapperLocalizations? of(BuildContext context) {
    return Localizations.of<DerivMobileChartWrapperLocalizations>(context, DerivMobileChartWrapperLocalizations);
  }

  static const LocalizationsDelegate<DerivMobileChartWrapperLocalizations> delegate = _DerivMobileChartWrapperLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('km'),
    Locale('ko'),
    Locale('mn'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('si'),
    Locale('sw'),
    Locale('th'),
    Locale('tr'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh', 'CN'),
    Locale('zh', 'TW'),
    Locale('zh')
  ];

  /// No description provided for @labelIndicators.
  ///
  /// In en, this message translates to:
  /// **'Indicators'**
  String get labelIndicators;

  /// No description provided for @labelActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get labelActive;

  /// No description provided for @labelAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get labelAll;

  /// No description provided for @labelMomentum.
  ///
  /// In en, this message translates to:
  /// **'Momentum'**
  String get labelMomentum;

  /// No description provided for @labelVolatility.
  ///
  /// In en, this message translates to:
  /// **'Volatility'**
  String get labelVolatility;

  /// No description provided for @labelMovingAverages.
  ///
  /// In en, this message translates to:
  /// **'Moving averages'**
  String get labelMovingAverages;

  /// No description provided for @labelMACD.
  ///
  /// In en, this message translates to:
  /// **'MACD'**
  String get labelMACD;

  /// No description provided for @labelRelativeStrengthIndex.
  ///
  /// In en, this message translates to:
  /// **'Relative Strength Index (RSI)'**
  String get labelRelativeStrengthIndex;

  /// No description provided for @labelRSI.
  ///
  /// In en, this message translates to:
  /// **'RSI'**
  String get labelRSI;

  /// No description provided for @labelBollingerBands.
  ///
  /// In en, this message translates to:
  /// **'Bollinger Bands (BB)'**
  String get labelBollingerBands;

  /// No description provided for @labelBB.
  ///
  /// In en, this message translates to:
  /// **'BB'**
  String get labelBB;

  /// No description provided for @labelMovingAverage.
  ///
  /// In en, this message translates to:
  /// **'Moving Average (MA)'**
  String get labelMovingAverage;

  /// No description provided for @labelMA.
  ///
  /// In en, this message translates to:
  /// **'MA'**
  String get labelMA;

  /// No description provided for @infoMACD.
  ///
  /// In en, this message translates to:
  /// **'MACD is a trading indicator used in technical analysis of stock prices. It is supposed to reveal changes in the strength, direction, momentum, and duration of a trend in a stock\'s price.'**
  String get infoMACD;

  /// No description provided for @infoRSI.
  ///
  /// In en, this message translates to:
  /// **'The Relative Strength Index (RSI) was published by J. Welles Wilder. The current price is normalized as a percentage between 0 and 100. The flutter_chart_id of this oscillator is misleading because it does not compare the instrument relative to another instrument or set of instruments, but rather represents the current price relative to other recent pieces within the selected lookback window length.'**
  String get infoRSI;

  /// No description provided for @infoBB.
  ///
  /// In en, this message translates to:
  /// **'Bollinger Bands (BB) can be used to measure the highness or lowness of the price relative to previous trades.'**
  String get infoBB;

  /// No description provided for @infoMA.
  ///
  /// In en, this message translates to:
  /// **'The Moving Average (MA) helps to identify the overall market trend by filtering out short-term price fluctuations. Using historical data, it calculates the average price over a specific period and plots a line on the chart. If the MA line moves upwards, it’s an indicator of an uptrend, a downtrend if it moves downwards. A buy signal occurs when the price moves above the MA line.'**
  String get infoMA;

  /// No description provided for @infoMaximumActiveIndicatorsAdded.
  ///
  /// In en, this message translates to:
  /// **'You\'ve added the maximum number of active indicators.'**
  String get infoMaximumActiveIndicatorsAdded;

  /// No description provided for @infoAddSelectedIndicator.
  ///
  /// In en, this message translates to:
  /// **'Add {indicator}'**
  String infoAddSelectedIndicator(Object indicator);

  /// No description provided for @infoAddIndicator.
  ///
  /// In en, this message translates to:
  /// **'Add indicator'**
  String get infoAddIndicator;

  /// No description provided for @labelDeleteAllIndicators.
  ///
  /// In en, this message translates to:
  /// **'Delete all indicators'**
  String get labelDeleteAllIndicators;

  /// No description provided for @infoDeleteAllIndicators.
  ///
  /// In en, this message translates to:
  /// **'This will delete all active indicators.'**
  String get infoDeleteAllIndicators;

  /// No description provided for @infoResetIndicators.
  ///
  /// In en, this message translates to:
  /// **'This will reset the {indicator} indicator to its default settings.'**
  String infoResetIndicators(Object indicator);

  /// No description provided for @labelDeleteIndicator.
  ///
  /// In en, this message translates to:
  /// **'Delete {indicator} indicator'**
  String labelDeleteIndicator(Object indicator);

  /// No description provided for @labelResetIndicator.
  ///
  /// In en, this message translates to:
  /// **'Reset {indicator} indicator'**
  String labelResetIndicator(Object indicator);

  /// No description provided for @infoDeleteIndicator.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this indicator?'**
  String get infoDeleteIndicator;

  /// No description provided for @labelCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get labelCancel;

  /// No description provided for @labelDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get labelDelete;

  /// No description provided for @labelDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get labelDeleteAll;

  /// No description provided for @infoUpto3indicatorsAllowed.
  ///
  /// In en, this message translates to:
  /// **'Up to 3 active indicators allowed.'**
  String get infoUpto3indicatorsAllowed;

  /// No description provided for @infoNoActiveIndicators.
  ///
  /// In en, this message translates to:
  /// **'No active indicators.'**
  String get infoNoActiveIndicators;

  /// No description provided for @labelReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get labelReset;

  /// No description provided for @labelApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get labelApply;

  /// No description provided for @labelOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get labelOK;

  /// No description provided for @labelRSILine.
  ///
  /// In en, this message translates to:
  /// **'RSI line'**
  String get labelRSILine;

  /// No description provided for @labelPeriod.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get labelPeriod;

  /// No description provided for @labelMinRange.
  ///
  /// In en, this message translates to:
  /// **'Min range'**
  String get labelMinRange;

  /// No description provided for @labelMaxRange.
  ///
  /// In en, this message translates to:
  /// **'Max range'**
  String get labelMaxRange;

  /// No description provided for @labelSource.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get labelSource;

  /// No description provided for @labelClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get labelClose;

  /// No description provided for @labelOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get labelOpen;

  /// No description provided for @labelHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get labelHigh;

  /// No description provided for @labelLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get labelLow;

  /// No description provided for @labelHl2.
  ///
  /// In en, this message translates to:
  /// **'Hl/2'**
  String get labelHl2;

  /// No description provided for @labelHlc3.
  ///
  /// In en, this message translates to:
  /// **'Hlc/3'**
  String get labelHlc3;

  /// No description provided for @labelHlcc4.
  ///
  /// In en, this message translates to:
  /// **'Hlcc/4'**
  String get labelHlcc4;

  /// No description provided for @labelOhlc4.
  ///
  /// In en, this message translates to:
  /// **'Ohlc/4'**
  String get labelOhlc4;

  /// No description provided for @labelShowZones.
  ///
  /// In en, this message translates to:
  /// **'Show Zones'**
  String get labelShowZones;

  /// No description provided for @labelOverbought.
  ///
  /// In en, this message translates to:
  /// **'Overbought'**
  String get labelOverbought;

  /// No description provided for @labelOversold.
  ///
  /// In en, this message translates to:
  /// **'Oversold'**
  String get labelOversold;

  /// No description provided for @labelMinSize.
  ///
  /// In en, this message translates to:
  /// **'Min size'**
  String get labelMinSize;

  /// No description provided for @labelMaxSize.
  ///
  /// In en, this message translates to:
  /// **'Max size'**
  String get labelMaxSize;

  /// No description provided for @labelRange.
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get labelRange;

  /// No description provided for @labelOverboughtLine.
  ///
  /// In en, this message translates to:
  /// **'Overbought line'**
  String get labelOverboughtLine;

  /// No description provided for @labelOversoldLine.
  ///
  /// In en, this message translates to:
  /// **'Oversold line'**
  String get labelOversoldLine;

  /// No description provided for @labelMACDLine.
  ///
  /// In en, this message translates to:
  /// **'MACD line'**
  String get labelMACDLine;

  /// No description provided for @labelFastMAPeriod.
  ///
  /// In en, this message translates to:
  /// **'Fast MA period'**
  String get labelFastMAPeriod;

  /// No description provided for @labelSlowMAPeriod.
  ///
  /// In en, this message translates to:
  /// **'Slow MA period'**
  String get labelSlowMAPeriod;

  /// No description provided for @labelSignalLine.
  ///
  /// In en, this message translates to:
  /// **'Signal line'**
  String get labelSignalLine;

  /// No description provided for @labelSignalPeriod.
  ///
  /// In en, this message translates to:
  /// **'Signal period'**
  String get labelSignalPeriod;

  /// No description provided for @labelIncreasingBar.
  ///
  /// In en, this message translates to:
  /// **'Increasing bar'**
  String get labelIncreasingBar;

  /// No description provided for @labelDecreasingBar.
  ///
  /// In en, this message translates to:
  /// **'Decreasing bar'**
  String get labelDecreasingBar;

  /// No description provided for @labelBollingerBandsTop.
  ///
  /// In en, this message translates to:
  /// **'Bollinger Bands top'**
  String get labelBollingerBandsTop;

  /// No description provided for @labelBollingerBandsMedian.
  ///
  /// In en, this message translates to:
  /// **'Bollinger Bands median'**
  String get labelBollingerBandsMedian;

  /// No description provided for @labelBollingerBandsBottom.
  ///
  /// In en, this message translates to:
  /// **'Bollinger Bands bottom'**
  String get labelBollingerBandsBottom;

  /// No description provided for @labelChannelFill.
  ///
  /// In en, this message translates to:
  /// **'Channel fill'**
  String get labelChannelFill;

  /// No description provided for @labelFillColor.
  ///
  /// In en, this message translates to:
  /// **'Fill color'**
  String get labelFillColor;

  /// No description provided for @labelStandardDeviations.
  ///
  /// In en, this message translates to:
  /// **'Standard deviations'**
  String get labelStandardDeviations;

  /// No description provided for @labelMovingAverageType.
  ///
  /// In en, this message translates to:
  /// **'Moving Average Type'**
  String get labelMovingAverageType;

  /// No description provided for @labelMALine.
  ///
  /// In en, this message translates to:
  /// **'MA line'**
  String get labelMALine;

  /// No description provided for @labelOffset.
  ///
  /// In en, this message translates to:
  /// **'Offset'**
  String get labelOffset;

  /// No description provided for @labelType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get labelType;

  /// No description provided for @labelSimple.
  ///
  /// In en, this message translates to:
  /// **'Simple'**
  String get labelSimple;

  /// No description provided for @labelExponential.
  ///
  /// In en, this message translates to:
  /// **'Exponential'**
  String get labelExponential;

  /// No description provided for @labelWeighted.
  ///
  /// In en, this message translates to:
  /// **'Weighted'**
  String get labelWeighted;

  /// No description provided for @labelHull.
  ///
  /// In en, this message translates to:
  /// **'Hull'**
  String get labelHull;

  /// No description provided for @labelZeroLag.
  ///
  /// In en, this message translates to:
  /// **'Zero Lag'**
  String get labelZeroLag;

  /// No description provided for @labelTimeSeries.
  ///
  /// In en, this message translates to:
  /// **'Time Series'**
  String get labelTimeSeries;

  /// No description provided for @labelWellesWilder.
  ///
  /// In en, this message translates to:
  /// **'Welles Wilder'**
  String get labelWellesWilder;

  /// No description provided for @labelVariable.
  ///
  /// In en, this message translates to:
  /// **'Variable'**
  String get labelVariable;

  /// No description provided for @labelTriangular.
  ///
  /// In en, this message translates to:
  /// **'Triangular'**
  String get labelTriangular;

  /// No description provided for @label2Exponential.
  ///
  /// In en, this message translates to:
  /// **'2-Exponential'**
  String get label2Exponential;

  /// No description provided for @label3Exponential.
  ///
  /// In en, this message translates to:
  /// **'3-Exponential'**
  String get label3Exponential;

  /// No description provided for @warnEnterValueBetweenMinMax.
  ///
  /// In en, this message translates to:
  /// **'Enter a value between {min} and {max}'**
  String warnEnterValueBetweenMinMax(Object max, Object min);

  /// No description provided for @warnRangeMinMax.
  ///
  /// In en, this message translates to:
  /// **'Range {min} - {max}'**
  String warnRangeMinMax(Object max, Object min);

  /// No description provided for @labelDrawingTools.
  ///
  /// In en, this message translates to:
  /// **'Drawing tools'**
  String get labelDrawingTools;

  /// No description provided for @labelTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get labelTools;

  /// No description provided for @labelLine.
  ///
  /// In en, this message translates to:
  /// **'Line'**
  String get labelLine;

  /// No description provided for @labelRay.
  ///
  /// In en, this message translates to:
  /// **'Ray'**
  String get labelRay;

  /// No description provided for @informTapToSetFirstPoint.
  ///
  /// In en, this message translates to:
  /// **'Tap to set first point'**
  String get informTapToSetFirstPoint;

  /// No description provided for @informTapToSetFinalPoint.
  ///
  /// In en, this message translates to:
  /// **'Tap to set final point'**
  String get informTapToSetFinalPoint;

  /// No description provided for @informNoActiveDrawingTools.
  ///
  /// In en, this message translates to:
  /// **'No active drawing tools.'**
  String get informNoActiveDrawingTools;

  /// No description provided for @actionAddDrawingTool.
  ///
  /// In en, this message translates to:
  /// **'Add drawing tool'**
  String get actionAddDrawingTool;

  /// No description provided for @labelOf.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get labelOf;

  /// No description provided for @labelDeleteAllDrawingTools.
  ///
  /// In en, this message translates to:
  /// **'Delete all drawing tools'**
  String get labelDeleteAllDrawingTools;

  /// No description provided for @informDeleteAllDrawingTools.
  ///
  /// In en, this message translates to:
  /// **'This will delete all active drawing tools.'**
  String get informDeleteAllDrawingTools;
}

class _DerivMobileChartWrapperLocalizationsDelegate extends LocalizationsDelegate<DerivMobileChartWrapperLocalizations> {
  const _DerivMobileChartWrapperLocalizationsDelegate();

  @override
  Future<DerivMobileChartWrapperLocalizations> load(Locale locale) {
    return SynchronousFuture<DerivMobileChartWrapperLocalizations>(lookupDerivMobileChartWrapperLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'bn', 'de', 'en', 'es', 'fr', 'it', 'km', 'ko', 'mn', 'pl', 'pt', 'ru', 'si', 'sw', 'th', 'tr', 'uz', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_DerivMobileChartWrapperLocalizationsDelegate old) => false;
}

DerivMobileChartWrapperLocalizations lookupDerivMobileChartWrapperLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh': {
  switch (locale.countryCode) {
    case 'CN': return DerivMobileChartWrapperLocalizationsZhCn();
case 'TW': return DerivMobileChartWrapperLocalizationsZhTw();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return DerivMobileChartWrapperLocalizationsAr();
    case 'bn': return DerivMobileChartWrapperLocalizationsBn();
    case 'de': return DerivMobileChartWrapperLocalizationsDe();
    case 'en': return DerivMobileChartWrapperLocalizationsEn();
    case 'es': return DerivMobileChartWrapperLocalizationsEs();
    case 'fr': return DerivMobileChartWrapperLocalizationsFr();
    case 'it': return DerivMobileChartWrapperLocalizationsIt();
    case 'km': return DerivMobileChartWrapperLocalizationsKm();
    case 'ko': return DerivMobileChartWrapperLocalizationsKo();
    case 'mn': return DerivMobileChartWrapperLocalizationsMn();
    case 'pl': return DerivMobileChartWrapperLocalizationsPl();
    case 'pt': return DerivMobileChartWrapperLocalizationsPt();
    case 'ru': return DerivMobileChartWrapperLocalizationsRu();
    case 'si': return DerivMobileChartWrapperLocalizationsSi();
    case 'sw': return DerivMobileChartWrapperLocalizationsSw();
    case 'th': return DerivMobileChartWrapperLocalizationsTh();
    case 'tr': return DerivMobileChartWrapperLocalizationsTr();
    case 'uz': return DerivMobileChartWrapperLocalizationsUz();
    case 'vi': return DerivMobileChartWrapperLocalizationsVi();
    case 'zh': return DerivMobileChartWrapperLocalizationsZh();
  }

  throw FlutterError(
    'DerivMobileChartWrapperLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
