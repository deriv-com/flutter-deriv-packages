import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/setting_page_action_buttons.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class BollingerBandsSettingsPage
    extends BaseIndicatorSettingPage<BollingerBandsIndicatorConfig> {
  const BollingerBandsSettingsPage({
    required super.initialConfig,
    required super.onConfigUpdated,
    required super.onApply,
    super.onReset,
    super.key,
  });

  @override
  State<BollingerBandsSettingsPage> createState() =>
      _BollingerBandsSettingsPageState();
}

class _BollingerBandsSettingsPageState
    extends State<BollingerBandsSettingsPage> {
  late Map<String, String> _sourceOptions;
  late Map<MovingAverageType, String> _movingAverageTypeOptions;
  late BollingerBandsIndicatorConfig _indicatorConfig;

  final int _minimumValueSelectorInput = 1;
  final int _maximumValueSelectorInput = 100;

  @override
  void initState() {
    super.initState();
    _indicatorConfig = widget.initialConfig;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sourceOptions = getSourcesOptions(context);
    _movingAverageTypeOptions = getMAOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSettingSection(),
        SettingActionButtons(
          onApply: widget.onApply,
          onReset: () {
            showResetIndicatorDialog(context, config: _indicatorConfig,
                onResetPressed: () {
              setState(() {
                _indicatorConfig = const BollingerBandsIndicatorConfig();
              });
              widget.onConfigUpdated(_indicatorConfig);
            }).then((_) => widget.onReset?.call);
          },
        ),
      ],
    );
  }

  Widget _buildSettingSection() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildBandsSection(context),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildChannelFillSection(context),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildPeriodSection(context),
            ],
          ),
        ),
      );

  _buildBandsSection(BuildContext context) => GlowingContainer(
      borderRadius: ThemeProvider.borderRadius04,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin16,
              ),
              child: ColorSelector(
                title: context
                    .mobileChartWrapperLocalizations.labelBollingerBandsTop,
                selectedColor: _indicatorConfig.upperLineStyle.color,
                onColorChanged: (selectedColor) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                      upperLineStyle: _indicatorConfig.upperLineStyle.copyWith(
                        color: selectedColor,
                      ),
                    );
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
              ),
            ),
            ColorSelector(
              title: context
                  .mobileChartWrapperLocalizations.labelBollingerBandsMedian,
              selectedColor: _indicatorConfig.middleLineStyle.color,
              onColorChanged: (selectedColor) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    middleLineStyle: _indicatorConfig.middleLineStyle.copyWith(
                      color: selectedColor,
                    ),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin16,
              ),
              child: ColorSelector(
                title: context
                    .mobileChartWrapperLocalizations.labelBollingerBandsBottom,
                selectedColor: _indicatorConfig.lowerLineStyle.color,
                onColorChanged: (selectedColor) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                      lowerLineStyle: _indicatorConfig.lowerLineStyle.copyWith(
                        color: selectedColor,
                      ),
                    );
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
              ),
            ),
          ],
        ),
      ));

  GlowingExpansionPanelList _buildChannelFillSection(BuildContext context) =>
      GlowingExpansionPanelList(
        expansionCallback: (index, isExpanded) {
          setState(() {
            _indicatorConfig =
                _indicatorConfig.copyWith(showChannelFill: !isExpanded);
            widget.onConfigUpdated(_indicatorConfig);
          });
        },
        children: [
          GlowingExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin16),
                child: Text(
                    context.mobileChartWrapperLocalizations.labelChannelFill),
              );
            },
            isExpanded: _indicatorConfig.showChannelFill,
            shouldGlow: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: ThemeProvider.margin16,
                  horizontal: ThemeProvider.margin16),
              child: ColorSelector(
                title: context.mobileChartWrapperLocalizations.labelFillColor,
                selectedColor: _indicatorConfig.fillColor,
                onColorChanged: (selectedColor) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                      fillColor: selectedColor,
                    );
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ],
      );

  _buildPeriodSection(BuildContext context) => GlowingContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeProvider.margin16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _indicatorConfig.period.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    period: value?.floor(),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
              title: context.mobileChartWrapperLocalizations.labelPeriod,
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
              showMaximumSubtitle: true,
              maximumSubtitle:
                  context.mobileChartWrapperLocalizations.labelMaxRange,
              maximum: _maximumValueSelectorInput.toDouble(),
              showMinimumSubtitle: true,
              minimumSubtitle:
                  context.mobileChartWrapperLocalizations.labelMinRange,
              minimum: _minimumValueSelectorInput.toDouble(),
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _indicatorConfig.standardDeviation,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    standardDeviation: value?.floorToDouble(),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
              title: context
                  .mobileChartWrapperLocalizations.labelStandardDeviations,
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
              showMaximumSubtitle: true,
              maximumSubtitle:
                  context.mobileChartWrapperLocalizations.labelMaxRange,
              maximum: 100,
              showMinimumSubtitle: true,
              minimumSubtitle:
                  context.mobileChartWrapperLocalizations.labelMinRange,
              minimum: 1,
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            OptionSelector(
              label: context.mobileChartWrapperLocalizations.labelSource,
              options: _sourceOptions.entries.map((e) => e.value).toList(),
              selectedIndex: _sourceOptions.keys.toList().indexOf(
                    _indicatorConfig.fieldType,
                  ),
              onOptionSelected: (index) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    fieldType: _sourceOptions.keys.toList()[index],
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            OptionSelector(
              label: context
                  .mobileChartWrapperLocalizations.labelMovingAverageType,
              options: _movingAverageTypeOptions.entries
                  .map((e) => e.value)
                  .toList(),
              selectedIndex: _movingAverageTypeOptions.keys.toList().indexOf(
                    _indicatorConfig.movingAverageType,
                  ),
              onOptionSelected: (index) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    movingAverageType:
                        _movingAverageTypeOptions.keys.toList()[index],
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
          ],
        ),
      ));
}
