import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

/// Bottom sheet content to show the list of support tools (indicators/ drawing
/// tools) for the mobile version.
class MobileToolsBottomSheetContent extends StatelessWidget {
  /// Initializes the bottom sheet content.
  const MobileToolsBottomSheetContent({super.key});

  static const List<IndicatorItemModel> indicators = [
    IndicatorItemModel(title: 'MACD', icon: macdIcon),
    IndicatorItemModel(title: 'Relative Strength Index (RSI)', icon: rsiIcon),
    IndicatorItemModel(title: 'Bollinger Bands', icon: bollingerBandsIcon),
    IndicatorItemModel(title: 'Moving Average', icon: movingAverageIcon),
  ];

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _buildHeader(context),
          Expanded(
            child: Ink(
              color: context.theme.colors.primary,
              child: Column(
                children: [
                  const SizedBox(height: ThemeProvider.margin16),
                  _buildChipsList(),
                  Expanded(child: _buildIndicatorsList()),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildIndicatorsList() {
    return ListView.builder(
      itemCount: indicators.length,
      itemBuilder: (_, index) {
        final IndicatorItemModel indicator = indicators[index];

        return IndicatorListItem(
          iconAssetPath: indicator.icon,
          title: indicator.title,
          onInfoIconTapped: () {},
        );
      },
    );
  }

  Widget _buildChipsList() {
    // Overscroll behaviour of horizontal chips list sometimes triggers
    // BottomSheet top <-> bottom dragging. That's why we're capturing the
    // overscroll here so it doesn't propagate up to the BottomSheet.
    return NotificationListener<OverscrollNotification>(
      onNotification: (OverscrollNotification notification) {
        return true;
      },
      // TODO(Ramin): add chips list.
      child: const SizedBox.shrink(),
    );
  }

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
