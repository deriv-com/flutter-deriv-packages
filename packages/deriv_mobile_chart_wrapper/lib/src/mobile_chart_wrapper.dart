import 'package:deriv_chart/deriv_chart.dart';
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
    this.toolsStoreKey = 'default',
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
    this.trackingEventService,
    Key? key,
  }) : super(key: key);

  /// Chart's main data series
  final DataSeries<Tick> mainSeries;

  /// Open position marker series.
  final MarkerSeries? markerSeries;

  /// The key which is used to store selected indicators/tools.
  ///
  /// When you pass the same key that was passed before when user selected some
  /// tools, by passing the same key, the tools will be restored.
  final String toolsStoreKey;

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
  final TrackingEventService? trackingEventService;

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

    if (widget.toolsStoreKey != oldWidget.toolsStoreKey) {
      loadSavedIndicatorsAndDrawingTools();
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
        sharedPrefKey: widget.toolsStoreKey,
      );
    }

    if (widget.toolsController?.drawingToolsEnabled ?? false) {
      _drawingToolsRepo = AddOnsRepository<DrawingToolConfig>(
        createAddOn: (Map<String, dynamic> map) =>
            DrawingToolConfig.fromJson(map),
        onEditCallback: (_) => _showDrawingToolsSheet(_drawingToolsRepo!),
        sharedPrefKey: widget.toolsStoreKey,
      );
    }

    await loadSavedIndicatorsAndDrawingTools();
    _setupController();
  }

  Future<void> loadSavedIndicatorsAndDrawingTools() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<AddOnsRepository<AddOnConfig>> stateRepos =
        <AddOnsRepository<AddOnConfig>>[
      if (_indicatorsRepo != null) _indicatorsRepo!,
      if (_drawingToolsRepo != null) _drawingToolsRepo!,
    ];

    stateRepos
        .asMap()
        .forEach((int index, AddOnsRepository<AddOnConfig> element) {
      try {
        element.loadFromPrefs(prefs, widget.toolsStoreKey);
      } on Exception {
        // ignore: unawaited_futures
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AnimatedPopupDialog(
            child: Center(
              child: element is Repository<IndicatorConfig>
                  // TODO(Ramin): use localization.
                  ? const Text('Failed loading indicators')
                  : const Text('Failed loading drawing tools'),
            ),
          ),
        );
      }
    });
  }

  void _showIndicatorsSheet(AddOnsRepository<IndicatorConfig> indicatorsRepo) {
    // Show indicators menu as modal bottom sheet so it's dismissible by tapping
    // outside.
    widget.trackingEventService?.logOpenIndicatorTypesBottomSheet();
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
              trackingEventService: widget.trackingEventService,
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
        indicatorsRepo: _indicatorsRepo ??
            AddOnsRepository<IndicatorConfig>(
              createAddOn: (Map<String, dynamic> map) =>
                  IndicatorConfig.fromJson(map),
              sharedPrefKey: widget.toolsStoreKey,
            ),
        drawingToolsRepo: _drawingToolsRepo ??
            AddOnsRepository<DrawingToolConfig>(
              createAddOn: (Map<String, dynamic> map) =>
                  DrawingToolConfig.fromJson(map),
              sharedPrefKey: widget.toolsStoreKey,
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
        activeSymbol: widget.toolsStoreKey,
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
