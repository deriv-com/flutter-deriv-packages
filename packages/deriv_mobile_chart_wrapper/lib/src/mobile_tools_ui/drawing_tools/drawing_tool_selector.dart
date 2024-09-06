import 'package:deriv_chart/deriv_chart.dart';
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
      lineStyle: LineStyle(thickness: 0.9, color: Colors.red),
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    drawingToolsRepo =
        Provider.of<AddOnsRepository<DrawingToolConfig>>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Active (${drawingToolsRepo.items.length})'),
            const Tab(text: 'Tools'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildActiveDrawingToolsTab(
                context,
                activeDrawingTools: drawingToolsRepo.items,
              ),
              _buildDrawingToolListTab(
                context,
                drawingTools: _drawingTools,
                activeDrawingTools: drawingToolsRepo.items,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActiveDrawingToolsTab(
    BuildContext context, {
    required List<DrawingToolConfig> activeDrawingTools,
  }) {
    if (activeDrawingTools.isEmpty) {
      return Column(
        children: <Widget>[
          const Expanded(
            child: Center(child: Text('No active drawing tools.')),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: () => _tabController.animateTo(1),
            child: const Text('Add drawing tool'),
          ),
        ],
      );
    } else {
      return ListView(
        children: activeDrawingTools
            .map(
              (activeDrawingToolItem) => ListTile(
                leading: const Icon(Icons.line_axis),
                title: Text(
                  _getToolItemTitle(
                    context,
                    drawingTool: activeDrawingToolItem,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings_outlined),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
    }
  }

  Widget _buildDrawingToolListTab(
    BuildContext context, {
    required List<DrawingToolConfig> drawingTools,
    required List<DrawingToolConfig> activeDrawingTools,
  }) {
    return ListView(
      children: drawingTools.map(
        (toolItem) {
          final count = activeDrawingTools
              .where((item) => item.runtimeType == toolItem.runtimeType)
              .length;

          return ListTile(
            leading: const Icon(Icons.line_axis),
            title: Row(
              children: <Widget>[
                Text(_getToolItemTitle(context, drawingTool: toolItem)),
                if (count > 0) ...[
                  const SizedBox(width: 8),
                  Badge.count(count: count),
                ],
              ],
            ),
            onTap: () => widget.onSelection?.call(toolItem),
          );
        },
      ).toList(),
    );
  }

  String _getToolItemTitle(
    BuildContext context, {
    required DrawingToolConfig drawingTool,
  }) {
    switch (drawingTool) {
      case LineDrawingToolConfig():
        return 'Line';
      case RayDrawingToolConfig():
        return 'Ray';
      default:
        return '-';
    }
  }
}
