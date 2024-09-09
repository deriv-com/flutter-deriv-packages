import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawingToolSelector extends StatefulWidget {
  const DrawingToolSelector({super.key});

  @override
  State<DrawingToolSelector> createState() => _DrawingToolSelectorState();
}

class _DrawingToolSelectorState extends State<DrawingToolSelector>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _activeDrawingTools = [];
  final List<String> _drawingTools = ['Line', 'Ray'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onToolSelection(String selectedTool) {
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
                Tab(text: 'Active (${_activeDrawingTools.length})'),
                const Tab(text: 'Tools'),
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
                  (option) => Card(
                    margin: EdgeInsets.zero,
                    color: context.themeProvider.colors.secondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(ThemeProvider.borderRadius08),
                      ),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(
                        lineIcon,
                        height: Dimens.iconSize24,
                        package: 'deriv_mobile_chart_wrapper',
                      ),
                      title: Text(option),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: context.themeProvider.colors.prominent,
                            icon: const Icon(Icons.settings_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: context.themeProvider.colors.prominent,
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
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
        final List<String> selectedToolItems = _activeDrawingTools
            .where((String activeToolItem) => activeToolItem == toolItem)
            .toList();
        final count = selectedToolItems.length;

        return ListTile(
          leading: const Icon(Icons.line_axis),
          title: Row(
            children: <Widget>[
              Text(toolItem),
              if (selectedToolItems.isNotEmpty) ...[
                const SizedBox(width: 8),
                _buildIndicatorBadge(count),
              ],
            ],
          ),
          onTap: () => _onToolSelection(toolItem),
        );
      }).toList(),
    );
  }

  Widget _buildIndicatorBadge(int count) {
    return DerivBadge(
      count: count,
      enabled: count > 0,
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
                  'No active drawing tools',
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
              'Add drawing tool',
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
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeProvider.margin16,
        vertical: ThemeProvider.margin16,
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
              onPressed: _showDeleteAllIndicatorsDialog,
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

  void _showDeleteAllIndicatorsDialog() {
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
