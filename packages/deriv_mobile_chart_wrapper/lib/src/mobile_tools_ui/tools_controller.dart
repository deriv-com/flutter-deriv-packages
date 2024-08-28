import 'dart:ui';

/// Controller class to show tools menu.
class ToolsController {
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

  /// Shows indicators tools menu.
  void showIndicatorsToolsMenu() => onShowIndicatorsToolsMenu?.call();



  /// Shows drawing tools menu.
  void showDrawingToolsMenu() => onShowDrawingToolsMenu?.call();
}
