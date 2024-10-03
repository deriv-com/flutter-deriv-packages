import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/setting_page_action_buttons.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/components/components.dart';
import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// RSI indicator settings page.
class RSISettingPage extends BaseIndicatorSettingPage<RSIIndicatorConfig> {
  /// Initializes [RSISettingPage].
  const RSISettingPage({
    required super.initialConfig,
    required super.onConfigUpdated,
    required super.onApply,
    super.onReset,
    super.key,
  });

  @override
  State<RSISettingPage> createState() => _RSISettingPageState();
}

class _RSISettingPageState extends State<RSISettingPage> {
  late RSIIndicatorConfig _indicatorConfig;

  final int _minimumValueSelectorInput = 1;
  final int _maximumValueSelectorInput = 100;

  @override
  void initState() {
    super.initState();
    _indicatorConfig = widget.initialConfig;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSettingSection(),
        SettingActionButtons(
          onApply: widget.onApply,
          onReset: () {
            showResetIndicatorDialog(context, config: _indicatorConfig,
                onResetPressed: () {
              setState(() {
                _indicatorConfig = const RSIIndicatorConfig();
              });
              widget.onConfigUpdated(_indicatorConfig);
            });
          },
        ),
      ],
    );
  }

  Widget _buildSettingSection() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildRSILineSection(),
              _createZonesSection(),
            ],
          ),
        ),
      );

  Widget _buildRSILineSection() => GlowingContainer(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelRSILine,
              selectedColor: _indicatorConfig.lineStyle.color,
              onColorChanged: (Color color) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    lineStyle: _indicatorConfig.lineStyle.copyWith(
                      color: color,
                    ),
                  );
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
            ),
            const SizedBox(height: ThemeProvider.margin16),
            ValueSelector(
              backgroundColor: context.theme.colors.active.withOpacity(0.4),
              numberPadLabel: NumberPadLabel(
                actionOK: context.mobileChartWrapperLocalizations.labelOK,
                warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                    context.mobileChartWrapperLocalizations
                        .warnEnterValueBetweenMinMax(_maximumValueSelectorInput,
                            _minimumValueSelectorInput),
                warnValueCantBeLessThan: (input, minAmount, currency) => context
                    .mobileChartWrapperLocalizations
                    .warnEnterValueBetweenMinMax(
                        _maximumValueSelectorInput, _minimumValueSelectorInput),
                warnValueShouldBeInRange: (input, minAmountClear, currentSymbol,
                        maxAmount) =>
                    context.mobileChartWrapperLocalizations.warnRangeMinMax(
                        _maximumValueSelectorInput, _minimumValueSelectorInput),
              ),
              minimum: _minimumValueSelectorInput.toDouble(),
              maximum: _maximumValueSelectorInput.toDouble(),
              showMaximumSubtitle: true,
              showMinimumSubtitle: true,
              title: context.mobileChartWrapperLocalizations.labelPeriod,
              onChange: (value) {
                setState(() {
                  _indicatorConfig =
                      _indicatorConfig.copyWith(period: value?.floor());
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
              value: _indicatorConfig.period.toDouble(),
            ),
            const SizedBox(height: ThemeProvider.margin16),
            OptionSelector(
                label: context.mobileChartWrapperLocalizations.labelSource,
                options: getSourcesOptions(context).values.toList(),
                selectedIndex: getSourcesOptions(context)
                    .keys
                    .toList()
                    .indexOf(_indicatorConfig.fieldType),
                onOptionSelected: (index) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                        fieldType:
                            getSourcesOptions(context).keys.toList()[index]);
                  });
                  widget.onConfigUpdated(_indicatorConfig);
                })
          ],
        ),
      );

  GlowingExpansionPanelList _createZonesSection() => GlowingExpansionPanelList(
        expansionCallback: (index, isExpanded) {
          setState(() {
            _indicatorConfig =
                _indicatorConfig.copyWith(showZones: !isExpanded);
          });
          widget.onConfigUpdated(_indicatorConfig);
        },
        children: [
          GlowingExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin16),
                child: Text(
                    context.mobileChartWrapperLocalizations.labelShowZones),
              );
            },
            isExpanded: _indicatorConfig.showZones,
            shouldGlow: false,
            body: Padding(
              padding: const EdgeInsets.all(ThemeProvider.margin16),
              child: Column(
                children: [
                  _buildOverboughtSection(),
                  const SizedBox(height: ThemeProvider.margin16),
                  _buildOverSoldSection(),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ],
      );

  Widget _buildOverboughtSection() => Column(
        children: [
          ValueSelector(
            title: context.mobileChartWrapperLocalizations.labelOverbought,
            backgroundColor: context.theme.colors.active.withOpacity(0.4),
            value: _indicatorConfig.oscillatorLinesConfig.overboughtValue,
            minimum: _minimumValueSelectorInput.toDouble(),
            maximum: _maximumValueSelectorInput.toDouble(),
            formatter: NumberFormat(),
            showMaximumSubtitle: true,
            showMinimumSubtitle: true,
            minimumSubtitle:
                context.mobileChartWrapperLocalizations.labelMinSize,
            maximumSubtitle:
                context.mobileChartWrapperLocalizations.labelMaxSize,
            onChange: (value) {
              setState(() {
                _indicatorConfig = _indicatorConfig.copyWith(
                  oscillatorLinesConfig: _indicatorConfig.oscillatorLinesConfig
                      .copyWith(overboughtValue: value),
                );
              });
              widget.onConfigUpdated(_indicatorConfig);
            },
            numberPadLabel: NumberPadLabel(
              actionOK: context.mobileChartWrapperLocalizations.labelOK,
              warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                  context.mobileChartWrapperLocalizations
                      .warnEnterValueBetweenMinMax(_maximumValueSelectorInput,
                          _minimumValueSelectorInput),
              warnValueCantBeLessThan: (input, minAmount, currency) => context
                  .mobileChartWrapperLocalizations
                  .warnEnterValueBetweenMinMax(
                      _maximumValueSelectorInput, _minimumValueSelectorInput),
              warnValueShouldBeInRange: (input, minAmountClear, currentSymbol,
                      maxAmount) =>
                  context.mobileChartWrapperLocalizations.warnRangeMinMax(
                      _maximumValueSelectorInput, _minimumValueSelectorInput),
            ),
          ),
          const SizedBox(height: ThemeProvider.margin16),
          ColorSelector(
            title: context.mobileChartWrapperLocalizations.labelOverboughtLine,
            selectedColor:
                _indicatorConfig.oscillatorLinesConfig.overboughtStyle.color,
            onColorChanged: (color) {
              setState(() {
                _indicatorConfig = _indicatorConfig.copyWith(
                  oscillatorLinesConfig:
                      _indicatorConfig.oscillatorLinesConfig.copyWith(
                    overboughtStyle: _indicatorConfig
                        .oscillatorLinesConfig.overboughtStyle
                        .copyWith(color: color),
                  ),
                );
              });
              widget.onConfigUpdated(_indicatorConfig);
            },
          ),
        ],
      );

  Widget _buildOverSoldSection() => Column(
        children: [
          ValueSelector(
            title: context.mobileChartWrapperLocalizations.labelOversold,
            backgroundColor: context.theme.colors.active.withOpacity(0.4),
            value: _indicatorConfig.oscillatorLinesConfig.oversoldValue,
            formatter: NumberFormat(),
            minimum: 1,
            maximum: 100,
            showMaximumSubtitle: true,
            showMinimumSubtitle: true,
            minimumSubtitle:
                context.mobileChartWrapperLocalizations.labelMinSize,
            maximumSubtitle:
                context.mobileChartWrapperLocalizations.labelMaxSize,
            onChange: (value) {
              setState(() {
                _indicatorConfig = _indicatorConfig.copyWith(
                  oscillatorLinesConfig: _indicatorConfig.oscillatorLinesConfig
                      .copyWith(oversoldValue: value),
                );
              });
              widget.onConfigUpdated(_indicatorConfig);
            },
            numberPadLabel: NumberPadLabel(
              actionOK: context.mobileChartWrapperLocalizations.labelOK,
              warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                  context.mobileChartWrapperLocalizations
                      .warnEnterValueBetweenMinMax(_maximumValueSelectorInput,
                          _minimumValueSelectorInput),
              warnValueCantBeLessThan: (input, minAmount, currency) => context
                  .mobileChartWrapperLocalizations
                  .warnEnterValueBetweenMinMax(
                      _maximumValueSelectorInput, _minimumValueSelectorInput),
              warnValueShouldBeInRange: (input, minAmountClear, currentSymbol,
                      maxAmount) =>
                  context.mobileChartWrapperLocalizations.warnRangeMinMax(
                      _maximumValueSelectorInput, _minimumValueSelectorInput),
            ),
          ),
          const SizedBox(height: ThemeProvider.margin16),
          ColorSelector(
            title: context.mobileChartWrapperLocalizations.labelOversoldLine,
            selectedColor:
                _indicatorConfig.oscillatorLinesConfig.oversoldStyle.color,
            onColorChanged: (color) {
              setState(() {
                _indicatorConfig = _indicatorConfig.copyWith(
                  oscillatorLinesConfig:
                      _indicatorConfig.oscillatorLinesConfig.copyWith(
                    oversoldStyle: _indicatorConfig
                        .oscillatorLinesConfig.oversoldStyle
                        .copyWith(color: color),
                  ),
                );
              });
              widget.onConfigUpdated(_indicatorConfig);
            },
          ),
        ],
      );
}
