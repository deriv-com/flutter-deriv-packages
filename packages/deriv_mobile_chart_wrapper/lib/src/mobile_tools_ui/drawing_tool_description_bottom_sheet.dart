import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_item_model.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class DrawingToolDescriptionBottomSheet extends StatelessWidget {
  const DrawingToolDescriptionBottomSheet({
    super.key,
    required this.drawingTool,
    required this.onAddDrawingToolPressed,
  });

  final DrawingToolItemModel drawingTool;
  final VoidCallback onAddDrawingToolPressed;

  @override
  Widget build(BuildContext context) {
    return DerivBottomSheet(
      title: drawingTool.title,
      showBackButton: true,
      hasActionButton: true,
      actionButtonLabel: drawingTool.title,
      onActionButtonPressed: onAddDrawingToolPressed,
      child: ColoredBox(
        color: context.theme.colors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: ThemeProvider.margin16,
            horizontal: ThemeProvider.margin16,
          ),
          child: Text(
            drawingTool.title,
            style: context.theme.textStyle(
              textStyle: TextStyles.body1,
              color: context.theme.colors.general,
            ),
          ),
        ),
      ),
    );
  }
}
