import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/core_widgets/core_widgets.dart';
import 'package:deriv_mobile_chart_wrapper/src/enums.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/active_indicator_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_tab_label.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../core_widgets/info_banner.dart';
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
      config: MACDIndicatorConfig(),
    ),
    IndicatorItemModel(
      category: IndicatorCategory.momentum,
      title: 'Relative Strength Index (RSI)',
      icon: rsiIcon,
      config: RSIIndicatorConfig(),
    ),
    IndicatorItemModel(
      category: IndicatorCategory.volatility,
      title: 'Bollinger Bands',
      icon: bollingerBandsIcon,
      config: BollingerBandsIndicatorConfig(),
    ),
    IndicatorItemModel(
      category: IndicatorCategory.movingAverages,
      title: 'Moving Average',
      icon: movingAverageIcon,
      config: MAIndicatorConfig(),
    ),
  ];

  @override
  State<MobileToolsBottomSheetContent> createState() =>
      _MobileToolsBottomSheetContentState();
}

class _MobileToolsBottomSheetContentState
    extends State<MobileToolsBottomSheetContent> {
  IndicatorTabLabel _selectedChip = IndicatorTabLabel.all;

  List<IndicatorItemModel> get filteredIndicators {
    return _selectedChip == IndicatorTabLabel.all
        ? MobileToolsBottomSheetContent.indicators
        : MobileToolsBottomSheetContent.indicators
            .where(
              // TODO(Ramin): Check if we can only have one enum to use for
              //  labels and indicators' model category.
              (indicator) =>
                  indicator.category == _selectedChip.toIndicatorCategory,
            )
            .toList();
  }

  /// Returns `true` if the limit of active indicators is reached.
  bool get isLimitReached => indicatorsRepo.items.length >= 3;

  late AddOnsRepository<IndicatorConfig> indicatorsRepo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    indicatorsRepo = Provider.of<AddOnsRepository<IndicatorConfig>>(context);
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
                  const SizedBox(height: ThemeProvider.margin16),
                  if (isLimitReached &&
                      _selectedChip != IndicatorTabLabel.active)
                    _buildLimitInfoBanner(),
                  Expanded(
                      child: _selectedChip == IndicatorTabLabel.active
                          ? _buildIndicatorsActiveTab()
                          : _buildIndicatorsList()),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildActiveTabHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeProvider.margin16,
      ),
      child: Row(
        children: [
          Text(
            'Up to 3 active indicators allowed.',
            style: context.themeProvider.textStyle(
              textStyle: TextStyles.caption,
              color: context.themeProvider.colors.general,
            ),
            textAlign: TextAlign.start,
          ),
          const Spacer(),
          Visibility(
            visible: indicatorsRepo.items.isNotEmpty,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: SecondaryButton(
              onPressed: indicatorsRepo.clear,
              child: Center(
                child: Text(
                  'Delete all',
                  style: context.themeProvider.textStyle(
                    textStyle: TextStyles.caption,
                    color: context.themeProvider.colors.prominent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorsList() {
    return ListView.builder(
      itemCount: filteredIndicators.length,
      itemBuilder: (_, index) {
        final IndicatorItemModel indicator = filteredIndicators[index];

        return Interaction(
          isEnabled: !isLimitReached,
          child: IndicatorListItem(
            iconAssetPath: indicator.icon,
            title: indicator.title,
            count: _getIndicatorCount(indicator),
            onInfoIconTapped: () {},
            onTap: () {
              indicatorsRepo.add(
                indicator.config.copyWith(
                  number: indicatorsRepo.getNumberForNewAddOn(indicator.config),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildIndicatorsActiveTab() {
    return Column(
      children: [
        _buildActiveTabHeader(),
        const SizedBox(height: ThemeProvider.margin16),
        Expanded(
          child: indicatorsRepo.items.isEmpty
              ? _buildIndicatorEmptyState()
              : _buildActiveIndicatorsList(),
        ),
      ],
    );
  }

  Widget _buildActiveIndicatorsList() {
    return Padding(
      padding: const EdgeInsets.only(
        left: ThemeProvider.margin16,
        right: ThemeProvider.margin16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: indicatorsRepo.items.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: ThemeProvider.margin08),
              itemBuilder: (_, index) {
                final IndicatorConfig indicatorConfig =
                    indicatorsRepo.items[index];
                return ActiveIndicatorListItem(
                  iconAssetPath: getIndicatorIconPath(indicatorConfig),
                  title: '${getIndicatorAbbreviation(indicatorConfig)} '
                      '${indicatorConfig.number > 0 ? indicatorConfig.number : ''}',
                  subtitle: '(${indicatorConfig.configSummary})',
                  onTapSetting: () {},
                  onTapDelete: () => indicatorsRepo.removeAt(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  emptyStateIndicatorsIcon,
                  height: Dimens.iconSize48,
                  package: 'deriv_mobile_chart_wrapper',
                ),
                const SizedBox(height: ThemeProvider.margin08),
                Text(
                  'You have no active indicators yet.',
                  style: context.themeProvider.textStyle(
                    textStyle: TextStyles.body1,
                    color: const Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: context.theme.colors.secondary,
          padding: const EdgeInsets.all(ThemeProvider.margin16),
          child: PrimaryButton(
            child: Text(
              'Add indicator',
              style: context.theme.textStyle(
                textStyle: TextStyles.body2,
                color: context.theme.colors.prominent,
              ),
            ),
            onPressed: () {
              setState(() {
                _selectedChip = IndicatorTabLabel.all;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLimitInfoBanner() {
    return const InfoBanner(
      message: 'You\'ve added the maximum number of active indicators.',
    );
  }

  /// Returns the number of active indicators for specified [indicator].
  int _getIndicatorCount(IndicatorItemModel indicator) {
    return indicatorsRepo.items
        .where((item) => item.runtimeType == indicator.config.runtimeType)
        .length;
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
            ...IndicatorTabLabel.values
                .map<CustomChip>((tabLabel) => tabLabel ==
                        IndicatorTabLabel.active
                    ? CustomChip<IndicatorTabLabel>(
                        labelBuilder: (_, __) => IndicatorTabLabel.activeCount(
                          indicatorsRepo.items.length,
                        ),
                        value: IndicatorTabLabel.active,
                        onTap: _onChipTapped,
                        isSelected: _selectedChip == IndicatorTabLabel.active,
                        borderRadius: ThemeProvider.margin40,
                      )
                    : CustomChip<IndicatorTabLabel>(
                        value: tabLabel,
                        labelBuilder: (_, __) => tabLabel.title,
                        onTap: _onChipTapped,
                        isSelected: _selectedChip == tabLabel,
                        borderRadius: ThemeProvider.margin40,
                      ))
                .toList(),
          ],
        ),
      ),
    );
  }

  void _onChipTapped(IndicatorTabLabel? value, String? title) =>
      setState(() => _selectedChip = value ?? IndicatorTabLabel.all);

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
