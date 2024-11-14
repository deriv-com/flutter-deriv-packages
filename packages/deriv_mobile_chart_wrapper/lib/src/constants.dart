import 'package:deriv_chart/deriv_chart.dart';

// A set of drawing tool types that has to show drawing tool info bar.
const Set<Type> drawingToolTypesToShowInfoBar = {
  LineDrawingToolConfig,
  RayDrawingToolConfig,
};

/// Default key used for indicators if no custom key is provided.
const String defaultIndicatorsStoreKey = 'default_indicators_store';

/// Default key used for drawing tools if no custom key is provided.
const String defaultDrawingToolsStoreKey = 'default_drawing_tools_store';
