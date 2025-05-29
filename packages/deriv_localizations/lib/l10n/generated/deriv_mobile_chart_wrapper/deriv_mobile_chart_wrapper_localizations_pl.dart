import 'deriv_mobile_chart_wrapper_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class DerivMobileChartWrapperLocalizationsPl extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get labelIndicators => 'Wskaźniki';

  @override
  String get labelActive => 'Aktywny';

  @override
  String get labelAll => 'Wszystko';

  @override
  String get labelMomentum => 'Pęd';

  @override
  String get labelVolatility => 'Zmienność';

  @override
  String get labelMovingAverages => 'Średnie kroczące';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Względny wskaźnik siły (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Zespoły Bollingera (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Średnia ruchoma (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD jest wskaźnikiem handlowym wykorzystywanym w technicznej analizie cen akcji. Ma ujawniać zmiany w sile, kierunku, pędzie i czasie trwania trendu w cenie akcji.';

  @override
  String get infoRSI => 'Relative Strength Index (RSI) został opublikowany przez J. Wellesa Wildera. Aktualna cena jest znormalizowana jako procent od 0 do 100. Flutter_chart_id tego oscylatora jest mylący, ponieważ nie porównuje instrumentu względem innego instrumentu lub zestawu instrumentów, ale reprezentuje aktualną cenę w stosunku do innych ostatnich elementów w wybranej długości okna przeglądającego.';

  @override
  String get infoBB => 'Pasma Bollingera (BB) można wykorzystać do pomiaru wysokości lub niskiej ceny w stosunku do poprzednich transakcji.';

  @override
  String get infoMA => 'Średnia krocząca (MA) pomaga zidentyfikować ogólny trend rynkowy poprzez filtrowanie krótkoterminowych wahań cen. Korzystając z danych historycznych, oblicza średnią cenę w określonym okresie i wykreśla linię na wykresie. Jeśli linia MA porusza się w górę, jest to wskaźnik trendu wzrostowego, trendu spadkowego, jeśli porusza się w dół. Sygnał zakupu pojawia się, gdy cena przesuwa się powyżej linii MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Dodano maksymalną liczbę aktywnych wskaźników.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Dodaj $indicator';
  }

  @override
  String get infoAddIndicator => 'Dodaj wskaźnik';

  @override
  String get labelDeleteAllIndicators => 'Usuń wszystkie wskaźniki';

  @override
  String get infoDeleteAllIndicators => 'Spowoduje to usunięcie wszystkich aktywnych wskaźników.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Spowoduje to zresetowanie wskaźnika $indicator do ustawień domyślnych.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Usuń wskaźnik $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Zresetuj wskaźnik $indicator';
  }

  @override
  String get infoDeleteIndicator => 'Czy na pewno chcesz usunąć ten wskaźnik?';

  @override
  String get labelCancel => 'Anuluj';

  @override
  String get labelDelete => 'Usuń';

  @override
  String get labelDeleteAll => 'Usuń wszystko';

  @override
  String get infoUpto3indicatorsAllowed => 'Dozwolone jest do 3 aktywnych wskaźników.';

  @override
  String get infoNoActiveIndicators => 'Brak aktywnych wskaźników.';

  @override
  String get labelReset => 'Resetuj';

  @override
  String get labelApply => 'Zastosuj';

  @override
  String get labelOK => 'DOBRZE';

  @override
  String get labelRSILine => 'Linia RSI';

  @override
  String get labelPeriod => 'Kropka';

  @override
  String get labelMinRange => 'Minimalny zasięg';

  @override
  String get labelMaxRange => 'Maksymalny zasięg';

  @override
  String get labelSource => 'Źródło';

  @override
  String get labelClose => 'Zamknij';

  @override
  String get labelOpen => 'Otwórz';

  @override
  String get labelHigh => 'Wysoki';

  @override
  String get labelLow => 'Niski';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'HLC/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Pokaż strefy';

  @override
  String get labelOverbought => 'Wykupione';

  @override
  String get labelOversold => 'Wyprzedane';

  @override
  String get labelMinSize => 'Minimalny rozmiar';

  @override
  String get labelMaxSize => 'Maksymalny rozmiar';

  @override
  String get labelRange => 'Zasięg';

  @override
  String get labelOverboughtLine => 'Linia wykupiona';

  @override
  String get labelOversoldLine => 'Linia wyprzedana';

  @override
  String get labelMACDLine => 'Linia MACD';

  @override
  String get labelFastMAPeriod => 'Szybki okres MA';

  @override
  String get labelSlowMAPeriod => 'Powolny okres MA';

  @override
  String get labelSignalLine => 'Linia sygnałowa';

  @override
  String get labelSignalPeriod => 'Okres sygnału';

  @override
  String get labelIncreasingBar => 'Zwiększanie paska';

  @override
  String get labelDecreasingBar => 'Malejący pasek';

  @override
  String get labelBollingerBandsTop => 'Bollinger Bands Top';

  @override
  String get labelBollingerBandsMedian => 'Mediana pasm Bollingera';

  @override
  String get labelBollingerBandsBottom => 'Dolne paski Bollingera';

  @override
  String get labelChannelFill => 'Wypełnienie kanału';

  @override
  String get labelFillColor => 'Kolor wypełnienia';

  @override
  String get labelStandardDeviations => 'Odchylenia standardowe';

  @override
  String get labelMovingAverageType => 'Typ średniej ruchomej';

  @override
  String get labelMALine => 'Linia MA';

  @override
  String get labelOffset => 'Przesunięcie';

  @override
  String get labelType => 'Typ';

  @override
  String get labelSimple => 'Prosty';

  @override
  String get labelExponential => 'wykładniczy';

  @override
  String get labelWeighted => 'ważony';

  @override
  String get labelHull => 'Kadłub';

  @override
  String get labelZeroLag => 'Zero opóźnienia';

  @override
  String get labelTimeSeries => 'Szereg czasowy';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Zmienna';

  @override
  String get labelTriangular => 'Trójkątne';

  @override
  String get label2Exponential => '2-wykładniczy';

  @override
  String get label3Exponential => '3-wykładniczy';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Wprowadź wartość między $min i $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Zakres $min - $max';
  }

  @override
  String get labelDrawingTools => 'Narzędzia do rysowania';

  @override
  String get labelTools => 'Narzędzia';

  @override
  String get labelLine => 'Linia';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Stuknij, aby ustawić pierwszy punkt';

  @override
  String get informTapToSetFinalPoint => 'Stuknij, aby ustawić punkt końcowy';

  @override
  String get informNoActiveDrawingTools => 'Brak aktywnych narzędzi do rysowania.';

  @override
  String get actionAddDrawingTool => 'Dodaj narzędzie do rysowania';

  @override
  String get labelOf => 'z';

  @override
  String get labelDeleteAllDrawingTools => 'Usuń wszystkie narzędzia do rysowania';

  @override
  String get informDeleteAllDrawingTools => 'Spowoduje to usunięcie wszystkich aktywnych narzędzi do rysowania.';
}
