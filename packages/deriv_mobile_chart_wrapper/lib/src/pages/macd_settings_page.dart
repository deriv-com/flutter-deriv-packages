import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class MACDSettingsPage extends BaseIndicatorSettingPage<MACDIndicatorConfig> {
  const MACDSettingsPage(
      {super.key,
      required super.initialConfig,
      required super.onConfigUpdated});

  @override
  State<MACDSettingsPage> createState() => _MACDSettingsPageState();
}

class _MACDSettingsPageState extends State<MACDSettingsPage> {
  late MACDIndicatorConfig _indicatorConfig;

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
        _buildFirstSection(context),
        const SizedBox(
          height: ThemeProvider.margin24,
        ),
        _buildSecondSection(context),
        const SizedBox(
          height: ThemeProvider.margin24,
        ),
        _buildThirdSection(context),
      ],
    );
  }

  _buildFirstSection(BuildContext context) => GlowingContainer(
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
                });
                widget.onConfigUpdated(_indicatorConfig);
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
                    fastMAPeriod: value?.toInt(),
                  );
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
              label: context.mobileChartWrapperLocalizations.labelFastMAPeriod,
              numberPadSubmitLabel:
                  context.mobileChartWrapperLocalizations.labelOK,
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
              value: _indicatorConfig.slowMAPeriod.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig = _indicatorConfig.copyWith(
                    slowMAPeriod: value?.toInt(),
                  );
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
              label: context.mobileChartWrapperLocalizations.labelSlowMAPeriod,
              numberPadSubmitLabel:
                  context.mobileChartWrapperLocalizations.labelOK,
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
      ));

  _buildSecondSection(BuildContext context) => GlowingContainer(
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
                });
                widget.onConfigUpdated(_indicatorConfig);
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
                    signalPeriod: value?.toInt(),
                  );
                });
                widget.onConfigUpdated(_indicatorConfig);
              },
              label: context.mobileChartWrapperLocalizations.labelSignalPeriod,
              numberPadSubmitLabel:
                  context.mobileChartWrapperLocalizations.labelOK,
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
      ));

  _buildThirdSection(BuildContext context) => GlowingContainer(
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
                    ),
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
                onColorChanged: (index) {
                  setState(() {
                    _indicatorConfig = _indicatorConfig.copyWith(
                      barStyle: _indicatorConfig.barStyle.copyWith(
                        negativeColor: index,
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
