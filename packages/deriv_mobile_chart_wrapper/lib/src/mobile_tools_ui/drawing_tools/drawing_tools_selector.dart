import 'package:collection/collection.dart';
import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/active_drawing_tool_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/active_drawing_tool_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/drawing_tool_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/drawing_tool_list_item.dart';
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
      return _buildActiveDrawingToolsList();
    }
  }

  Widget _buildDrawingToolListTab(BuildContext context) {
    return ListView.builder(
      itemCount: _drawingTools.length,
      itemBuilder: (_, index) {
        final DrawingToolItemModel tool = _drawingTools[index];

        return Interaction(
          isEnabled: true,
          child: DrawingToolListItem(
            key: ValueKey('${tool.title}-$index'),
            iconAssetPath: tool.icon,
            title: tool.title,
            count: _getDrawingToolCount(tool),
            onTap: () {
              drawingToolsRepo.add(
                tool.config.copyWith(
                  number: drawingToolsRepo.getNumberForNewAddOn(tool.config),
                ),
              );
              widget.onDrawingToolSelected?.call(tool.config);
            },
          ),
        );
      },
    );
  }

  int _getDrawingToolCount(DrawingToolItemModel drawingTool) {
    return drawingToolsRepo.items
        .where((item) => item.runtimeType == drawingTool.config.runtimeType)
        .length;
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

  Widget _buildActiveDrawingToolsList() {
    return Column(
      children: <Widget>[
        _buildActiveDrawingToolsActionBar(),
        Expanded(
          child: ListView.separated(
            itemCount: drawingToolsRepo.items.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: ThemeProvider.margin08),
            itemBuilder: (_, index) {
              final DrawingToolConfig drawingToolConfig =
                  drawingToolsRepo.items[index];
              return ActiveDrawingToolListItem(
                iconAssetPath:
                    getDrawingToolIconPath(drawingToolConfig.runtimeType),
                title: getDrawingToolTitleWithCount(drawingToolConfig, context),
                //'${getDrawingToolTitle(drawingToolConfig, context)} $index',
                onTapDelete: () async {
                  drawingToolsRepo.removeAt(index);
                  _revampToolsNumbers(drawingToolConfig, index);
                  if (drawingToolsRepo.items.length == 0)
                    Navigator.pop(context);
                },
                onTapSettings: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActiveDrawingToolsActionBar() => Padding(
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
              visible: drawingToolsRepo.items.isNotEmpty,
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
      negativeButtonLabel: context.mobileChartWrapperLocalizations.labelCancel,
      showLoadingIndicator: false,
      onPositiveActionPressed: () {
        drawingToolsRepo.clear();
        Navigator.of(context)
          ..pop()
          ..pop();
      },
      onNegativeActionPressed: () {
        Navigator.pop(context);
      });

  void _revampToolsNumbers(DrawingToolConfig config, int index) {
    for (int i = index; i < drawingToolsRepo.items.length; i++) {
      DrawingToolConfig toolConfig = drawingToolsRepo.items[i];
      if (toolConfig.number != 0 &&
          toolConfig.runtimeType == config.runtimeType) {
        toolConfig = toolConfig.copyWith(
          number: toolConfig.number - 1,
        );
        drawingToolsRepo.updateAt(i, toolConfig);
      }
    }
  }
}
