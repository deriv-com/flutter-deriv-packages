import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/setting_page_action_buttons.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class MACDSettingsPage extends BaseIndicatorSettingPage<MACDIndicatorConfig> {
  const MACDSettingsPage({
    required super.initialConfig,
    required super.onConfigUpdated,
    required super.onApply,
    super.onReset,
    super.key,
  });

  @override
  State<MACDSettingsPage> createState() => _MACDSettingsPageState();
}

class _MACDSettingsPageState extends State<MACDSettingsPage> {
  late MACDIndicatorConfig _indicatorConfig;

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
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSettingSection(),
        SettingActionButtons(
          onApply: widget.onApply,
          onReset: () {
            showResetIndicatorDialog(context, config: _indicatorConfig,
                onResetPressed: () {
              setState(() {
                _indicatorConfig = const MACDIndicatorConfig();
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
              _buildMALineSection(context),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildSignalSection(context),
              const SizedBox(
                height: ThemeProvider.margin24,
              ),
              _buildBarsSection(context),
            ],
          ),
        ),
      );

  _buildMALineSection(BuildContext context) => GlowingContainer(
      borderRadius: ThemeProvider.borderRadius04,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelMACDLine,
              selectedColor: _indicatorConfig.lineStyle.color,
              onColorChanged: (selectedColor) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    lineStyle: _indicatorConfig.lineStyle.copyWith(
                      color: selectedColor,
                    ),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _indicatorConfig.fastMAPeriod.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    fastMAPeriod: value?.floor(),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
              title: context.mobileChartWrapperLocalizations.labelFastMAPeriod,
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
              value: _indicatorConfig.slowMAPeriod.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    slowMAPeriod: value?.floor(),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
              title: context.mobileChartWrapperLocalizations.labelSlowMAPeriod,
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
          ],
        ),
      ));

  _buildSignalSection(BuildContext context) => GlowingContainer(
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
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelSignalLine,
              selectedColor: _indicatorConfig.signalLineStyle.color,
              onColorChanged: (index) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    signalLineStyle: _indicatorConfig.signalLineStyle.copyWith(
                      color: index,
                    ),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _indicatorConfig.signalPeriod.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    signalPeriod: value?.floor(),
                  );
                  widget.onConfigUpdated(_indicatorConfig);
                });
              },
              title: context.mobileChartWrapperLocalizations.labelSignalPeriod,
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
          ],
        ),
      ));

  _buildBarsSection(BuildContext context) => GlowingContainer(
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
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelIncreasingBar,
              selectedColor: _indicatorConfig.barStyle.positiveColor,
              onColorChanged: (selectedColor) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    barStyle: _indicatorConfig.barStyle.copyWith(
                        positiveColor: selectedColor,
                        negativeColor: _indicatorConfig.barStyle.negativeColor),
                  );
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin16,
              ),
              child: ColorSelector(
                title:
                    context.mobileChartWrapperLocalizations.labelDecreasingBar,
                selectedColor: _indicatorConfig.barStyle.negativeColor,
                onColorChanged: (color) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                      barStyle: _indicatorConfig.barStyle.copyWith(
                        negativeColor: color,
                        positiveColor: _indicatorConfig.barStyle.positiveColor,
                      ),
                    );
                  });
                  widget.onConfigUpdated(_indicatorConfig);
                },
              ),
            ),
          ],
        ),
      ));
}
