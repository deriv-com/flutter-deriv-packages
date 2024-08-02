import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/base_setting_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class BollingerBandsSettingsPage
    extends BaseIndicatorSettingPage<BollingerBandsIndicatorConfig> {
  const BollingerBandsSettingsPage({
    super.key,
    required super.initialConfig,
    required super.onConfigUpdated,
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
                    _indicatorConfig.upperLineStyle.copyWith(
                      color: selectedColor,
                    );
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
                  _indicatorConfig.middleLineStyle.copyWith(
                    color: selectedColor,
                  );
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
                colors: availableColors,
                selectedColor: _indicatorConfig.lowerLineStyle.color,
                onColorChanged: (selectedColor) {
                  setState(() {
                    _indicatorConfig.lowerLineStyle.copyWith(
                      color: selectedColor,
                    );
                  });
                },
              ),
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
              height: ThemeProvider.margin08,
            ),
            Row(
              children: [
                Text(context.mobileChartWrapperLocalizations.labelChannelFill,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.caption,
                      color: context.theme.colors.general,
                    )),
                const Spacer(),
                Switch(
                  activeColor: context.theme.colors.coral,
                  value: _indicatorConfig.showChannelFill,
                  onChanged: (bool isEnabled) {
                    setState(() {
                      _indicatorConfig.copyWith(
                        showChannelFill: isEnabled,
                      );
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin16,
              ),
              child: ColorSelector(
                title: context.mobileChartWrapperLocalizations.labelFillColor,
                colors: availableColors,
                selectedColor: _indicatorConfig.fillColor,
                onColorChanged: (selectedColor) {
                  setState(() {
                    _indicatorConfig.copyWith(
                      fillColor: selectedColor,
                    );
                  });
                },
              ),
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
            ValueSelector(
              value: _indicatorConfig.period.toDouble(),
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig.copyWith(
                    period: value?.toInt(),
                  );
                });
              },
              label: context.mobileChartWrapperLocalizations.labelPeriod,
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
              value: _indicatorConfig.standardDeviation,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _indicatorConfig.copyWith(standardDeviation: value);
                });
              },
              label: context
                  .mobileChartWrapperLocalizations.labelStandardDeviations,
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
            OptionSelector(
              label: context.mobileChartWrapperLocalizations.labelSource,
              options: _sourceOptions.entries.map((e) => e.value).toList(),
              selectedIndex: _sourceOptions.keys.toList().indexOf(
                    _indicatorConfig.fieldType,
                  ),
              onOptionSelected: (index) {
                setState(() {
                  _indicatorConfig.copyWith(
                    fieldType: _sourceOptions.keys.toList()[index],
                  );
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
                  _indicatorConfig.copyWith(
                    movingAverageType:
                        _movingAverageTypeOptions.keys.toList()[index],
                  );
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
