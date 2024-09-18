import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chart_setting_button_with_background.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Drawing tool Icon button.
class DrawingToolIconButton extends StatelessWidget {
  /// Initializes a new instance of [DrawingToolIconButton].
  const DrawingToolIconButton({
    required this.onTap,
    this.noOfActiveDrawingTools = 0,
    Key? key,
  }) : super(key: key);

  /// On tap callback.
  final VoidCallback onTap;

  /// No.of active drawing tools.
  /// This is used to show the count badge on the icon.
  /// The default value is 0. If the value is 0, the badge will not be shown.
  final int noOfActiveDrawingTools;

  @override
  Widget build(BuildContext context) => DerivBadge(
        count: noOfActiveDrawingTools,
        child: ChartSettingButtonWithBackground(
          onTap: onTap,
          child: SvgPicture.asset(
            drawingToolIcon,
            width: ThemeProvider.margin18,
            height: ThemeProvider.margin18,
            package: 'deriv_mobile_chart_wrapper',
          ),
        ),
      );
}
