import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/constants.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/indicator_event_service.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/drawing_tools/drawing_tools_selector.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/config_item_model.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_tab_label.dart';
import 'package:deriv_ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mobile_tools_ui/mobile_tools_bottom_sheet_content.dart';
import 'mobile_tools_ui/tools_controller.dart';

/// The mobile version wrapper around the [Chart] which handles adding/removing
/// indicators and drawing tools to the chart.
class MobileChartWrapper extends StatefulWidget {
  /// Initializes [MobileChartWrapper].
  const MobileChartWrapper({
    required this.mainSeries,
    required this.granularity,
    this.indicatorsStoreKey = defaultIndicatorsStoreKey,
    this.drawingToolsStoreKey = defaultDrawingToolsStoreKey,
    this.toolsController,
    this.markerSeries,
    this.controller,
    this.onCrosshairAppeared,
    this.onCrosshairDisappeared,
    this.onCrosshairHover,
    this.onVisibleAreaChanged,
    this.onQuoteAreaChanged,
    this.theme,
    this.isLive = false,
    this.dataFitEnabled = false,
    this.showCrosshair = true,
    this.annotations,
    this.opacity = 1.0,
    this.pipSize = 4,
    this.chartAxisConfig = const ChartAxisConfig(),
    this.maxCurrentTickOffset,
    this.msPerPx,
    this.minIntervalWidth,
    this.maxIntervalWidth,
    this.dataFitPadding,
    this.currentTickAnimationDuration,
    this.quoteBoundsAnimationDuration,
    this.showCurrentTickBlinkAnimation,
    this.verticalPaddingFraction,
    this.bottomChartTitleMargin,
    this.showDataFitButton,
    this.showScrollToLastTickButton,
    this.loadingAnimationColor,
    this.eventTracker,
    this.showIndicators = true,
    Key? key,
  }) : super(key: key);

  /// Chart's main data series
  final DataSeries<Tick> mainSeries;

  /// Open position marker series.
  final MarkerSeries? markerSeries;

  /// The key used to store the selected indicators in shared preferences.
  /// If no key is provided, the default key `'default'` is used.
  ///
  /// By using the same key when selecting indicators, the previously saved
  /// state will be restored, ensuring the tools are in the same configuration
  /// as before.
  final String indicatorsStoreKey;

  /// The key used to store the selected drawing tools in shared preferences.
  /// If no key is provided, the default key `'default'` is used.
  ///
  /// By using the same key when applying drawing tools, the previously applied
  /// tools state will be restored, ensuring the tools are in the same
  /// configuration as before.
  final String drawingToolsStoreKey;

  /// Chart's controller
  final ChartController? controller;

  /// Chart's tools controller.
  final ToolsController? toolsController;

  /// Number of digits after decimal point in price.
  final int pipSize;

  /// For candles: Duration of one candle in ms.
  /// For ticks: Average ms difference between two consecutive ticks.
  final int granularity;

  /// Called when crosshair details appear after long press.
  final VoidCallback? onCrosshairAppeared;

  /// Called when the crosshair is dismissed.
  final VoidCallback? onCrosshairDisappeared;

  /// Called when the crosshair cursor is hovered/moved.
  final OnCrosshairHoverCallback? onCrosshairHover;

  /// Called when chart is scrolled or zoomed.
  final VisibleAreaChangedCallback? onVisibleAreaChanged;

  /// Callback provided by library user.
  final VisibleQuoteAreaChangedCallback? onQuoteAreaChanged;

  /// Chart's theme.
  final ChartTheme? theme;

  /// Chart's annotations
  final List<ChartAnnotation<ChartObject>>? annotations;

  /// Configurations for chart's axes.
  final ChartAxisConfig chartAxisConfig;

  /// Whether the chart should be showing live data or not.
  /// In case of being true the chart will keep auto-scrolling when its visible
  /// area is on the newest ticks/candles.
  final bool isLive;

  /// Starts in data fit mode and adds a data-fit button.
  final bool dataFitEnabled;

  /// Chart's opacity, Will be applied on the [mainSeries].
  final double opacity;

  /// Whether the crosshair should be shown or not.
  final bool showCrosshair;

  /// Max distance between rightBoundEpoch and nowEpoch in pixels.
  final double? maxCurrentTickOffset;

  /// Specifies the zoom level of the chart.
  final double? msPerPx;

  /// Specifies the minimum interval width
  /// that is used for calculating the maximum msPerPx.
  final double? minIntervalWidth;

  /// Specifies the maximum interval width
  /// that is used for calculating the maximum msPerPx.
  final double? maxIntervalWidth;

  /// Padding around data used in data-fit mode.
  final EdgeInsets? dataFitPadding;

  /// Duration of the current tick animated transition.
  final Duration? currentTickAnimationDuration;

  /// Duration of quote bounds animated transition.
  final Duration? quoteBoundsAnimationDuration;

  /// Whether to show current tick blink animation or not.
  final bool? showCurrentTickBlinkAnimation;

  /// Fraction of the chart's height taken by top or bottom padding.
  /// Quote scaling (drag on quote area) is controlled by this variable.
  final double? verticalPaddingFraction;

  /// Specifies the margin to prevent overlap.
  final EdgeInsets? bottomChartTitleMargin;

  /// Whether the data fit button is shown or not.
  final bool? showDataFitButton;

  /// Whether to show the scroll to last tick button or not.
  final bool? showScrollToLastTickButton;

  /// The color of the loading animation.
  final Color? loadingAnimationColor;

  /// Indicator event service.
  final ChartEventTracker? eventTracker;

  /// Show indicators flag.
  final bool showIndicators;

  @override
  MobileChartWrapperState createState() => MobileChartWrapperState();
}

/// The state of the [MobileChartWrapper].
class MobileChartWrapperState extends State<MobileChartWrapper> {
  AddOnsRepository<IndicatorConfig>? _indicatorsRepo;
  AddOnsRepository<DrawingToolConfig>? _drawingToolsRepo;
  final DrawingTools _drawingTools = DrawingTools();

  @override
  void initState() {
    super.initState();

    _initRepos();
  }

  @override
  void didUpdateWidget(covariant MobileChartWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reload indicators if the indicators key has changed
    if (widget.indicatorsStoreKey != oldWidget.indicatorsStoreKey) {
      _loadSavedIndicators();
    }

    // Reload drawing tools if the drawing tools key has changed
    if (widget.drawingToolsStoreKey != oldWidget.drawingToolsStoreKey) {
      _loadSavedDrawingTools();
    }
  }

  void _setupController() {
    widget.toolsController?.onShowIndicatorsToolsMenu = () {
      if (_indicatorsRepo != null) {
        _showIndicatorsSheet(_indicatorsRepo!);
      }
    };
    widget.toolsController?.onShowDrawingToolsMenu = () {
      if (_drawingToolsRepo != null) {
        _showDrawingToolsSheet(_drawingToolsRepo!);
      }
    };

    _updateConfigs();
    _updateDrawingTools();

    _indicatorsRepo?.addListener(_updateConfigs);
    _drawingToolsRepo?.addListener(_updateConfigs);
  }

  void _initRepos() async {
    if (widget.toolsController?.indicatorsEnabled ?? false) {
      _indicatorsRepo = AddOnsRepository<IndicatorConfig>(
        createAddOn: (Map<String, dynamic> map) =>
            IndicatorConfig.fromJson(map),
        onEditCallback: (_) => _showIndicatorsSheet(_indicatorsRepo!),
        sharedPrefKey: widget.indicatorsStoreKey,
      );

      await _loadSavedIndicators();
    }

    if (widget.toolsController?.drawingToolsEnabled ?? false) {
      _drawingToolsRepo = AddOnsRepository<DrawingToolConfig>(
        createAddOn: (Map<String, dynamic> map) =>
            DrawingToolConfig.fromJson(map),
        onEditCallback: (_) => _showDrawingToolsSheet(_drawingToolsRepo!),
        sharedPrefKey: widget.drawingToolsStoreKey,
      );

      await _loadSavedDrawingTools();
    }

    _setupController();
  }

  Future<void> _loadSavedIndicators() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_indicatorsRepo != null) {
      try {
        _indicatorsRepo!.loadFromPrefs(prefs, widget.indicatorsStoreKey);
      } on Exception {
        _showLoadErrorDialog(message: 'Failed loading indicators');
      }
    }
  }

  Future<void> _loadSavedDrawingTools() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_drawingToolsRepo != null) {
      try {
        _drawingToolsRepo!.loadFromPrefs(prefs, widget.drawingToolsStoreKey);
      } on Exception {
        _showLoadErrorDialog(message: 'Failed loading drawing tools');
      }
    }
  }

  void _showLoadErrorDialog({required String message}) {
    // Show error dialog
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AnimatedPopupDialog(
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }

  void _showIndicatorsSheet(AddOnsRepository<IndicatorConfig> indicatorsRepo) {
    // Show indicators menu as modal bottom sheet so it's dismissible by tapping
    // outside.
    widget.eventTracker?.logOpenIndicatorTypesBottomSheet();
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          ChangeNotifierProvider<AddOnsRepository<IndicatorConfig>>.value(
        value: indicatorsRepo,
        child: SafeArea(
          child: DerivBottomSheet(
            title: context.mobileChartWrapperLocalizations.labelIndicators,
            child: MobileToolsBottomSheetContent(
              selectedTab: indicatorsRepo.items.isEmpty
                  ? IndicatorTabLabel.all
                  : IndicatorTabLabel.active,
              eventTracker: widget.eventTracker,
            ),
          ),
        ),
      ),
    );
  }

  void _showDrawingToolsSheet(
      AddOnsRepository<DrawingToolConfig> drawingToolsRepo) {
    setState(() {
      _drawingTools
        ..init()
        ..drawingToolsRepo = drawingToolsRepo;
    });

    showModalBottomSheet(
      context: context,
      builder: (_) =>
          ChangeNotifierProvider<AddOnsRepository<DrawingToolConfig>>.value(
        value: drawingToolsRepo,
        child: SafeArea(
          child: DerivBottomSheet(
            title: context.mobileChartWrapperLocalizations.labelDrawingTools,
            child: DrawingToolsSelector(
              onDrawingToolSelected: (DrawingToolConfig selectedDrawingTool) {
                _drawingTools.onDrawingToolSelection(selectedDrawingTool);
                _updateDrawingTools();
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      // TODO(Ramin): Check if we can consider using Chart widget directly.
      DerivChart(
        indicatorsRepo: widget.showIndicators && _indicatorsRepo != null
            ? _indicatorsRepo
            : AddOnsRepository<IndicatorConfig>(
                createAddOn: (Map<String, dynamic> map) =>
                    IndicatorConfig.fromJson(map),
                sharedPrefKey: widget.indicatorsStoreKey,
              ),
        drawingToolsRepo: _drawingToolsRepo ??
            AddOnsRepository<DrawingToolConfig>(
              createAddOn: (Map<String, dynamic> map) =>
                  DrawingToolConfig.fromJson(map),
              sharedPrefKey: widget.drawingToolsStoreKey,
            ),
        drawingTools: _drawingTools,
        controller: widget.controller,
        mainSeries: widget.mainSeries,
        markerSeries: widget.markerSeries,
        pipSize: widget.pipSize,
        granularity: widget.granularity,
        onVisibleAreaChanged: widget.onVisibleAreaChanged,
        isLive: widget.isLive,
        dataFitEnabled: widget.dataFitEnabled,
        opacity: widget.opacity,
        chartAxisConfig: widget.chartAxisConfig,
        annotations: widget.annotations,
        // TODO: The 'activeSymbol' property will be deprecated in a future
        //  release. It is currently irrelevant in the current chart package
        //  implementation, as the AddOnsRepository is initialized externally
        //  in the implementation.
        activeSymbol: 'default',
      );

  @override
  void dispose() {
    _indicatorsRepo?.removeListener(_updateConfigs);
    _drawingToolsRepo?.removeListener(_updateConfigs);
    super.dispose();
  }

  /// Update the configs in the tools controller.
  void _updateConfigs() {
    widget.toolsController?.updateConfigs(ConfigItemModel(
      indicatorConfigs: _indicatorsRepo?.items ?? [],
      drawingToolConfigs: _drawingToolsRepo?.items ?? [],
    ));
  }

  /// Update the drawing tools data in the tool controller.
  void _updateDrawingTools() {
    widget.toolsController?.updateDrawingToolsData(_drawingTools);
  }
}
