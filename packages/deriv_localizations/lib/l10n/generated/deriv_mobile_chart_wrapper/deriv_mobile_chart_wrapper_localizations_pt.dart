import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for Portuguese (`pt`).
class DerivMobileChartWrapperLocalizationsPt extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get labelIndicators => 'Indicadores';

  @override
  String get labelActive => 'Ativo';

  @override
  String get labelAll => 'Todos';

  @override
  String get labelMomentum => 'Momentum';

  @override
  String get labelVolatility => 'Volatilidade';

  @override
  String get labelMovingAverages => 'Médias móveis';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Índice de Força Relativa (RSI)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bandas de Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Média móvel (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'A Convergência/Divergência das Médias Móveis (MACD) é um indicador de negociação utilizado na análise técnica dos preços das ações. É suposto revelar alterações na força, direção, momentum e duração de uma tendência no preço de uma ação.';

  @override
  String get infoRSI => 'O Índice de Força Relativa (RSI) foi publicado por J. Welles Wilder. O preço atual é normalizado como uma percentagem entre 0 e 100. O flutter_chart_id deste oscilador é enganador porque não compara o instrumento com outro instrumento ou conjunto de instrumentos, mas sim representa o preço atual em relação a outras peças recentes dentro do comprimento da janela de lookback selecionada.';

  @override
  String get infoBB => 'As Bandas de Bollinger (BB) podem ser usadas para medir se o preço está alto ou baixo em relação a negociações anteriores.';

  @override
  String get infoMA => 'A média móvel (MA) ajuda a identificar a tendência geral do mercado ao filtrar as flutuações de preços a curto prazo. Utilizando o histórico de dados, calcula o preço médio durante um período específico e traça uma linha no gráfico. Se a linha MA se mover para cima, indica uma tendência ascendente; se se mover para baixo, indica uma tendência descendente. Um sinal de compra ocorre quando o preço ultrapassa a linha MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Adicionou o número máximo de indicadores ativos.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Adicionar $indicator';
  }

  @override
  String get infoAddIndicator => 'Adicionar indicador';

  @override
  String get labelDeleteAllIndicators => 'Eliminar todos os indicadores';

  @override
  String get infoDeleteAllIndicators => 'Esta ação elimina todos os indicadores ativos.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'This will reset the $indicator indicator to its default settings.';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Eliminar o indicador $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Reset $indicator indicator';
  }

  @override
  String get infoDeleteIndicator => 'Tem a certeza de que pretende eliminar este indicador?';

  @override
  String get labelCancel => 'Cancelar';

  @override
  String get labelDelete => 'Eliminar';

  @override
  String get labelDeleteAll => 'Eliminar tudo';

  @override
  String get infoUpto3indicatorsAllowed => 'São permitidos até 3 indicadores ativos.';

  @override
  String get infoNoActiveIndicators => 'Não existem indicadores ativos.';

  @override
  String get labelReset => 'Reiniciação';

  @override
  String get labelApply => 'Aplicar';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'Linha do RSI';

  @override
  String get labelPeriod => 'Período';

  @override
  String get labelMinRange => 'Intervalo mín.';

  @override
  String get labelMaxRange => 'Intervalo máx.';

  @override
  String get labelSource => 'Fonte';

  @override
  String get labelClose => 'Fechado';

  @override
  String get labelOpen => 'Aberto';

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
  String get labelShowZones => 'Mostrar zonas';

  @override
  String get labelOverbought => 'Sobrecompra';

  @override
  String get labelOversold => 'Sobrevenda';

  @override
  String get labelMinSize => 'Tamanho mín.';

  @override
  String get labelMaxSize => 'Tamanho máx.';

  @override
  String get labelRange => 'Intervalo';

  @override
  String get labelOverboughtLine => 'Linha de sobrecompra';

  @override
  String get labelOversoldLine => 'Linha de sobrevenda';

  @override
  String get labelMACDLine => 'Linha do MACD';

  @override
  String get labelFastMAPeriod => 'Período da média móvel rápida';

  @override
  String get labelSlowMAPeriod => 'Período da média móvel lenta';

  @override
  String get labelSignalLine => 'Linha de sinal';

  @override
  String get labelSignalPeriod => 'Período de sinal';

  @override
  String get labelIncreasingBar => 'Barra crescente';

  @override
  String get labelDecreasingBar => 'Barra decrescente';

  @override
  String get labelBollingerBandsTop => 'Limite superior das Bandas de Bollinger';

  @override
  String get labelBollingerBandsMedian => 'Limite médio das Bandas de Bollinger';

  @override
  String get labelBollingerBandsBottom => 'Limite inferior das Bandas de Bollinger';

  @override
  String get labelChannelFill => 'Preenchimento do canal';

  @override
  String get labelFillColor => 'Cor de preenchimento';

  @override
  String get labelStandardDeviations => 'Desvios padrão';

  @override
  String get labelMovingAverageType => 'Tipo de média móvel';

  @override
  String get labelMALine => 'Linha da MA';

  @override
  String get labelOffset => 'Deslocamento';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelSimple => 'Simples';

  @override
  String get labelExponential => 'Exponencial';

  @override
  String get labelWeighted => 'Ponderada';

  @override
  String get labelHull => 'Hull';

  @override
  String get labelZeroLag => 'Zero Lag (sem atraso)';

  @override
  String get labelTimeSeries => 'Séries temporais';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variável';

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
