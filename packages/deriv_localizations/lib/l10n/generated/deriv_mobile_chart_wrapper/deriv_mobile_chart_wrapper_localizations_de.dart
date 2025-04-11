import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class DerivMobileChartWrapperLocalizationsDe extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get labelIndicators => 'Indikatoren';

  @override
  String get labelActive => 'Aktiv';

  @override
  String get labelAll => 'Alle';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Volatilität';

  @override
  String get labelMovingAverages => 'Gleitende Durchschnitte';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Relative Strength Index (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bollinger Bands (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Gleitender Durchschnitt (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'Der MACD ist ein Handelsindikator, der bei der technischen Analyse von Aktienkursen verwendet wird. Er soll Veränderungen in der Stärke, Richtung, Dynamik und Dauer eines Trends bei einem Aktienkurs aufzeigen.';

  @override
  String get infoRSI => 'Der Relative Strength Index (RSI) wurde von J. Welles Wilder veröffentlicht. Der aktuelle Preis wird als Prozentsatz zwischen 0 und 100 normiert. Die flutter_chart_id dieses Oszillators ist irreführend, da sie das Instrument nicht relativ zu einem anderen Instrument oder einer Gruppe von Instrumenten vergleicht, sondern den aktuellen Preis relativ zu anderen kürzlich beobachteten Werten innerhalb des ausgewählten Betrachtungszeitraums darstellt.';

  @override
  String get infoBB => 'Bollinger Bänder (BB) können verwendet werden, um die Höhe oder Tiefe des Kurses im Vergleich zu früheren Handel zu messen.';

  @override
  String get infoMA => 'Der gleitende Durchschnitt (MA) hilft dabei, den allgemeinen Markttrend zu erkennen, indem er kurzfristige Kursschwankungen herausfiltert. Anhand historischer Daten berechnet er den Durchschnittspreis über einen bestimmten Zeitraum und zeichnet eine Linie in den Chart ein. Bewegt sich die MA-Linie nach oben, ist dies ein Indikator für einen Aufwärtstrend, bewegt sie sich nach unten, ist dies ein Abwärtstrend. Ein Kaufsignal entsteht, wenn sich der Kurs über die MA-Linie bewegt.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Sie haben die maximale Anzahl von aktiven Indikatoren hinzugefügt.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return '${indicator}hinzufügen';
  }

  @override
  String get infoAddIndicator => 'Indikator hinzufügen';

  @override
  String get labelDeleteAllIndicators => 'Alle Indikatoren löschen';

  @override
  String get infoDeleteAllIndicators => 'Dadurch werden alle aktiven Indikatoren gelöscht.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Dadurch wird der Indikator $indicator auf seine Standardeinstellungen zurückgesetzt.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Löschen $indicator Indikator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Anzeige $indicator zurücksetzen';
  }

  @override
  String get infoDeleteIndicator => 'Sind Sie sicher, dass Sie diesen Indikator löschen möchten?';

  @override
  String get labelCancel => 'Abbrechen';

  @override
  String get labelDelete => 'Löschen';

  @override
  String get labelDeleteAll => 'Alle löschen';

  @override
  String get infoUpto3indicatorsAllowed => 'Bis zu 3 aktive Indikatoren erlaubt.';

  @override
  String get infoNoActiveIndicators => 'Keine aktiven Indikatoren.';

  @override
  String get labelReset => 'Zurücksetzen';

  @override
  String get labelApply => 'Anwenden';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'RSI-Linie';

  @override
  String get labelPeriod => 'Zeitraum';

  @override
  String get labelMinRange => 'Min. Reichweite';

  @override
  String get labelMaxRange => 'Maximale Reichweite';

  @override
  String get labelSource => 'Quelle';

  @override
  String get labelClose => 'Schließen Sie';

  @override
  String get labelOpen => 'Öffnen Sie';

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
  String get labelShowZones => 'Zonen anzeigen';

  @override
  String get labelOverbought => 'Überkauft';

  @override
  String get labelOversold => 'Überverkauft';

  @override
  String get labelMinSize => 'Minimale Größe';

  @override
  String get labelMaxSize => 'Maximale Größe';

  @override
  String get labelRange => 'Reichweite';

  @override
  String get labelOverboughtLine => 'Überkaufte Linie';

  @override
  String get labelOversoldLine => 'Überverkaufte Linie';

  @override
  String get labelMACDLine => 'MACD-Linie';

  @override
  String get labelFastMAPeriod => 'Schnelle MA-Periode';

  @override
  String get labelSlowMAPeriod => 'Langsame MA-Periode';

  @override
  String get labelSignalLine => 'Signalleitung';

  @override
  String get labelSignalPeriod => 'Signalperiode';

  @override
  String get labelIncreasingBar => 'Steigende Bar';

  @override
  String get labelDecreasingBar => 'Abnehmender Balken';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands oben';

  @override
  String get labelBollingerBandsMedian => 'Bollinger Bands Median';

  @override
  String get labelBollingerBandsBottom => 'Bollinger Bands unten';

  @override
  String get labelChannelFill => 'Kanal füllen';

  @override
  String get labelFillColor => 'Farbe ausfüllen';

  @override
  String get labelStandardDeviations => 'Standardabweichungen';

  @override
  String get labelMovingAverageType => 'Gleitender Durchschnitt Typ';

  @override
  String get labelMALine => 'MA-Linie';

  @override
  String get labelOffset => 'Versetzt';

  @override
  String get labelType => 'Typ';

  @override
  String get labelSimple => 'Einfach';

  @override
  String get labelExponential => 'Exponential';

  @override
  String get labelWeighted => 'Gewichtet';

  @override
  String get labelHull => 'Rumpf';

  @override
  String get labelZeroLag => 'Null Verzögerung';

  @override
  String get labelTimeSeries => 'Zeitreihen';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variabel';

  @override
  String get labelTriangular => 'Dreieckig';

  @override
  String get label2Exponential => '2-Exponential';

  @override
  String get label3Exponential => '3-Exponential';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Geben Sie einen Wert zwischen $min und ${max}ein.';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Reichweite $min - $max';
  }

  @override
  String get labelDrawingTools => 'Werkzeuge zum Zeichnen';

  @override
  String get labelTools => 'Werkzeuge';

  @override
  String get labelLine => 'Linie';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Tippe, um den ersten Punkt zu setzen';

  @override
  String get informTapToSetFinalPoint => 'Tippe, um den Endpunkt festzulegen';

  @override
  String get informNoActiveDrawingTools => 'Keine aktiven Zeichenwerkzeuge.';

  @override
  String get actionAddDrawingTool => 'Zeichentool hinzufügen';

  @override
  String get labelOf => 'von';

  @override
  String get labelDeleteAllDrawingTools => 'Alle Zeichenwerkzeuge löschen';

  @override
  String get informDeleteAllDrawingTools => 'Dadurch werden alle aktiven Zeichenwerkzeuge gelöscht.';
}
