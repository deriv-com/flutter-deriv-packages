import 'package:deriv_mobile_chart_wrapper/src/models/config_item_model.dart';
import 'package:flutter/material.dart';

/// Controller class to show tools menu.
class ToolsController extends ChangeNotifier {
  ConfigItemModel? _configItemModel;

  /// Returns config items.
  ConfigItemModel? get configs => _configItemModel;

  /// Initializes the tools controller.
  ToolsController({this.indicatorsEnabled = true});

  /// Whether indicators are enabled or not.
  final bool indicatorsEnabled;

  /// Called to show indicators tools menu.
  VoidCallback? onShowIndicatorsToolsMenu;

  /// Updates the config items.
  void updateConfigs(ConfigItemModel configItemModel) {
    _configItemModel = configItemModel;
    notifyListeners();
  }

  /// Shows indicators tools menu.
  void showIndicatorsToolsMenu() => onShowIndicatorsToolsMenu?.call();

  /// Shows drawing tools menu.
  void showDrawingToolsMenu() {
    // TODO(Ramin): Call the callback for drawing tools.
  }
}
