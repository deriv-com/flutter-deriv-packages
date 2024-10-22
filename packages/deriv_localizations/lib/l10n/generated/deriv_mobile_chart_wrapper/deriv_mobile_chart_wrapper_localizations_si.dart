import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Sinhala Sinhalese (`si`).
class DerivMobileChartWrapperLocalizationsSi extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get labelIndicators => 'දර්ශක';

  @override
  String get labelActive => 'ක්රියාකාරී';

  @override
  String get labelAll => 'සියල්ලම';

  @override
  String get labelMomentum => 'ගම්යතාව';

  @override
  String get labelVolatility => 'අස්ථාවරත්වය';

  @override
  String get labelMovingAverages => 'චලනය වන සාමාන්යයන්';

  @override
  String get labelMACD => 'මැක්ඩී';

  @override
  String get labelRelativeStrengthIndex => 'සාපේක්ෂ ශක්ති දර්ශකය (RSI)';

  @override
  String get labelRSI => 'ආර්එස්අයි';

  @override
  String get labelBollingerBands => 'බොලින්ගර් බෑන්ඩ් (බීබී)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'චලනය වන සාමාන්යය (MA)';

  @override
  String get labelMA => 'මා';

  @override
  String get infoMACD => 'MACD යනු කොටස් මිල ගණන් පිළිබඳ තාක්ෂණික විශ්ලේෂණයේදී භාවිතා කරන වෙළඳ දර්ශකයකි. එය කොටස් මිලෙහි ප්රවණතාවයේ ශක්තිය, දිශාව, ගම්යතාව සහ කාලසීමාවේ වෙනස්කම් හෙළි කිරීමට නියමිතය.';

  @override
  String get infoRSI => 'සාපේක්ෂ ශක්ති දර්ශකය (RSI) ප්රකාශයට පත් කරන ලද්දේ ජේ වෙල්ස් වයිල්ඩර් විසිනි. වර්තමාන මිල 0 සහ 100 අතර ප්රතිශතයක් ලෙස සාමාන්යකරණය කර ඇත. මෙම ඔස්කිලේටරයේ flutter_chart_id නොමඟ යන්නේ එය වෙනත් උපකරණයක් හෝ උපකරණ කට්ටලයකට සාපේක්ෂව උපකරණය සංසන්දනය නොකරන නිසා, ඒ වෙනුවට තෝරාගත් lookback කවුළුව දිග තුළ අනෙකුත් මෑත කෑලිවලට සාපේක්ෂව වත්මන් මිල නියෝජනය කරයි.';

  @override
  String get infoBB => 'පෙර වෙළඳාම් වලට සාපේක්ෂව මිලෙහි උසස්කම හෝ පහත් බව මැනීම සඳහා බොලින්ගර් බෑන්ඩ් (බීබී) භාවිතා කළ හැකිය.';

  @override
  String get infoMA => 'චලනය වන සාමාන්යය (MA) කෙටි කාලීන මිල උච්චාවචනයන් පෙරීම මගින් සමස්ත වෙළඳපල ප්රවණතාව හඳුනා ගැනීමට උපකාරී වේ. ඓතිහාසික දත්ත භාවිතා කරමින්, එය නිශ්චිත කාල පරිච්ඡේදයක් පුරා සාමාන්ය මිල ගණනය කර ප්රස්ථාරයේ රේඛාවක් සකස් කරයි. MA රේඛාව ඉහළට ගමන් කරන්නේ නම් එය uptrend ක දර්ශකයක්, පහළට ගමන් කරන්නේ නම් downtrend එකක්. මිල MA රේඛාවට ඉහළින් ගමන් කරන විට මිලදී ගැනීමේ සංඥාවක් සිදු වේ.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'ඔබ උපරිම ක්රියාකාරී දර්ශක සංඛ්යාව එකතු කර ඇත.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '$indicatorඑකතු කරන්න';
  }

  @override
  String get infoAddIndicator => 'දර්ශකය එක් කරන්න';

  @override
  String get labelDeleteAllIndicators => 'සියලුම දර්ශක මකා දමන්න';

  @override
  String get infoDeleteAllIndicators => 'මෙය සියලුම ක්රියාකාරී දර්ශක මකා දමනු ඇත.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return '$indicator දර්ශකය මකන්න';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'ඔබට මෙම දර්ශකය මකා දැමීමට අවශ්ය බව ඔබට විශ්වාසද?';

  @override
  String get labelCancel => 'අවලංගු කරන්න';

  @override
  String get labelDelete => 'මකන්න';

  @override
  String get labelDeleteAll => 'සියල්ල මකා දමන්න';

  @override
  String get infoUpto3indicatorsAllowed => 'ක්රියාකාරී දර්ශක 3 ක් දක්වා අවසර ඇත.';

  @override
  String get infoNoActiveIndicators => 'ක්රියාකාරී දර්ශක නොමැත.';

  @override
  String get labelReset => 'යළි පිහිටුවන්න';

  @override
  String get labelApply => 'අයදුම් කරන්න';

  @override
  String get labelOK => 'හරි';

  @override
  String get labelRSILine => 'ආර්එස්අයි රේඛාව';

  @override
  String get labelPeriod => 'කාල සීමාව';

  @override
  String get labelMinRange => 'අවම පරාසය';

  @override
  String get labelMaxRange => 'උපරිම පරාසය';

  @override
  String get labelSource => 'මූලාශ්රය';

  @override
  String get labelClose => 'වසා දමන්න';

  @override
  String get labelOpen => 'විවෘත කරන්න';

  @override
  String get labelHigh => 'ඉහළ';

  @override
  String get labelLow => 'අඩුයි';

  @override
  String get labelHl2 => 'එච්එල්/2';

  @override
  String get labelHlc3 => 'එච්එල්සී/3';

  @override
  String get labelHlcc4 => 'එච්එල්සී/4';

  @override
  String get labelOhlc4 => 'ඕඑච්එල්සී/4';

  @override
  String get labelShowZones => 'කලාප පෙන්වන්න';

  @override
  String get labelOverbought => 'අධික ලෙස මිල දී ගනු ලැබේ';

  @override
  String get labelOversold => 'අධික ලෙස විකුණා ඇත';

  @override
  String get labelMinSize => 'අවම ප්රමාණය';

  @override
  String get labelMaxSize => 'උපරිම ප්රමාණය';

  @override
  String get labelRange => 'පරාසය';

  @override
  String get labelOverboughtLine => 'අධික ලෙස මිලදී ගත් රේඛාව';

  @override
  String get labelOversoldLine => 'අධි විකුණුම් රේඛාව';

  @override
  String get labelMACDLine => 'MACD රේඛාව';

  @override
  String get labelFastMAPeriod => 'වේගවත් MA කාල පරිච්ඡේදය';

  @override
  String get labelSlowMAPeriod => 'මන්දගාමී MA කාලය';

  @override
  String get labelSignalLine => 'සංඥා රේඛාව';

  @override
  String get labelSignalPeriod => 'සංඥා කාලය';

  @override
  String get labelIncreasingBar => 'තීරුව වැඩි කිරීම';

  @override
  String get labelDecreasingBar => 'බාර් අඩුවීම';

  @override
  String get labelBollingerBandsTop => 'බොලින්ගර් බෑන්ඩ් ටොප්';

  @override
  String get labelBollingerBandsMedian => 'බොලින්ගර් බෑන්ඩ් මධ්යන්ය';

  @override
  String get labelBollingerBandsBottom => 'බොලින්ගර් බෑන්ඩ්ස් පහළ';

  @override
  String get labelChannelFill => 'නාලිකා පිරවීම';

  @override
  String get labelFillColor => 'වර්ණය පුරවන්න';

  @override
  String get labelStandardDeviations => 'සම්මත අපගමනය';

  @override
  String get labelMovingAverageType => 'චලනය වන සාමාන්ය වර්ගය';

  @override
  String get labelMALine => 'එම්ඒ රේඛාව';

  @override
  String get labelOffset => 'ඕෆ්සෙට්';

  @override
  String get labelType => 'වර්ගය';

  @override
  String get labelSimple => 'සරල';

  @override
  String get labelExponential => 'එක්ස්පේන්ෂල්';

  @override
  String get labelWeighted => 'බර බර';

  @override
  String get labelHull => 'හල්';

  @override
  String get labelZeroLag => 'ශුරෝ ලැග්';

  @override
  String get labelTimeSeries => 'කාල මාලාව';

  @override
  String get labelWellesWilder => 'වෙල්ස් වයිල්ඩර්';

  @override
  String get labelVariable => 'විචල්ය';

  @override
  String get labelTriangular => 'ත්රිකෝණාකාර';

  @override
  String get label2Exponential => '2-එක්ස්පෙන්ෂනල්';

  @override
  String get label3Exponential => '3-එක්ස්පෙන්ෂනල්';

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

  @override
  String get labelOf => 'of';

  @override
  String get labelDeleteAllDrawingTools => 'Delete all drawing tools';

  @override
  String get informDeleteAllDrawingTools => 'This will delete all active drawing tools.';
}
