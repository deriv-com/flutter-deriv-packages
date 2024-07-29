import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_settings_bottom_sheet.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class MACDSettingsPage extends StatefulWidget {
  const MACDSettingsPage({super.key});

  @override
  State<MACDSettingsPage> createState() => _MACDSettingsPageState();
}

class _MACDSettingsPageState extends State<MACDSettingsPage> {
  int _macdLineColorIndex = 0;
  int _signalLineColorIndex = 0;
  int _increasingBarColorIndex = 0;
  int _decreasingBarColorIndex = 0;

  double? _fastMaPeriod = 14;
  double? _slowMaPeriod = 14;
  double? _signalPeriod = 14;

  @override
  Widget build(BuildContext context) {
    return IndicatorSettingsBottomSheet(
      indicator: context.mobileChartWrapperLocalizations.labelMACD,
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
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelMACDLine,
              colors: availableColors,
              selectedColorIndex: _macdLineColorIndex,
              onColorChanged: (index) {
                setState(() {
                  _macdLineColorIndex = index;
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _fastMaPeriod ?? 0,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _fastMaPeriod = value;
                });
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
              value: _slowMaPeriod ?? 0,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _slowMaPeriod = value;
                });
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
              colors: availableColors,
              selectedColorIndex: _signalLineColorIndex,
              onColorChanged: (index) {
                setState(() {
                  _signalLineColorIndex = index;
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ValueSelector(
              value: _signalPeriod ?? 0,
              backgroundColor: context.theme.colors.active,
              onChange: (value) {
                setState(() {
                  _signalPeriod = value;
                });
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
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelIncreasingBar,
              colors: availableColors,
              selectedColorIndex: _increasingBarColorIndex,
              onColorChanged: (index) {
                setState(() {
                  _increasingBarColorIndex = index;
                });
              },
            ),
            const SizedBox(
              height: ThemeProvider.margin16,
            ),
            ColorSelector(
              title: context.mobileChartWrapperLocalizations.labelDecreasingBar,
              colors: availableColors,
              selectedColorIndex: _decreasingBarColorIndex,
              onColorChanged: (index) {
                setState(() {
                  _decreasingBarColorIndex = index;
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
