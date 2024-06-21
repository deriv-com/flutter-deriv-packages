import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chips_list.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

import 'custom_chip.dart';

/// Bottom sheet content to show the list of support tools (indicators/ drawing
/// tools) for the mobile version.
class MobileToolsBottomSheetContent extends StatelessWidget {
  /// Initializes the bottom sheet content.
  const MobileToolsBottomSheetContent({super.key});

  static const List<IndicatorItemModel> indicators = [
    IndicatorItemModel(title: 'MACD', icon: macdIcon),
    IndicatorItemModel(title: 'Relative Strength Index (RSI)', icon: rsiIcon),
    IndicatorItemModel(title: 'Moving Average', icon: movingAverageIcon),
    IndicatorItemModel(title: 'Bollinger Bands', icon: bollingerBandsIcon),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _buildHeader(context),
          ChipsList(items: <CustomChip>[
            CustomChip(title: 'Active'),
            CustomChip(title: 'All'),
            CustomChip(title: 'Momentum'),
            CustomChip(title: 'Volatility'),
            CustomChip(title: 'Moving average'),
          ]),
        ],
      );

  Widget _buildHeader(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.margin16),
        alignment: Alignment.center,
        child: Text(
          context.mobileChartWrapperLocalizations.labelIndicators,
          style: DerivThemeProvider.getTheme(context).textStyle(
            textStyle: TextStyles.subheading,
            color: DerivThemeProvider.getTheme(context).colors.prominent,
          ),
        ),
      );
}
