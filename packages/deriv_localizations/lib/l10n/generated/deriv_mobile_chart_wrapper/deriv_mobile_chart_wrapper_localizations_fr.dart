import 'deriv_mobile_chart_wrapper_localizations.dart';

/// The translations for French (`fr`).
class DerivMobileChartWrapperLocalizationsFr extends DerivMobileChartWrapperLocalizations {
  DerivMobileChartWrapperLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get labelIndicators => 'Indicateurs';

  @override
  String get labelActive => 'Actif';

  @override
  String get labelAll => 'Tous';

  @override
  String get labelMomentum => 'L\'élan';

  @override
  String get labelVolatility => 'Volatilité';

  @override
  String get labelMovingAverages => 'Moyennes mobiles';

  @override
  String get labelMACD => 'MACD';

  @override
  String get labelRelativeStrengthIndex => 'Indice de force relative (IFR)';

  @override
  String get labelRSI => 'RSI';

  @override
  String get labelBollingerBands => 'Bandes de Bollinger (BB)';

  @override
  String get labelBB => 'BB';

  @override
  String get labelMovingAverage => 'Moyenne mobile (MA)';

  @override
  String get labelMA => 'MA';

  @override
  String get infoMACD => 'Le MACD est un indicateur de trading utilisé dans l\'analyse technique des cours boursiers. Il est censé révéler les changements dans la force, la direction, l\'élan et la durée d\'une tendance dans le prix d\'une action.';

  @override
  String get infoRSI => 'L\'indice de force relative (RSI) a été publié par J. Welles Wilder. Le prix actuel est normalisé en pourcentage entre 0 et 100. Le flutter_chart_id de cet oscillateur est trompeur car il ne compare pas l\'instrument par rapport à un autre instrument ou à un ensemble d\'instruments, mais représente plutôt le prix actuel par rapport à d\'autres pièces récentes dans la longueur de la fenêtre d\'observation sélectionnée.';

  @override
  String get infoBB => 'Les bandes de Bollinger (BB) peuvent être utilisées pour mesurer la hausse ou la baisse du prix par rapport aux transactions précédentes.';

  @override
  String get infoMA => 'La moyenne mobile (MA) permet d\'identifier la tendance générale du marché en filtrant les fluctuations de prix à court terme. À l\'aide de données historiques, elle calcule le prix moyen sur une période donnée et trace une ligne sur le graphique. Si la ligne de la MA se déplace vers le haut, il s\'agit d\'un indicateur de tendance haussière, et si elle se déplace vers le bas, il s\'agit d\'un indicateur de tendance baissière. Un signal d\'achat se produit lorsque le prix passe au-dessus de la ligne MA.';

  @override
  String get infoMaximumActiveIndicatorsAdded => 'Vous avez ajouté le nombre maximum d\'indicateurs actifs.';

  @override
  String infoAddSelectedIndicator(Object indicator) {
    return 'Ajoutez $indicator';
  }

  @override
  String get infoAddIndicator => 'Ajouter un indicateur';

  @override
  String get labelDeleteAllIndicators => 'Supprimer tous les indicateurs';

  @override
  String get infoDeleteAllIndicators => 'Cette opération supprime tous les indicateurs actifs.';

  @override
  String infoResetIndicators(Object indicator) {
    return 'Cela réinitialisera les paramètres par défaut de l\'indicateur $indicator .';
  }

  @override
  String labelDeleteIndicator(Object indicator) {
    return 'Indicateur de suppression $indicator';
  }

  @override
  String labelResetIndicator(Object indicator) {
    return 'Réinitialiser l\'indicateur $indicator';
  }

  @override
  String get infoDeleteIndicator => 'Êtes-vous sûr de vouloir supprimer cet indicateur ?';

  @override
  String get labelCancel => 'Annuler';

  @override
  String get labelDelete => 'Supprimer';

  @override
  String get labelDeleteAll => 'Supprimer tout';

  @override
  String get infoUpto3indicatorsAllowed => 'Jusqu\'à 3 indicateurs actifs sont autorisés.';

  @override
  String get infoNoActiveIndicators => 'Aucun indicateur actif.';

  @override
  String get labelReset => 'Remise à zéro';

  @override
  String get labelApply => 'Appliquer';

  @override
  String get labelOK => 'OK';

  @override
  String get labelRSILine => 'Ligne RSI';

  @override
  String get labelPeriod => 'Période';

  @override
  String get labelMinRange => 'Plage minimale';

  @override
  String get labelMaxRange => 'Portée maximale';

  @override
  String get labelSource => 'Source';

  @override
  String get labelClose => 'Fermer';

  @override
  String get labelOpen => 'Ouvrir';

  @override
  String get labelHigh => 'Haut';

  @override
  String get labelLow => 'Faible';

  @override
  String get labelHl2 => 'Hl/2';

  @override
  String get labelHlc3 => 'Hlc/3';

  @override
  String get labelHlcc4 => 'Hlcc/4';

  @override
  String get labelOhlc4 => 'Ohlc/4';

  @override
  String get labelShowZones => 'Afficher les zones';

  @override
  String get labelOverbought => 'Surachat';

  @override
  String get labelOversold => 'Survente';

  @override
  String get labelMinSize => 'Taille minimale';

  @override
  String get labelMaxSize => 'Taille maximale';

  @override
  String get labelRange => 'Gamme';

  @override
  String get labelOverboughtLine => 'Ligne de surachat';

  @override
  String get labelOversoldLine => 'Ligne de survente';

  @override
  String get labelMACDLine => 'Ligne MACD';

  @override
  String get labelFastMAPeriod => 'Période d\'AM rapide';

  @override
  String get labelSlowMAPeriod => 'Période d\'AM lente';

  @override
  String get labelSignalLine => 'Ligne de signal';

  @override
  String get labelSignalPeriod => 'Période du signal';

  @override
  String get labelIncreasingBar => 'Augmentation de la barre';

  @override
  String get labelDecreasingBar => 'Barre décroissante';

  @override
  String get labelBollingerBandsTop => 'Sommet des bandes de Bollinger';

  @override
  String get labelBollingerBandsMedian => 'Bandes de Bollinger médianes';

  @override
  String get labelBollingerBandsBottom => 'Fond des bandes de Bollinger';

  @override
  String get labelChannelFill => 'Remplissage du canal';

  @override
  String get labelFillColor => 'Couleur de remplissage';

  @override
  String get labelStandardDeviations => 'Écarts types';

  @override
  String get labelMovingAverageType => 'Type de moyenne mobile';

  @override
  String get labelMALine => 'Ligne MA';

  @override
  String get labelOffset => 'Décalage';

  @override
  String get labelType => 'Type';

  @override
  String get labelSimple => 'Simple';

  @override
  String get labelExponential => 'Exponentiel';

  @override
  String get labelWeighted => 'Pondéré';

  @override
  String get labelHull => 'Coque';

  @override
  String get labelZeroLag => 'Zéro lag';

  @override
  String get labelTimeSeries => 'Séries chronologiques';

  @override
  String get labelWellesWilder => 'Welles Wilder';

  @override
  String get labelVariable => 'Variable';

  @override
  String get labelTriangular => 'Triangulaire';

  @override
  String get label2Exponential => '2-Exponentiel';

  @override
  String get label3Exponential => '3-Exponentiel';

  @override
  String warnEnterValueBetweenMinMax(Object max, Object min) {
    return 'Saisissez une valeur comprise entre $min et $max';
  }

  @override
  String warnRangeMinMax(Object max, Object min) {
    return 'Gamme $min - $max';
  }

  @override
  String get labelDrawingTools => 'Outils de dessin';

  @override
  String get labelTools => 'Outils';

  @override
  String get labelLine => 'Ligne';

  @override
  String get labelRay => 'Ray';

  @override
  String get informTapToSetFirstPoint => 'Touchez pour définir le premier point';

  @override
  String get informTapToSetFinalPoint => 'Touchez pour définir le point final';

  @override
  String get informNoActiveDrawingTools => 'Aucun outil de dessin actif.';

  @override
  String get actionAddDrawingTool => 'Ajouter un outil de dessin';

  @override
  String get labelOf => 'de';

  @override
  String get labelDeleteAllDrawingTools => 'Supprimer tous les outils de dessin';

  @override
  String get informDeleteAllDrawingTools => 'Cela supprimera tous les outils de dessin actifs.';
}
