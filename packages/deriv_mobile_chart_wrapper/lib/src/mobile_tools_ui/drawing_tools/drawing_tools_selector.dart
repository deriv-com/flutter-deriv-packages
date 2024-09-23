import 'package:collection/collection.dart';
import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/active_drawing_tool_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/drawing_tool_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

/// Drawing tools selector widget. It allows users to select a drawing tool,
/// view active drawing tools, configure drawing tools, and delete all drawing
/// tools.
class DrawingToolsSelector extends StatefulWidget {
  const DrawingToolsSelector({
    required this.onDrawingToolSelected,
    super.key,
  });

  /// Drawing tools selection callback.
  final void Function(DrawingToolConfig drawingToolConfig)?
      onDrawingToolSelected;

  @override
  State<DrawingToolsSelector> createState() => _DrawingToolsSelectorState();
}

class _DrawingToolsSelectorState extends State<DrawingToolsSelector>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late List<DrawingToolItemModel> _drawingTools;

  late AddOnsRepository<DrawingToolConfig> drawingToolsRepo;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    drawingToolsRepo = Provider.of<AddOnsRepository<DrawingToolConfig>>(
      context,
    );
    _drawingTools = getDrawingToolsList(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildTabBar(context),
          Expanded(
            child: Ink(
              color: context.theme.colors.primary,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _buildActiveDrawingToolsTab(context),
                  _buildDrawingToolListTab(context),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildTabBar(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.theme.colors.disabled,
                  width: ThemeProvider.margin02,
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: context.theme.colors.danger,
            labelStyle: context.theme.textStyle(
              textStyle: TextStyles.body2,
              color: context.theme.colors.prominent,
            ),
            unselectedLabelStyle: context.theme.textStyle(
              textStyle: TextStyles.body1,
              color: context.theme.colors.general,
            ),
            tabs: [
              Tab(
                  text: '${context.mobileChartWrapperLocalizations.labelActive}'
                      ' (${drawingToolsRepo.items.length})'),
              Tab(text: context.mobileChartWrapperLocalizations.labelTools),
            ],
          ),
        ],
      );

  Widget _buildActiveDrawingToolsTab(BuildContext context) {
    final List<DrawingToolConfig> activeDrawingTools = drawingToolsRepo.items;

    if (activeDrawingTools.isEmpty) {
      return _buildEmptyActiveDrawingTools();
    } else {
      return _buildActiveDrawingToolsList(activeDrawingTools);
    }
  }

  Widget _buildDrawingToolListTab(BuildContext context) {
    final activeDrawingTools = drawingToolsRepo.items;
    final toolCounts = _computeToolCounts(activeDrawingTools);

    return ListView.builder(
      itemCount: _drawingTools.length,
      itemBuilder: (context, index) {
        final toolItem = _drawingTools[index];
        final count = toolCounts[toolItem.config.runtimeType] ?? 0;

        return DrawingToolItem(
          iconAssetPath: toolItem.icon,
          title: toolItem.title,
          count: count,
          onTap: () => widget.onDrawingToolSelected?.call(toolItem.config),
        );
      },
    );
  }

  Widget _buildEmptyActiveDrawingTools() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    emptyStateDrawingToolsIcon,
                    height: Dimens.iconSize48,
                    package: 'deriv_mobile_chart_wrapper',
                  ),
                  const SizedBox(height: ThemeProvider.margin08),
                  Text(
                    context.mobileChartWrapperLocalizations
                        .informNoActiveDrawingTools,
                    style: context.themeProvider.textStyle(
                      textStyle: TextStyles.body1,
                      color: context.theme.colors.lessProminent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: context.theme.colors.secondary,
            padding: const EdgeInsets.all(ThemeProvider.margin16),
            child: PrimaryButton(
              child: Text(
                context.mobileChartWrapperLocalizations.actionAddDrawingTool,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body2,
                  color: context.theme.colors.prominent,
                ),
              ),
              onPressed: () => _tabController.animateTo(1),
            ),
          ),
        ],
      );

  Widget _buildActiveDrawingToolsList(
    List<DrawingToolConfig> activeDrawingTools,
  ) =>
      Column(
        children: <Widget>[
          _buildActiveDrawingToolsActionBar(activeDrawingTools),
          Expanded(
            child: ListView.builder(
              itemCount: activeDrawingTools.length,
              itemBuilder: (BuildContext context, int index) {
                final activeDrawingToolItem = activeDrawingTools[index];
                final DrawingToolItemModel? drawingToolItem =
                    _drawingTools.firstWhereOrNull((element) =>
                        element.config.runtimeType ==
                        activeDrawingToolItem.runtimeType);

                if (drawingToolItem != null) {
                  return _buildActiveDrawingToolItem(
                    context,
                    toolIcon: drawingToolItem.icon,
                    title: drawingToolItem.title,
                    onTapDelete: () => drawingToolsRepo.removeAt(index),
                    onTapSettings: () {},
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      );

  Widget _buildActiveDrawingToolsActionBar(
    List<DrawingToolConfig> activeDrawingTools,
  ) =>
      Padding(
        padding: const EdgeInsets.only(
          top: ThemeProvider.margin16,
          bottom: ThemeProvider.margin08,
          left: ThemeProvider.margin16,
          right: ThemeProvider.margin16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: activeDrawingTools.isNotEmpty,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: SecondaryButton(
                onPressed: _showDeleteAllDrawingToolsDialog,
                child: Center(
                  child: Text(
                    context.mobileChartWrapperLocalizations.labelDeleteAll,
                    style: context.themeProvider.textStyle(
                      textStyle: TextStyles.caption,
                      color: context.themeProvider.colors.prominent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildActiveDrawingToolItem(
    BuildContext context, {
    required String toolIcon,
    required String title,
    required VoidCallback? onTapDelete,
    required VoidCallback? onTapSettings,
  }) =>
      Card(
        margin: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
          vertical: ThemeProvider.margin08,
        ),
        color: context.themeProvider.colors.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ThemeProvider.borderRadius08),
          ),
        ),
        child: ActiveDrawingToolItem(
          iconAssetPath: toolIcon,
          title: title,
          onTapDelete: onTapDelete,
          onTapSettings: onTapSettings,
        ),
      );

  Map<Type, int> _computeToolCounts(
    List<DrawingToolConfig> activeDrawingTools,
  ) =>
      activeDrawingTools.fold(
        <Type, int>{},
        (counts, tool) {
          counts[tool.runtimeType] = (counts[tool.runtimeType] ?? 0) + 1;
          return counts;
        },
      );

  // TODO(aliakbar-deriv): Update the title and content texts of the dialog
  //  once it is available in the deriv_localization package.
  void _showDeleteAllDrawingToolsDialog() => showAlertDialog(
        context: context,
        title: 'Delete all drawing tools',
        content: Text(
          'This will delete all active drawing tools.',
          style: TextStyles.subheading,
        ),
        positiveActionLabel:
            context.mobileChartWrapperLocalizations.labelDeleteAll,
        negativeButtonLabel:
            context.mobileChartWrapperLocalizations.labelCancel,
        showLoadingIndicator: false,
        onPositiveActionPressed: () {
          drawingToolsRepo.clear();
          Navigator.pop(context);
        },
        onNegativeActionPressed: () => Navigator.pop(context),
      );
}
