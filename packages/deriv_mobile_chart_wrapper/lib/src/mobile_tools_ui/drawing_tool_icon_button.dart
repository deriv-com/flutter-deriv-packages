import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chart_setting_button_with_background.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/tools_controller.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Drawing tool Icon button.
class DrawingToolIconButton extends StatefulWidget {
  /// Initializes a new instance of [DrawingToolIconButton].
  const DrawingToolIconButton({
    required this.toolsController,
    Key? key,
  }) : super(key: key);

  /// On tap callback.
  final ToolsController toolsController;

  @override
  State<DrawingToolIconButton> createState() => _DrawingToolIconButtonState();
}

class _DrawingToolIconButtonState extends State<DrawingToolIconButton> {
  /// No.of active drawing tools.
  /// This is used to show the count badge on the icon.
  /// The default value is 0. If the value is 0, the badge will not be shown.
  int _noOfActiveDrawingTools = 0;

  @override
  void initState() {
    super.initState();

    /// TODO(aliakbar-deriv): Implement the logic to get the no of active
    /// drawing tools.
    _noOfActiveDrawingTools = 2;
  }

  @override
  Widget build(BuildContext context) => DerivBadge(
        count: _noOfActiveDrawingTools,
        child: ChartSettingButtonWithBackground(
          onTap: () => widget.toolsController.showDrawingToolsMenu(),
          child: SvgPicture.asset(
            drawingToolIcon,
            width: ThemeProvider.margin18,
            height: ThemeProvider.margin18,
            package: 'deriv_mobile_chart_wrapper',
          ),
        ),
      );
}
