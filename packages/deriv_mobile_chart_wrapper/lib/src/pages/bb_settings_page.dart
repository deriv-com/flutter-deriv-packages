import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/glowing_container.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_settings_bottom_sheet.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

class BollingerBandsSettingsPage extends StatelessWidget {
  const BollingerBandsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IndicatorSettingsBottomSheet(
      indicator: context.mobileChartWrapperLocalizations.labelBB,
      settings: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlowingContainer(
              radius: ThemeProvider.borderRadius04,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ThemeProvider.margin16),
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
                        title: context.mobileChartWrapperLocalizations
                            .labelBollingerBandsTop,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ThemeProvider.margin08,
                      ),
                      child: ColorSelector(
                        title: context.mobileChartWrapperLocalizations
                            .labelBollingerBandsMedian,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ThemeProvider.margin08,
                      ),
                      child: ColorSelector(
                        title: context.mobileChartWrapperLocalizations
                            .labelBollingerBandsBottom,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      height: ThemeProvider.margin08,
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: ThemeProvider.margin24,
          ),
          GlowingContainer(
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
                    Text(
                        context
                            .mobileChartWrapperLocalizations.labelChannelFill,
                        style: context.theme.textStyle(
                          textStyle: TextStyles.caption,
                          color: context.theme.colors.general,
                        )),
                    const Spacer(),
                    AbsorbPointer(
                      child: Switch(
                        activeColor: context.theme.colors.coral,
                        value: false,
                        onChanged: (bool isExpanded) {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ThemeProvider.margin16,
                  ),
                  child: ColorSelector(
                    title:
                        context.mobileChartWrapperLocalizations.labelFillColor,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
