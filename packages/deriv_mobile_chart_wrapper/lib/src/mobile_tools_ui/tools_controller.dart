import 'package:deriv_mobile_chart_wrapper/src/models/config_item_model.dart';
import 'package:flutter/material.dart';

/// Controller class to show tools menu.
class ToolsController extends ChangeNotifier {
  /// Initializes the tools controller.
  ToolsController({
    this.indicatorsEnabled = true,
  });

  /// Whether indicators are enabled or not.
  final bool indicatorsEnabled;

  /// Called to show indicators tools menu.
  VoidCallback? onShowIndicatorsToolsMenu;

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
  void showDrawingToolsMenu() {
    // TODO(Ramin): Call the callback for drawing tools.
  }
}
