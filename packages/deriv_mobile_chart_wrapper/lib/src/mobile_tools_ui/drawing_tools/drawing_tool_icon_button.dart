import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chart_setting_button_with_background.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/tools_controller.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Drawing tool Icon button.
class DrawingToolIconButton extends StatelessWidget {
  /// Initializes a new instance of [DrawingToolIconButton].
  const DrawingToolIconButton({
    required this.toolsController,
    Key? key,
  }) : super(key: key);

  /// Tools controller.
  final ToolsController toolsController;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: toolsController,
        builder: (_, __) {
          final activeDrawingToolsCount =
              toolsController.activeDrawingToolsCount;

          return DerivBadge(
            count: activeDrawingToolsCount,
            child: ChartSettingButtonWithBackground(
              onTap: toolsController.showDrawingToolsMenu,
              child: SvgPicture.asset(
                drawingToolIcon,
                width: ThemeProvider.iconSize18,
                height: ThemeProvider.iconSize18,
                package: 'deriv_mobile_chart_wrapper',
              ),
            ),
          );
        },
      );
}
