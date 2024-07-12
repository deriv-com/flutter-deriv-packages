import 'dart:ui';

/// Controller class to show tools menu.
class ToolsController {
  /// Initializes the tools controller.
  ToolsController({this.indicatorsEnabled = true});

  /// Whether indicators are enabled or not.
  final bool indicatorsEnabled;

  /// Called to show indicators tools menu.
  VoidCallback? onShowIndicatorsToolsMenu;

  /// Shows indicators tools menu.
  void showIndicatorsToolsMenu() => onShowIndicatorsToolsMenu?.call();

  /// Shows drawing tools menu.
  void showDrawingToolsMenu() {
    // TODO(Ramin): Call the callback for drawing tools.
  }
}
