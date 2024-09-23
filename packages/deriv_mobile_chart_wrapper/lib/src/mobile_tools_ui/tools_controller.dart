import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/config_item_model.dart';
import 'package:flutter/material.dart';

/// Controller class to show tools menu.
class ToolsController extends ChangeNotifier {
  /// Initializes the tools controller.
  ToolsController({
    this.indicatorsEnabled = true,
    this.drawingToolsEnabled = true,
  });

  /// Whether indicators are enabled or not.
  final bool indicatorsEnabled;

  /// Whether drawing tools are enabled or not.
  final bool drawingToolsEnabled;

  /// Called to show indicators tools menu.
  VoidCallback? onShowIndicatorsToolsMenu;

  /// Called to show drawing tools menu.
  VoidCallback? onShowDrawingToolsMenu;

  /// Config items.
  ConfigItemModel? _configs;

  /// Gets the config items.
  ConfigItemModel? get configs => _configs;

  /// Updates the config items.
  void updateConfigs(ConfigItemModel configItemModel) {
    _configs = configItemModel;
    notifyListeners();
  }

  /// Shows indicators tools menu.
  void showIndicatorsToolsMenu() => onShowIndicatorsToolsMenu?.call();

  /// Shows drawing tools menu.
  void showDrawingToolsMenu() => onShowDrawingToolsMenu?.call();

  /// Returns the count of active drawing tools.
  int get activeDrawingToolsCount =>
      _configs?.drawingToolConfigs
          .where((DrawingToolConfig config) =>
              config.drawingData?.isDrawingFinished ?? false)
          .length ??
      0;
}
