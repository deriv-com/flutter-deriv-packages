import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_settings_bottom_sheet.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class MASettingsPage extends StatefulWidget {
  const MASettingsPage({super.key});

  @override
  State<MASettingsPage> createState() => _MASettingsPageState();
}

class _MASettingsPageState extends State<MASettingsPage> {
  late List<String> _sourceOptions;
  late List<String> _typeOptions;

  int _maLineColorIndex = 0;

  double? _period = 14;
  double? _offset = 0;
  int _sourceIndex = 0;
  int _typeIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sourceOptions = getSourcesOptions(context);
    _typeOptions = getTypesOptions(context);
  }

  @override
  Widget build(BuildContext context) {
    return IndicatorSettingsBottomSheet(
      indicator: context.mobileChartWrapperLocalizations.labelMA,
      settings: Column(
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
      ),
      onApply: () {},
      onReset: () {},
      onTapDelete: () {},
      onTapInfo: () {},
    );
  }

  Widget _buildMAColorSelectionSection(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin08,
        ),
        child: ColorSelector(
          title: context.mobileChartWrapperLocalizations.labelMALine,
          colors: availableColors,
          selectedColorIndex: _maLineColorIndex,
          onColorChanged: (index) {
            setState(() {
              _maLineColorIndex = index;
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
                value: _offset ?? 0,
                backgroundColor: context.theme.colors.active,
                onChange: (value) {
                  setState(() {
                    _offset = value;
                  });
                },
                label: context.mobileChartWrapperLocalizations.labelOffset,
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
                label: context.mobileChartWrapperLocalizations.labelType,
                options: _typeOptions,
                selectedIndex: _typeIndex,
                onOptionSelected: (index) {
                  setState(() {
                    _typeIndex = index;
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
