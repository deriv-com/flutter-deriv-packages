import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class DerivMobileChartWrapperLocalizationsIt extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get labelIndicators => 'Indicatori';

  @override
  String get labelActive => 'Attivo';

  @override
  String get labelAll => 'Tutti';

  @override
  String get labelMomentum => 'Momento';

  @override
  String get labelVolatility => 'Volatilità';

  @override
  String get labelMovingAverages => 'Medie mobili';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Indice di forza relativa (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bande di Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Media mobile (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'Il MACD è un indicatore di trading utilizzato nell\'analisi tecnica dei prezzi delle azioni. Si suppone che riveli i cambiamenti nella forza, nella direzione, nello slancio e nella durata di una tendenza nel prezzo di un\'azione.';

  @override
  String get infoRSI => 'L\'Indice di Forza Relativa (RSI) è stato pubblicato da J. Welles Wilder. Il prezzo corrente viene normalizzato come percentuale tra 0 e 100. Il flutter_chart_id di questo oscillatore è fuorviante perché non confronta lo strumento rispetto ad un altro strumento o ad un insieme di strumenti, ma rappresenta piuttosto il prezzo corrente rispetto ad altri pezzi recenti all\'interno della lunghezza della finestra di lookback selezionata.';

  @override
  String get infoBB => 'Le Bande di Bollinger (BB) possono essere utilizzate per misurare l\'altezza o la debolezza del prezzo rispetto alle contrattazioni precedenti.';

  @override
  String get infoMA => 'La media mobile (MA) aiuta a identificare la tendenza generale del mercato, filtrando le fluttuazioni di prezzo a breve termine. Utilizzando i dati storici, calcola il prezzo medio in un periodo specifico e traccia una linea sul grafico. Se la linea MA si muove verso l\'alto, è un indicatore di una tendenza al rialzo, di una tendenza al ribasso se si muove verso il basso. Un segnale di acquisto si verifica quando il prezzo si muove al di sopra della linea MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Ha aggiunto il numero massimo di indicatori attivi.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Aggiungi $indicator';
  }

  @override
  String get infoAddIndicator => 'Aggiungi indicatore';

  @override
  String get labelDeleteAllIndicators => 'Cancellare tutti gli indicatori';

  @override
  String get infoDeleteAllIndicators => 'Questo eliminerà tutti gli indicatori attivi.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Ciò ripristinerà le impostazioni predefinite dell\'indicatore $indicator .';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Cancellare l\'indicatore $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Indicatore Reset $indicator';
  }

  @override
  String get infoDeleteIndicator => 'È sicuro di voler eliminare questo indicatore?';

  @override
  String get labelCancel => 'Annullamento';

  @override
  String get labelDelete => 'Cancellare';

  @override
  String get labelDeleteAll => 'Cancella tutto';

  @override
  String get infoUpto3indicatorsAllowed => 'Sono consentiti fino a 3 indicatori attivi.';

  @override
  String get infoNoActiveIndicators => 'Non ci sono indicatori attivi.';

  @override
  String get labelReset => 'Azzeramento';

  @override
  String get labelApply => 'Applicare';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'Linea RSI';

  @override
  String get labelPeriod => 'Periodo';

  @override
  String get labelMinRange => 'Intervallo minimo';

  @override
  String get labelMaxRange => 'Gamma massima';

  @override
  String get labelSource => 'Fonte';

  @override
  String get labelClose => 'Chiudere';

  @override
  String get labelOpen => 'Aperto';

  @override
  String get labelHigh => 'Alto';

  @override
  String get labelLow => 'Basso';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Mostra le zone';

  @override
  String get labelOverbought => 'Sovracomprato';

  @override
  String get labelOversold => 'In ipervenduto';

  @override
  String get labelMinSize => 'Dimensione minima';

  @override
  String get labelMaxSize => 'Dimensione massima';

  @override
  String get labelRange => 'Gamma';

  @override
  String get labelOverboughtLine => 'Linea di ipercomprato';

  @override
  String get labelOversoldLine => 'Linea di ipervenduto';

  @override
  String get labelMACDLine => 'Linea MACD';

  @override
  String get labelFastMAPeriod => 'Periodo di MA veloce';

  @override
  String get labelSlowMAPeriod => 'Periodo di MA lento';

  @override
  String get labelSignalLine => 'Linea di segnale';

  @override
  String get labelSignalPeriod => 'Periodo del segnale';

  @override
  String get labelIncreasingBar => 'Barra di aumento';

  @override
  String get labelDecreasingBar => 'Barra decrescente';

  @override
  String get labelBollingerBandsTop => 'Bande di Bollinger top';

  @override
  String get labelBollingerBandsMedian => 'Bande di Bollinger mediane';

  @override
  String get labelBollingerBandsBottom => 'Fondo delle Bande di Bollinger';

  @override
  String get labelChannelFill => 'Riempimento del canale';

  @override
  String get labelFillColor => 'Colore di riempimento';

  @override
  String get labelStandardDeviations => 'Deviazioni standard';

  @override
  String get labelMovingAverageType => 'Tipo di media mobile';

  @override
  String get labelMALine => 'Linea MA';

  @override
  String get labelOffset => 'Offset';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelSimple => 'Semplice';

  @override
  String get labelExponential => 'Esponenziale';

  @override
  String get labelWeighted => 'Ponderato';

  @override
  String get labelHull => 'Scafo';

  @override
  String get labelZeroLag => 'Ritardo zero';

  @override
  String get labelTimeSeries => 'Serie temporale';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variabile';

  @override
  String get labelTriangular => 'Triangolare';

  @override
  String get label2Exponential => '2-Esponenziale';

  @override
  String get label3Exponential => '3-Esponenziale';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Inserisca un valore compreso tra $min e $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Gamma $min - $max';
  }

  @override
  String get labelDrawingTools => 'Strumenti di disegno';

  @override
  String get labelTools => 'Utensili';

  @override
  String get labelLine => 'Linea';

  @override
  String get labelRay => 'raggio';

  @override
  String get informTapToSetFirstPoint => 'Tocca per impostare il primo punto';

  @override
  String get informTapToSetFinalPoint => 'Tocca per impostare il punto finale';

  @override
  String get informNoActiveDrawingTools => 'Nessuno strumento di disegno attivo.';

  @override
  String get actionAddDrawingTool => 'Aggiungi strumento di disegno';

  @override
  String get labelOf => 'di';

  @override
  String get labelDeleteAllDrawingTools => 'Eliminare tutti gli strumenti di disegno';

  @override
  String get informDeleteAllDrawingTools => 'Questo eliminerà tutti gli strumenti di disegno attivi.';
}
