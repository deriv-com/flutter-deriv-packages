import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
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
  final List<DrawingToolConfig> _drawingTools = [
    const LineDrawingToolConfig(
      lineStyle: LineStyle(thickness: 0.9, color: BrandColors.coral),
    ),
    const RayDrawingToolConfig(),
  ];

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _buildTabBar(context),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildActiveDrawingToolsTab(context),
                _buildDrawingToolListTab(context),
              ],
            ),
          ),
        ],
      );

  Widget _buildTabBar(BuildContext context) => TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            text: '${context.mobileChartWrapperLocalizations.labelActive} '
                '(${drawingToolsRepo.items.length})',
          ),
          Tab(text: context.mobileChartWrapperLocalizations.labelTools),
        ],
      );

  Widget _buildActiveDrawingToolsTab(BuildContext context) {
    final activeDrawingTools = drawingToolsRepo.items;

    if (activeDrawingTools.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                context
                    .mobileChartWrapperLocalizations.informNoActiveDrawingTools,
              ),
            ),
          ),
          const SizedBox(height: ThemeProvider.margin16),
          Container(
            padding: const EdgeInsets.all(ThemeProvider.margin16),
            child: PrimaryButton(
              onPressed: () => _tabController.animateTo(1),
              child: Text(
                context.mobileChartWrapperLocalizations.actionAddDrawingTool,
                style: context.theme.textStyle(textStyle: TextStyles.body2),
              ),
            ),
          ),
        ],
      );
    } else {
      return ListView.builder(
        itemCount: activeDrawingTools.length,
        itemBuilder: (context, index) {
          final tool = activeDrawingTools[index];

          return _buildDrawingToolItem(
            context,
            tool: tool,
            onDeleted: () => drawingToolsRepo.removeAt(index),
          );
        },
      );
    }
  }

  Widget _buildDrawingToolItem(
    BuildContext context, {
    required DrawingToolConfig tool,
    VoidCallback? onDeleted,
  }) =>
      ListTile(
        leading: const Icon(Icons.line_axis),
        title: Text(_getToolItemTitle(context, tool)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined),
            ),
            IconButton(
              onPressed: onDeleted,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      );

  Widget _buildDrawingToolListTab(BuildContext context) {
    final activeDrawingTools = drawingToolsRepo.items;
    final toolCounts = _computeToolCounts(activeDrawingTools);

    return ListView(
      children: _drawingTools.map((tool) {
        final count = toolCounts[tool.runtimeType] ?? 0;

        return ListTile(
          leading: const Icon(Icons.line_axis),
          title: Row(
            children: <Widget>[
              Text(_getToolItemTitle(context, tool)),
              if (count > 0) ...[
                const SizedBox(width: ThemeProvider.margin08),
                Badge.count(
                  count: count,
                  backgroundColor: context.theme.colors.danger,
                  textStyle: context.theme.textStyle(
                    textStyle: TextStyles.badgeCounter,
                  ),
                  textColor: context.theme.colors.prominent,
                ),
              ],
            ],
          ),
          onTap: () => widget.onSelection?.call(tool),
        );
      }).toList(),
    );
  }

  Map<Type, int> _computeToolCounts(
    List<DrawingToolConfig> activeDrawingTools,
  ) {
    final Map<Type, int> counts = <Type, int>{};

    for (DrawingToolConfig tool in activeDrawingTools) {
      counts[tool.runtimeType] = (counts[tool.runtimeType] ?? 0) + 1;
    }

    return counts;
  }

  String _getToolItemTitle(
    BuildContext context,
    DrawingToolConfig drawingTool,
  ) {
    final Map<Type, String> titles = {
      LineDrawingToolConfig: context.mobileChartWrapperLocalizations.labelLine,
      RayDrawingToolConfig: context.mobileChartWrapperLocalizations.labelRay,
    };

    return titles[drawingTool.runtimeType] ?? '-';
  }
}
