import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/constants.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/config_item_model.dart';
import 'package:flutter/material.dart';

/// Controller for managing tools.
class ToolsController extends ChangeNotifier {
  /// Creates a [ToolsController] with optional configuration for indicators and drawing tools.
  ToolsController({
    this.indicatorsEnabled = true,
    this.drawingToolsEnabled = true,
  });

  /// Whether indicators are enabled.
  final bool indicatorsEnabled;

  /// Whether drawing tools are enabled.
  final bool drawingToolsEnabled;

  /// Callback to show the indicators tools menu.
  VoidCallback? onShowIndicatorsToolsMenu;

  /// Callback to show the drawing tools menu.
  VoidCallback? onShowDrawingToolsMenu;

  /// Config items.
  ConfigItemModel? _configs;

  /// Current config items.
  ConfigItemModel? get configs => _configs;

  /// Drawing tools data.
  DrawingTools? _drawingTools;

  /// Current drawing tools data.
  DrawingTools? get drawingToolsData => _drawingTools;

  /// Updates the drawing tools data.
  void updateDrawingToolsData(DrawingTools? drawingTools) {
    _drawingTools = drawingTools;
    notifyListeners();
  }

  /// Updates the config items.
  void updateConfigs(ConfigItemModel configItemModel) {
    _configs = configItemModel;
    notifyListeners();
  }

  /// Shows the indicators tools menu.
  void showIndicatorsToolsMenu() => onShowIndicatorsToolsMenu?.call();

  /// Shows the drawing tools menu.
  void showDrawingToolsMenu() => onShowDrawingToolsMenu?.call();

  /// Returns the count of active drawing tools.
  int get activeDrawingToolsCount =>
      _configs?.drawingToolConfigs
          .where((DrawingToolConfig config) =>
              config.drawingData?.isDrawingFinished ?? false)
          .length ??
      0;

  /// Returns true if the drawing tool info bar should be shown.
  bool get showDrawingToolInfoBar {
    // Check if a drawing tool is selected.
    final bool isDrawingToolSelected =
        _drawingTools?.selectedDrawingTool != null;

    // Check if the selected drawing tool should show the info bar.
    final bool isDrawingToolSupportsInfoBar = drawingToolTypesToShowInfoBar
        .contains(_drawingTools?.selectedDrawingTool?.runtimeType);

    return isDrawingToolSelected && isDrawingToolSupportsInfoBar;
  }
}
