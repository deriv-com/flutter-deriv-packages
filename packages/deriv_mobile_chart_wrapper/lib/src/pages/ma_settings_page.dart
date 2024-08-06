import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

import '../helpers.dart';

class MASettingsPage extends BaseIndicatorSettingPage<MAIndicatorConfig> {
  const MASettingsPage(
      {super.key,
      required super.initialConfig,
      required super.onConfigUpdated});

  @override
  State<MASettingsPage> createState() => _MASettingsPageState();
}

class _MASettingsPageState extends State<MASettingsPage> {
  late MAIndicatorConfig _indicatorConfig;

  late Map<String, String> _sourceOptions;
  late Map<MovingAverageType, String> _typeOptions;

  late int _sourceIndex;
  late int _typeIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sourceOptions = getSourcesOptions(context);
    _typeOptions = getTypesOptions(context);

    _sourceIndex = getSourcesOptions(context)
        .keys
        .toList()
        .indexOf(_indicatorConfig.fieldType);

    _typeIndex = getTypesOptions(context)
        .keys
        .toList()
        .indexOf(_indicatorConfig.movingAverageType);
  }

  @override
  void initState() {
    super.initState();
    _indicatorConfig = widget.initialConfig;
  }

  final int _minimumValueSelectorInput = 0;
  final int _maximumValueSelectorInput = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
    );
  }

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
                        _indicatorConfig.copyWith(period: (value ?? 0).toInt());
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
                title: context.mobileChartWrapperLocalizations.labelPeriod,
                numberPadLabel: NumberPadLabel(
                  actionOK: context.mobileChartWrapperLocalizations.labelOK,
                  warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumValueSelectorInput,
                              _minimumValueSelectorInput),
                  warnValueCantBeLessThan: (input, minAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumValueSelectorInput,
                              _minimumValueSelectorInput),
                  warnValueShouldBeInRange: (input, minAmountClear,
                          currentSymbol, maxAmount) =>
                      context.mobileChartWrapperLocalizations.warnRangeMinMax(
                          _maximumValueSelectorInput,
                          _minimumValueSelectorInput),
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
              ValueSelector(
                value: _indicatorConfig.offset.toDouble(),
                backgroundColor: context.theme.colors.active,
                onChange: (value) {
                  setState(() {
                    _indicatorConfig =
                        _indicatorConfig.copyWith(offset: (value ?? 0).toInt());
                    widget.onConfigUpdated(_indicatorConfig);
                  });
                },
                title: context.mobileChartWrapperLocalizations.labelOffset,
                numberPadLabel: NumberPadLabel(
                  actionOK: context.mobileChartWrapperLocalizations.labelOK,
                  warnValueCantBeGreaterThan: (input, maxAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumValueSelectorInput,
                              _minimumValueSelectorInput),
                  warnValueCantBeLessThan: (input, minAmount, currency) =>
                      context.mobileChartWrapperLocalizations
                          .warnEnterValueBetweenMinMax(
                              _maximumValueSelectorInput,
                              _minimumValueSelectorInput),
                  warnValueShouldBeInRange: (input, minAmountClear,
                          currentSymbol, maxAmount) =>
                      context.mobileChartWrapperLocalizations.warnRangeMinMax(
                          _maximumValueSelectorInput,
                          _minimumValueSelectorInput),
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
                options: _sourceOptions.values.toList(),
                selectedIndex: _sourceIndex,
                onOptionSelected: (index) {
                  setState(() {
                    _sourceIndex = index;
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
                options: _typeOptions.values.toList(),
                selectedIndex: _typeIndex,
                onOptionSelected: (index) {
                  setState(() {
                    _typeIndex = index;
                    _indicatorConfig = _indicatorConfig.copyWith(
                        movingAverageType: _typeOptions.keys.toList()[index]);
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
