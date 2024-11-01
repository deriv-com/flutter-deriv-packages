import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/setting_page_action_buttons.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

class MASettingsPage extends BaseIndicatorSettingPage<MAIndicatorConfig> {
  const MASettingsPage({
    required super.initialConfig,
    required super.onConfigUpdated,
    required super.onApply,
    super.onReset,
    super.key,
  });

  @override
  State<MASettingsPage> createState() => _MASettingsPageState();
}

class _MASettingsPageState extends State<MASettingsPage> {
  late MAIndicatorConfig _indicatorConfig;

  @override
  void initState() {
    super.initState();
    _indicatorConfig = widget.initialConfig;
  }

  final int _minimumPeriodValue = 1;
  final int _maximumPeriodValue = 100;

  final int _minimumOffsetValue = 0;
  final int _maximumOffsetValue = 100;

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
                _indicatorConfig = const MAIndicatorConfig();
              });
              widget.onConfigUpdated(_indicatorConfig);
              widget.onReset?.call();
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
              _buildMAColorSelectionSection(context),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildPeriodAndOffsetSection(),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildSourceAndTypeSection(),
            ],
          ),
        ),
      );

  Widget _buildMAColorSelectionSection(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin08,
        ),
        child: ColorSelector(
          title: context.mobileChartWrapperLocalizations.labelMALine,
          selectedColor: _indicatorConfig.lineStyle.color,
          onColorChanged: (color) {
            setState(() {
              _indicatorConfig = _indicatorConfig.copyWith(
                lineStyle: _indicatorConfig.lineStyle.copyWith(
                  color: color,
                ),
              );
              widget.onConfigUpdated(_indicatorConfig);
            });
          },
        ),
      );

  Widget _buildPeriodAndOffsetSection() => GlowingContainer(
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
                    _indicatorConfig =
                        _indicatorConfig.copyWith(period: value?.floor());
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
                title: context.mobileChartWrapperLocalizations.labelPeriod,
                numberPadLabel: NumberPadLabel(
                  actionOK: context.mobileChartWrapperLocalizations.labelOK,
                  warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumPeriodValue, _minimumPeriodValue),
                  warnValueCantBeLessThan: (input, minAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumPeriodValue, _minimumPeriodValue),
                  warnValueShouldBeInRange: (input, minAmountClear,
                          currentSymbol, maxAmount) =>
                      context.mobileChartWrapperLocalizations.warnRangeMinMax(
                          _maximumPeriodValue, _minimumPeriodValue),
                ),
                showMaximumSubtitle: true,
                maximumSubtitle:
                    context.mobileChartWrapperLocalizations.labelMaxRange,
                maximum: _maximumPeriodValue.toDouble(),
                showMinimumSubtitle: true,
                minimumSubtitle:
                    context.mobileChartWrapperLocalizations.labelMinRange,
                minimum: _minimumPeriodValue.toDouble(),
              ),
              const SizedBox(
                height: ThemeProvider.margin16,
              ),
              ValueSelector(
                value: _indicatorConfig.offset.toDouble(),
                backgroundColor: context.theme.colors.active,
                onChange: (value) {
                  setState(() {
                    _indicatorConfig =
                        _indicatorConfig.copyWith(offset: value?.floor());
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
                title: context.mobileChartWrapperLocalizations.labelOffset,
                numberPadLabel: NumberPadLabel(
                  actionOK: context.mobileChartWrapperLocalizations.labelOK,
                  warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumOffsetValue, _minimumOffsetValue),
                  warnValueCantBeLessThan: (input, minAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumOffsetValue, _minimumOffsetValue),
                  warnValueShouldBeInRange: (input, minAmountClear,
                          currentSymbol, maxAmount) =>
                      context.mobileChartWrapperLocalizations.warnRangeMinMax(
                          _maximumOffsetValue, _minimumOffsetValue),
                ),
                showMaximumSubtitle: true,
                maximumSubtitle:
                    context.mobileChartWrapperLocalizations.labelMaxRange,
                maximum: _maximumOffsetValue.toDouble(),
                showMinimumSubtitle: true,
                minimumSubtitle:
                    context.mobileChartWrapperLocalizations.labelMinRange,
                minimum: _minimumOffsetValue.toDouble(),
              ),
              const SizedBox(
                height: ThemeProvider.margin16,
              ),
            ],
          ),
        ),
      );

  Widget _buildSourceAndTypeSection() => GlowingContainer(
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
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
              ),
              const SizedBox(
                height: ThemeProvider.margin16,
              ),
              OptionSelector(
                label: context.mobileChartWrapperLocalizations.labelType,
                options: getTypesOptions(context).values.toList(),
                selectedIndex: getTypesOptions(context)
                    .keys
                    .toList()
                    .indexOf(_indicatorConfig.movingAverageType),
                onOptionSelected: (index) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                        movingAverageType:
                            getTypesOptions(context).keys.toList()[index]);
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
              ),
              const SizedBox(
                height: ThemeProvider.margin16,
              ),
            ],
          ),
        ),
      );
}
