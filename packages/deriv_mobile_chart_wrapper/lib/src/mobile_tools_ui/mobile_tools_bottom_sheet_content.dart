import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/core_widgets.dart';
import 'package:deriv_mobile_chart_wrapper/src/enums.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_tab_label.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

import '../core_widgets/no_glow_scroll_behavior.dart';

/// Bottom sheet content to show the list of support tools (indicators/ drawing
/// tools) for the mobile version.
class MobileToolsBottomSheetContent extends StatefulWidget {
  /// Initializes the bottom sheet content.
  const MobileToolsBottomSheetContent({super.key});

  static const List<IndicatorItemModel> indicators = [
    IndicatorItemModel(
      category: IndicatorCategory.momentum,
      title: 'MACD',
      icon: macdIcon,
    ),
    IndicatorItemModel(
      category: IndicatorCategory.momentum,
      title: 'Relative Strength Index (RSI)',
      icon: rsiIcon,
    ),
    IndicatorItemModel(
      category: IndicatorCategory.volatility,
      title: 'Bollinger Bands',
      icon: bollingerBandsIcon,
    ),
    IndicatorItemModel(
      category: IndicatorCategory.movingAverages,
      title: 'Moving Average',
      icon: movingAverageIcon,
    ),
  ];

  @override
  State<MobileToolsBottomSheetContent> createState() =>
      _MobileToolsBottomSheetContentState();
}

class _MobileToolsBottomSheetContentState
    extends State<MobileToolsBottomSheetContent> {
  String? _selectedChip = IndicatorTabLabel.all;

  List<IndicatorItemModel> get filteredIndicators {
    if (_selectedChip == IndicatorTabLabel.momentum) {
      // Filter momentum indicators
      return MobileToolsBottomSheetContent.indicators
          .where(
              (indicator) => indicator.category == IndicatorCategory.momentum)
          .toList();
    }

    if (_selectedChip == IndicatorTabLabel.volatility) {
      // Filter volatility indicators
      return MobileToolsBottomSheetContent.indicators
          .where(
              (indicator) => indicator.category == IndicatorCategory.volatility)
          .toList();
    }
    // Filter moving averages indicators
    if (_selectedChip == IndicatorTabLabel.movingAverages) {
      return MobileToolsBottomSheetContent.indicators
          .where((indicator) =>
              indicator.category == IndicatorCategory.movingAverages)
          .toList();
    }

    // Otherwise return All indicators
    return MobileToolsBottomSheetContent.indicators;
  }

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
      itemCount: filteredIndicators.length,
      itemBuilder: (_, index) {
        final IndicatorItemModel indicator = filteredIndicators[index];

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
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: ChipsList(
          isHorizontalPaddingEnabled: true,
          horizontalPadding: Dimens.margin16,
          items: [
            CustomChip(
              value: IndicatorTabLabel.active,
              onTap: _onChipTapped,
              isSelected: _selectedChip == IndicatorTabLabel.active,
              borderRadius: ThemeProvider.margin40,
            ),
            CustomChip(
              value: IndicatorTabLabel.all,
              onTap: _onChipTapped,
              isSelected: _selectedChip == IndicatorTabLabel.all,
              borderRadius: ThemeProvider.margin40,
            ),
            CustomChip(
              // title: 'Momentum',
              value: IndicatorTabLabel.momentum,
              onTap: _onChipTapped,
              isSelected: _selectedChip == IndicatorTabLabel.momentum,
              borderRadius: ThemeProvider.margin40,
            ),
            CustomChip(
              value: IndicatorTabLabel.volatility,
              onTap: _onChipTapped,
              isSelected: _selectedChip == IndicatorTabLabel.volatility,
              borderRadius: ThemeProvider.margin40,
            ),
            CustomChip(
              value: IndicatorTabLabel.movingAverages,
              onTap: _onChipTapped,
              isSelected: _selectedChip == IndicatorTabLabel.movingAverages,
              borderRadius: ThemeProvider.margin40,
            ),
          ],
        ),
      ),
    );
  }

  void _onChipTapped(String? value, String? title) {
    setState(() {
      _selectedChip = value;
    });
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
