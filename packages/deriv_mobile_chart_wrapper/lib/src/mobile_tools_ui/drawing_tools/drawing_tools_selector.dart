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
  final List<DrawingToolItemModel> _activeDrawingTools = [];

  late List<DrawingToolItemModel> _drawingTools;

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

  void _onToolSelection(DrawingToolItemModel selectedTool) {
    setState(() {
      if (_activeDrawingTools.contains(selectedTool)) {
        _activeDrawingTools.remove(selectedTool);
      } else {
        _activeDrawingTools.add(selectedTool);
      }
    });
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
    if (_activeDrawingTools.isEmpty) {
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
          child: ListView(
            children: _activeDrawingTools
                .map(
                  (tool) => Card(
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
                    child: ActiveDrawingToolListItem(
                      iconAssetPath: tool.icon,
                      title: tool.title,
                      onTapDelete: () {},
                      onTapSettings: () {},
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawingToolListTab(BuildContext context) {
    return ListView(
      children: _drawingTools.map((toolItem) {
        final List<DrawingToolItemModel> selectedToolItems = _activeDrawingTools
            .where((DrawingToolItemModel activeToolItem) =>
                activeToolItem == toolItem)
            .toList();
        return DrawingToolListItem(
          iconAssetPath: toolItem.icon,
          title: toolItem.title,
          count: selectedToolItems.length,
          onTap: () => _onToolSelection(toolItem),
        );
      }).toList(),
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
            visible: _activeDrawingTools.isNotEmpty,
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
          _activeDrawingTools.clear();
          setState(() {});
          Navigator.pop(context);
        },
        onNegativeActionPressed: () {
          Navigator.pop(context);
        });
  }
}
