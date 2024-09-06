import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class DerivMobileChartWrapperLocalizationsEs extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get labelIndicators => 'Indicadores';

  @override
  String get labelActive => 'Activo';

  @override
  String get labelAll => 'Todos';

  @override
  String get labelMomentum => 'Impulso';

  @override
  String get labelVolatility => 'Volatilidad';

  @override
  String get labelMovingAverages => 'Medias móviles';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Índice de fuerza relativa (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bandas de Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Media móvil (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'El MACD es un indicador utilizado en el análisis técnico de las cotizaciones bursátiles. Se supone que revela los cambios en la fuerza, la dirección, el impulso y la duración de una tendencia en el precio de una acción.';

  @override
  String get infoRSI => 'El índice de fuerza relativa (RSI) fue publicado por J. Welles Wilder. El precio actual se normaliza como un porcentaje entre 0 y 100. El flutter_chart_id de este oscilador es engañoso porque no compara el instrumento en relación con otro instrumento o conjunto de instrumentos, sino que representa el precio actual en relación con otras piezas recientes dentro de la longitud de la ventana de retroceso seleccionada.';

  @override
  String get infoBB => 'Las Bandas de Bollinger (BB) pueden utilizarse para medir la altitud o la caída del precio en relación con operaciones anteriores.';

  @override
  String get infoMA => 'La media móvil (MA) ayuda a identificar la tendencia general del mercado filtrando las fluctuaciones de precios a corto plazo. Utilizando datos históricos, calcula el precio medio durante un periodo específico y traza una línea en el gráfico. Si la línea MA se mueve hacia arriba, es un indicador de una tendencia alcista, una tendencia bajista si se mueve hacia abajo. Una señal de compra se produce cuando el precio se mueve por encima de la línea MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Ha añadido el número máximo de indicadores activos.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Añada $indicator';
  }

  @override
  String get infoAddIndicator => 'Añadir indicador';

  @override
  String get labelDeleteAllIndicators => 'Borrar todos los indicadores';

  @override
  String get infoDeleteAllIndicators => 'Esto borrará todos los indicadores activos.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Borrar el indicador $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => '¿Está seguro de que desea eliminar este indicador?';

  @override
  String get labelCancel => 'Cancelar';

  @override
  String get labelDelete => 'Borrar';

  @override
  String get labelDeleteAll => 'Borrar todo';

  @override
  String get infoUpto3indicatorsAllowed => 'Se permiten hasta 3 indicadores activos.';

  @override
  String get infoNoActiveIndicators => 'No hay indicadores activos.';

  @override
  String get labelReset => 'Reinicie';

  @override
  String get labelApply => 'Aplique';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'Línea RSI';

  @override
  String get labelPeriod => 'Periodo';

  @override
  String get labelMinRange => 'Alcance mínimo';

  @override
  String get labelMaxRange => 'Alcance máximo';

  @override
  String get labelSource => 'Fuente';

  @override
  String get labelClose => 'Cerrar';

  @override
  String get labelOpen => 'Abra';

  @override
  String get labelHigh => 'Alta';

  @override
  String get labelLow => 'Bajo';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Mostrar zonas';

  @override
  String get labelOverbought => 'Sobrecompra';

  @override
  String get labelOversold => 'Sobreventa';

  @override
  String get labelMinSize => 'Tamaño mínimo';

  @override
  String get labelMaxSize => 'Tamaño máximo';

  @override
  String get labelRange => 'Gama';

  @override
  String get labelOverboughtLine => 'Línea de sobrecompra';

  @override
  String get labelOversoldLine => 'Línea de sobreventa';

  @override
  String get labelMACDLine => 'Línea MACD';

  @override
  String get labelFastMAPeriod => 'Periodo MA rápido';

  @override
  String get labelSlowMAPeriod => 'Periodo MA lento';

  @override
  String get labelSignalLine => 'Línea de señales';

  @override
  String get labelSignalPeriod => 'Periodo de señalización';

  @override
  String get labelIncreasingBar => 'Barra creciente';

  @override
  String get labelDecreasingBar => 'Barra decreciente';

  @override
  String get labelBollingerBandsTop => 'Parte superior de las bandas de Bollinger';

  @override
  String get labelBollingerBandsMedian => 'Mediana de las bandas de Bollinger';

  @override
  String get labelBollingerBandsBottom => 'Fondo de las Bandas de Bollinger';

  @override
  String get labelChannelFill => 'Relleno del canal';

  @override
  String get labelFillColor => 'Color de relleno';

  @override
  String get labelStandardDeviations => 'Desviaciones estándar';

  @override
  String get labelMovingAverageType => 'Tipo de media móvil';

  @override
  String get labelMALine => 'Línea MA';

  @override
  String get labelOffset => 'Desplazamiento';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelSimple => 'Simple';

  @override
  String get labelExponential => 'Exponencial';

  @override
  String get labelWeighted => 'Ponderado';

  @override
  String get labelHull => 'Casco';

  @override
  String get labelZeroLag => 'Retraso cero';

  @override
  String get labelTimeSeries => 'Series temporales';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variable';

  @override
  String get labelTriangular => 'Triangular';

  @override
  String get label2Exponential => '2-Exponencial';

  @override
  String get label3Exponential => '3-Exponencial';

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
