import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
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

  final Color _bollingerBandTopColor = const Color(0xFFFFFFFF);
  final Color _bollingerBandMedianColor = const Color(0xFFFFFFFF);
  final Color _bollingerBandBottomColor = const Color(0xFFFFFFFF);
  final Color _fillColor = const Color(0xFFFFFFFF);
  bool _isChannelFillEnabled = true;
  double? _period = 14;
  double? _standardDeviations = 14;
  int _sourceIndex = 0;
  int _movingAverageTypeIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sourceOptions = [
      context.mobileChartWrapperLocalizations.labelClose,
      context.mobileChartWrapperLocalizations.labelOpen,
      context.mobileChartWrapperLocalizations.labelHigh,
      context.mobileChartWrapperLocalizations.labelLow,
      context.mobileChartWrapperLocalizations.labelHl2,
      context.mobileChartWrapperLocalizations.labelHlcc4,
      context.mobileChartWrapperLocalizations.labelOhlc4,
    ];

    _movingAverageTypeOptions = [
      context.mobileChartWrapperLocalizations.labelSimple,
      context.mobileChartWrapperLocalizations.labelExponential,
      context.mobileChartWrapperLocalizations.labelWeighted,
      context.mobileChartWrapperLocalizations.labelHull,
      context.mobileChartWrapperLocalizations.labelZeroLag,
      context.mobileChartWrapperLocalizations.labelTimeSeries,
      context.mobileChartWrapperLocalizations.labelWellesWilder,
      context.mobileChartWrapperLocalizations.labelVariable,
      context.mobileChartWrapperLocalizations.labelTriangular,
      context.mobileChartWrapperLocalizations.label2Exponential,
      context.mobileChartWrapperLocalizations.label3Exponential,
    ];
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
            const SizedBox(
              height: ThemeProvider.margin08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin08,
              ),
              child: ColorSelector(
                title: context
                    .mobileChartWrapperLocalizations.labelBollingerBandsTop,
                color: _bollingerBandTopColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin08,
              ),
              child: ColorSelector(
                title: context
                    .mobileChartWrapperLocalizations.labelBollingerBandsMedian,
                color: _bollingerBandMedianColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeProvider.margin08,
              ),
              child: ColorSelector(
                title: context
                    .mobileChartWrapperLocalizations.labelBollingerBandsBottom,
                color: _bollingerBandBottomColor,
              ),
            ),
            const SizedBox(
              height: ThemeProvider.margin08,
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
                    print(isEnabled);
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
                color: _fillColor,
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
