import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_info_bar_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays the drawing tool info bar.
class DrawingToolInfoBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a new [DrawingToolInfoBar].
  const DrawingToolInfoBar({
    required this.toolsController,
    this.onClosed,
    super.key,
  });

  /// The controller for drawing tools.
  final ToolsController toolsController;

  /// Callback invoked when the info bar is closed.
  final VoidCallback? onClosed;

  @override
  Size get preferredSize => const Size.fromHeight(ThemeProvider.margin56);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: toolsController,
        builder: (context, _) {
          final DrawingToolConfig? drawingTool =
              toolsController.drawingToolsData?.selectedDrawingTool;

          if (drawingTool == null) {
            return const SizedBox.shrink();
          } else {
            return SafeArea(
              child: Container(
                color: context.theme.colors.secondary,
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeProvider.margin16,
                  vertical: ThemeProvider.margin08,
                ),
                child: _buildInfoBarContent(context, drawingTool),
              ),
            );
          }
        },
      );

  Widget _buildInfoBarContent(
    BuildContext context,
    DrawingToolConfig drawingTool,
  ) {
    final DrawingToolInfoBarModel infoBarData =
        _getInfoBarData(context, drawingTool: drawingTool);

    return Container(
      padding: const EdgeInsets.all(ThemeProvider.margin08),
      decoration: BoxDecoration(
        color: context.theme.colors.active,
        borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08),
      ),
      child: Row(
        children: <Widget>[
          _buildStepIndicator(context, infoBarData),
          const SizedBox(width: ThemeProvider.margin08),
          _buildTitle(context, title: infoBarData.title),
          const SizedBox(width: ThemeProvider.margin08),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(
    BuildContext context,
    DrawingToolInfoBarModel infoBarData,
  ) =>
      Container(
        padding: const EdgeInsets.all(ThemeProvider.margin04),
        decoration: BoxDecoration(
          color: context.theme.colors.lessProminent,
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
        ),
        child: Text(
          '${infoBarData.step} of ${infoBarData.totalSteps}',
          style: context.theme.textStyle(textStyle: TextStyles.caption),
        ),
      );

  Widget _buildTitle(BuildContext context, {required String title}) => Expanded(
        child: Text(
          title,
          style: context.theme.textStyle(textStyle: TextStyles.body1),
          textAlign: TextAlign.center,
        ),
      );

  Widget _buildCloseButton(BuildContext context) => GestureDetector(
        child: SvgPicture.asset(
          closeFilledIcon,
          width: ThemeProvider.iconSize24,
          height: ThemeProvider.iconSize24,
          package: 'deriv_mobile_chart_wrapper',
        ),
        onTap: () {
          toolsController.drawingToolsData?.init();
          toolsController
              .updateDrawingToolsData(toolsController.drawingToolsData);
          onClosed?.call();
        },
      );

  DrawingToolInfoBarModel _getInfoBarData(
    BuildContext context, {
    required DrawingToolConfig drawingTool,
  }) {
    if (drawingTool is LineDrawingToolConfig ||
        drawingTool is RayDrawingToolConfig) {
      final bool isDrawingToolSelected =
          toolsController.drawingToolsData?.selectedDrawingTool?.drawingData ==
              null;
      final bool isDrawingToolFinished = toolsController.drawingToolsData
              ?.selectedDrawingTool?.drawingData?.isDrawingFinished ??
          true;

      return DrawingToolInfoBarModel(
        step: isDrawingToolSelected ? '1' : '2',
        totalSteps: 2,
        title: !isDrawingToolFinished
            ? context.mobileChartWrapperLocalizations.informTapToSetFinalPoint
            : context.mobileChartWrapperLocalizations.informTapToSetFirstPoint,
      );
    }

    // Default case for unsupported drawing tools.
    return DrawingToolInfoBarModel(step: '-', totalSteps: 0, title: '');
  }
}
