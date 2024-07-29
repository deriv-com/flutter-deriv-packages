import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_settings_bottom_sheet.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class BollingerBandsSettingsPage extends StatefulWidget {
  const BollingerBandsSettingsPage({super.key});

  @override
  State<BollingerBandsSettingsPage> createState() =>
      _BollingerBandsSettingsPageState();
}

class _BollingerBandsSettingsPageState
    extends State<BollingerBandsSettingsPage> {
  late List<String> _sourceOptions;
  late List<String> _movingAverageTypeOptions;

  int _bollingerBandTopIndex = 0;
  int _bollingerBandMedianIndex = 0;
  int _bollingerBandBottomIndex = 0;
  int _fillColorIndex = 0;
  bool _isChannelFillEnabled = true;
  double? _period = 14;
  double? _standardDeviations = 14;
  int _sourceIndex = 0;
  int _movingAverageTypeIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sourceOptions = getSourcesOptions(context);
    _movingAverageTypeOptions = getMAOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    return IndicatorSettingsBottomSheet(
      indicator: context.mobileChartWrapperLocalizations.labelBB,
      settings: Column(
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
      ),
      onApply: () {},
      onReset: () {},
      onTapDelete: () {},
      onTapInfo: () {},
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
                colors: availableColors,
                selectedColorIndex: _bollingerBandTopIndex,
                onColorChanged: (index) {
                  setState(() {
                    _bollingerBandTopIndex = index;
                  });
                },
              ),
            ),
            ColorSelector(
              title: context
                  .mobileChartWrapperLocalizations.labelBollingerBandsMedian,
              colors: availableColors,
              selectedColorIndex: _bollingerBandMedianIndex,
              onColorChanged: (index) {
                setState(() {
                  _bollingerBandMedianIndex = index;
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
                selectedColorIndex: _bollingerBandBottomIndex,
                onColorChanged: (index) {
                  setState(() {
                    _bollingerBandBottomIndex = index;
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
                  value: _isChannelFillEnabled,
                  onChanged: (bool isEnabled) {
                    setState(() {
                      _isChannelFillEnabled = isEnabled;
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
                selectedColorIndex: _fillColorIndex,
                onColorChanged: (index) {
                  setState(() {
                    _fillColorIndex = index;
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
              value: _period ?? 0,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _period = value;
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
              value: _standardDeviations ?? 0,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _standardDeviations = value;
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
              options: _sourceOptions,
              selectedIndex: _sourceIndex,
              onOptionSelected: (index) {
                setState(() {
                  _sourceIndex = index;
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            OptionSelector(
              label: context
                  .mobileChartWrapperLocalizations.labelMovingAverageType,
              options: _movingAverageTypeOptions,
              selectedIndex: _movingAverageTypeIndex,
              onOptionSelected: (index) {
                setState(() {
                  _movingAverageTypeIndex = index;
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
