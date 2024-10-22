import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Russian (`ru`).
class DerivMobileChartWrapperLocalizationsRu extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get labelIndicators => 'Индикаторы';

  @override
  String get labelActive => 'Активный';

  @override
  String get labelAll => 'Все';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Волатильность';

  @override
  String get labelMovingAverages => 'Скользящие средние';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Индекс относительной силы (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Полосы Боллинджера (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Скользящая средняя (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'MACD - это торговый индикатор, используемый в техническом анализе цен на акции. Он призван выявлять изменения в силе, направлении, импульсе и продолжительности тренда в цене акции.';

  @override
  String get infoRSI => 'Индекс относительной силы (RSI) был опубликован Дж. Уэллсом Уайлдером. Текущая цена нормируется в процентах от 0 до 100. Flutter_chart_id этого осциллятора вводит в заблуждение, поскольку он не сравнивает инструмент относительно другого инструмента или набора инструментов, а скорее представляет текущую цену относительно других недавних фигур в пределах выбранной длины окна обратного просмотра.';

  @override
  String get infoBB => 'Полосы Боллинджера (Bollinger Bands, BB) можно использовать для измерения высоты или низкости цены по отношению к предыдущим сделкам.';

  @override
  String get infoMA => 'Скользящая средняя (MA) помогает определить общую тенденцию рынка, отсеивая краткосрочные колебания цен. Используя исторические данные, она рассчитывает среднюю цену за определенный период и наносит линию на график. Если линия MA движется вверх, это индикатор восходящего тренда, если вниз - нисходящего. Сигнал к покупке возникает, когда цена движется выше линии MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Вы добавили максимальное количество активных индикаторов.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Добавить $indicator';
  }

  @override
  String get infoAddIndicator => 'Добавьте индикатор';

  @override
  String get labelDeleteAllIndicators => 'Удалите все индикаторы';

  @override
  String get infoDeleteAllIndicators => 'Это удалит все активные индикаторы.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Индикатор удаления $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'Вы уверены, что хотите удалить этот индикатор?';

  @override
  String get labelCancel => 'Отмена';

  @override
  String get labelDelete => 'Удалить';

  @override
  String get labelDeleteAll => 'Удалить все';

  @override
  String get infoUpto3indicatorsAllowed => 'Допускается до 3 активных индикаторов.';

  @override
  String get infoNoActiveIndicators => 'Нет активных индикаторов.';

  @override
  String get labelReset => 'Сброс';

  @override
  String get labelApply => 'Применить';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'Линия RSI';

  @override
  String get labelPeriod => 'Период';

  @override
  String get labelMinRange => 'Минимальный диапазон';

  @override
  String get labelMaxRange => 'Максимальный диапазон';

  @override
  String get labelSource => 'Источник';

  @override
  String get labelClose => 'Закрыть';

  @override
  String get labelOpen => 'Открыть';

  @override
  String get labelHigh => 'Высокий';

  @override
  String get labelLow => 'Низкий';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Показать зоны';

  @override
  String get labelOverbought => 'Перекупленность';

  @override
  String get labelOversold => 'Перепроданность';

  @override
  String get labelMinSize => 'Минимальный размер';

  @override
  String get labelMaxSize => 'Максимальный размер';

  @override
  String get labelRange => 'Диапазон';

  @override
  String get labelOverboughtLine => 'Линия перекупленности';

  @override
  String get labelOversoldLine => 'Линия перепроданности';

  @override
  String get labelMACDLine => 'Линия MACD';

  @override
  String get labelFastMAPeriod => 'Быстрый период MA';

  @override
  String get labelSlowMAPeriod => 'Медленный период MA';

  @override
  String get labelSignalLine => 'Сигнальная линия';

  @override
  String get labelSignalPeriod => 'Период сигнала';

  @override
  String get labelIncreasingBar => 'Увеличивающаяся планка';

  @override
  String get labelDecreasingBar => 'Уменьшающаяся планка';

  @override
  String get labelBollingerBandsTop => 'Вершина Bollinger Bands';

  @override
  String get labelBollingerBandsMedian => 'Медиана полос Боллинджера';

  @override
  String get labelBollingerBandsBottom => 'Дно полос Боллинджера';

  @override
  String get labelChannelFill => 'Заполнение канала';

  @override
  String get labelFillColor => 'Цвет заливки';

  @override
  String get labelStandardDeviations => 'Стандартные отклонения';

  @override
  String get labelMovingAverageType => 'Тип скользящей средней';

  @override
  String get labelMALine => 'Линия MA';

  @override
  String get labelOffset => 'Смещение';

  @override
  String get labelType => 'Тип';

  @override
  String get labelSimple => 'Простой';

  @override
  String get labelExponential => 'Экспоненциальный';

  @override
  String get labelWeighted => 'Взвешенный';

  @override
  String get labelHull => 'Корпус';

  @override
  String get labelZeroLag => 'Нулевая задержка';

  @override
  String get labelTimeSeries => 'Временные ряды';

  @override
  String get labelWellesWilder => 'Уэллс Уайлдер';

  @override
  String get labelVariable => 'Переменная';

  @override
  String get labelTriangular => 'Треугольный';

  @override
  String get label2Exponential => '2-Экспоненциальный';

  @override
  String get label3Exponential => '3-экспоненциальный';

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
