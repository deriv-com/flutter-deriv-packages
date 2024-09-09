import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
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
      return ListView(
        children: _activeDrawingTools
            .map(
              (option) => ListTile(
            leading: const Icon(Icons.line_axis),
            title: Text(option),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        )
            .toList(),
      );
    }
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
                Badge.count(count: count),
              ],
            ],
          ),
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
                  emptyStateIndicatorsIcon,
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
              context.mobileChartWrapperLocalizations.infoAddIndicator,
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
}