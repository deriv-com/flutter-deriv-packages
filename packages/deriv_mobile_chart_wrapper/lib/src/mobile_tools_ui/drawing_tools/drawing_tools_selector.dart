import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/active_drawing_tool_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/drawing_tool_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DrawingToolSelector extends StatefulWidget {
  const DrawingToolSelector({
    required this.onSelection,
    super.key,
  });

  /// Drawing tools selection callback.
  final void Function(DrawingToolConfig drawingToolConfig)? onSelection;

  @override
  State<DrawingToolSelector> createState() => _DrawingToolSelectorState();
}

class _DrawingToolSelectorState extends State<DrawingToolSelector>
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
    _drawingTools = getDrawingToolsList(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
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
                    text:
                        '${context.mobileChartWrapperLocalizations.labelActive} (${_activeDrawingTools.length})'),
                Tab(text: context.mobileChartWrapperLocalizations.labelTools),
              ],
            ),
          ],
        ),
        Expanded(
          child: Ink(
            color: context.theme.colors.primary,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildActiveDrawingToolsTab(context),
                _buildDrawingToolListTab(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveDrawingToolsTab(BuildContext context) {
    if (drawingToolsRepo.items.isEmpty) {
      return _buildDrawingToolEmptyState();
    } else {
      return _buildActiveDrawingToolsList();
    }
  }

  Widget _buildActiveDrawingToolsList() {
    return Column(
      children: <Widget>[
        _buildActiveTabHeader(),
        Expanded(
          child: ListView.separated(
            itemCount: drawingToolsRepo.items.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: ThemeProvider.margin08),
            itemBuilder: (_, index) {
              final DrawingToolConfig drawingToolConfig =
                  drawingToolsRepo.items[index];
              print('indexxxxxx $index');
              print('drawingToolConfig.number ${drawingToolConfig.number}');
              print('drawingToolConfig.number ${drawingToolConfig}');
              return ActiveDrawingToolListItem(
                iconAssetPath: getDrawingToolIconPath(drawingToolConfig),
                title: getDrawingToolTitleWithCount(drawingToolConfig, context),
                //'${getDrawingToolTitle(drawingToolConfig, context)} $index',
                onTapDelete: () async {
                  await _showDeleteDrawingToolDialog(drawingToolConfig, index);
                },
                onTapSettings: () {},
              );
            },
          ),
        ),
      ],
    );
  }

  /// Returns the number of active drawing tools for specified [drawingTool].
  int _getDrawingToolCount(DrawingToolItemModel drawingTool) {
    return drawingToolsRepo.items
        .where((item) => item.runtimeType == drawingTool.config.runtimeType)
        .length;
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
            },
          ),
        );
      },
    );
  }

  Widget _buildDrawingToolEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                    color: const Color(0xFF999999),
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
            onPressed: () {
              setState(() {
                _tabController.animateTo(1);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActiveTabHeader() {
    return Padding(
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
  }

  /// Returns the path to the icon of the drawing tool for the given [config].
  String getDrawingToolIconPath(DrawingToolConfig config) {
    switch (config.runtimeType) {
      case LineDrawingToolConfig:
        return lineIcon;
      case RayDrawingToolConfig:
        return rsiIcon;
      default:
        return '';
    }
  }

  Future<void> _showDeleteDrawingToolDialog(
          DrawingToolConfig config, int index) =>
      showAlertDialog(
          context: context,
          title: 'delete',
          content: Text(
            context.mobileChartWrapperLocalizations.infoDeleteIndicator,
            style: TextStyles.subheading,
          ),
          positiveActionLabel:
              context.mobileChartWrapperLocalizations.labelDelete,
          negativeButtonLabel:
              context.mobileChartWrapperLocalizations.labelCancel,
          showLoadingIndicator: false,
          onPositiveActionPressed: () {
            drawingToolsRepo.removeAt(index);
            _revampToolsNumbers(config, index);
            Navigator.pop(context);
          },
          onNegativeActionPressed: () {
            Navigator.pop(context);
          });

  void _showDeleteAllDrawingToolsDialog() {
    showAlertDialog(
        context: context,
        title: context.mobileChartWrapperLocalizations.labelDeleteAllIndicators,
        content: Text(
          context.mobileChartWrapperLocalizations.infoDeleteAllIndicators,
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
        onNegativeActionPressed: () {
          Navigator.pop(context);
        });
  }

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
