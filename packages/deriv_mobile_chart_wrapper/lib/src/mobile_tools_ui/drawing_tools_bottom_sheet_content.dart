import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/enums.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/active_drawing_tool_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tool_description_bottom_sheet.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tool_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/drawing_tool_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../core_widgets/no_glow_scroll_behavior.dart';

/// Bottom sheet content to show the list of supported drawing tools
/// for the mobile version.
class DrawingToolsBottomSheetContent extends StatefulWidget {
  /// Initializes the bottom sheet content.
  const DrawingToolsBottomSheetContent({super.key});

  @override
  State<DrawingToolsBottomSheetContent> createState() =>
      _DrawingToolsBottomSheetContentState();
}

class _DrawingToolsBottomSheetContentState
    extends State<DrawingToolsBottomSheetContent> with SingleTickerProviderStateMixin{
  DrawingToolLabel _selectedTab = DrawingToolLabel.tools;

  // /// Returns `true` if the limit of active indicators is reached.
  // bool get isLimitReached => drawingToolsRepo.items.length >= 3;

  late AddOnsRepository<DrawingToolConfig> drawingToolsRepo;

  late List<DrawingToolItemModel> drawingTools;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _setupTabController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    drawingToolsRepo = Provider.of<AddOnsRepository<DrawingToolConfig>>(context);
    drawingTools = [
      DrawingToolItemModel(
        title: 'Line',
        icon: lineIcon,
        config: const LineDrawingToolConfig(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('heeeeeeeeeelllllllllllooooooooooooo drawing tools');
    return _buildTabs(context);
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     Expanded(
    //       child: Ink(
    //         color: context.theme.colors.primary,
    //         child: Column(
    //           children: [
    //             const SizedBox(height: ThemeProvider.margin16),
    //             _buildTabs(context),
    //             const SizedBox(height: ThemeProvider.margin16),
    //             // if (isLimitReached && _selectedChip != IndicatorTabLabel.active)
    //             //   _buildLimitInfoBanner(),
    //             // Expanded(
    //             //     child: _selectedChip == IndicatorTabLabel.active
    //             //         ? _buildIndicatorsActiveTab()
    //             //         : _buildIndicatorsList(
    //             //             getFilteredIndicators(indicators))),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildActiveTabHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeProvider.margin16,
      ),
      child: Row(
        children: [
          Text(
            context.mobileChartWrapperLocalizations.infoUpto3indicatorsAllowed,
            style: context.themeProvider.textStyle(
              textStyle: TextStyles.caption,
              color: context.themeProvider.colors.general,
            ),
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          Visibility(
            visible: drawingToolsRepo.items.isNotEmpty,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: SecondaryButton(
              onPressed: drawingToolsRepo.clear,
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

  DefaultTabController _buildTabs(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: context.theme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(ThemeProvider.margin48),
        child: Stack(
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
              tabs: <Widget>[
                _buildTabButton('Active'),
                _buildTabButton('Tools'),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          // _buildIndicatorsActiveTab(),
          _buildDrawingToolsList(drawingTools),
        ],
      ),
    ),
  );

  Widget _buildTabButton(String title) => Container(
    height: 46,
    child: Center(child: Text(title)),
  );

  Widget _buildDrawingToolsList(List<DrawingToolItemModel> drawingToolsList) {
    return ListView.builder(
      itemCount: drawingToolsList.length,
      itemBuilder: (_, index) {
        final DrawingToolItemModel drawingTool = drawingToolsList[index];

        return Interaction(
          isEnabled: true,
          child: DrawingToolListItem(
            iconAssetPath: drawingTool.icon,
            title: drawingTool.title,
            count: _getDrawingToolsCount(drawingTool),
            onTap: () {
              // drawingToolsRepo.add(
              //   drawingTool.config.copyWith(
              //     number: drawingToolsRepo.getNumberForNewAddOn(drawingTool.config),
              //   ),
              // );
            },
          ),
        );
      },
    );
  }

  Widget _buildIndicatorsActiveTab() {
    return Column(
      children: [
        _buildActiveTabHeader(),
        const SizedBox(height: ThemeProvider.margin16),
        Expanded(
          child: drawingToolsRepo.items.isEmpty
              ? _buildDrawingToolEmptyState()
              : _buildActiveDrawingToolsList(),
        ),
      ],
    );
  }

  Widget _buildActiveDrawingToolsList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: ThemeProvider.margin16,
        right: ThemeProvider.margin16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: drawingToolsRepo.items.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: ThemeProvider.margin08),
              itemBuilder: (_, index) {
                final DrawingToolConfig drawingToolConfig =
                drawingToolsRepo.items[index];
                return ActiveDrawingToolListItem(
                  iconAssetPath: getDrawingToolIconPath(drawingToolConfig),
                  title: 'dddddd',
                  onTapDelete: () => drawingToolsRepo.removeAt(index),
                );
              },
            ),
          ),
        ],
      ),
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
                Text('No active drawing tools'
                  // context
                  //     .mobileChartWrapperLocalizations.infoNoActiveDrawingTools,
                  // style: context.themeProvider.textStyle(
                  //   textStyle: TextStyles.body1,
                  //   color: const Color(0xFF999999),
                  // ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: context.theme.colors.secondary,
          padding: const EdgeInsets.all(ThemeProvider.margin16),
          child: PrimaryButton(
            child: Text('Add drawing tool'
              // context.mobileChartWrapperLocalizations.infoAddDrawingTool,
              // style: context.theme.textStyle(
              //   textStyle: TextStyles.body2,
              //   color: context.theme.colors.prominent,
              // ),
            ),
            onPressed: () {
              setState(() {
                _selectedTab = DrawingToolLabel.tools;
              });
            },
          ),
        ),
      ],
    );
  }

  /// Returns the number of active drawing tools for specified [drawingTool].
  int _getDrawingToolsCount(DrawingToolItemModel drawingTool) {
    return drawingToolsRepo.items
        .where((item) => item.runtimeType == drawingTool.config.runtimeType)
        .length;
  }

  void _setupTabController() {
    _tabController = TabController(vsync: this, length: 2)
      ..addListener(() => setState(() {}));

  }
}
