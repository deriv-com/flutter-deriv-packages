import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_mobile_chart_wrapper/src/enums.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/helpers.dart';
import 'package:deriv_mobile_chart_wrapper/src/indicator_event_service.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/active_indicator_list_item.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/indicator_settings_description_bottom_sheet.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_tab_label.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/bb_settings_page.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/ma_settings_page.dart';
import 'package:deriv_mobile_chart_wrapper/src/pages/macd_settings_page.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../core_widgets/no_glow_scroll_behavior.dart';
import 'indicator_description_bottom_sheet.dart';
import 'indicator_settings_bottom_sheet.dart';

/// Bottom sheet content to show the list of support tools (indicators/ drawing
/// tools) for the mobile version.
class MobileToolsBottomSheetContent extends StatefulWidget {
  /// Initializes the bottom sheet content.
  const MobileToolsBottomSheetContent({
    this.selectedTab = IndicatorTabLabel.all,
    this.indicatorEventService,
    super.key,
  });

  final IndicatorTabLabel selectedTab;

  final IndicatorEventService? indicatorEventService;

  @override
  State<MobileToolsBottomSheetContent> createState() =>
      _MobileToolsBottomSheetContentState();
}

class _MobileToolsBottomSheetContentState
    extends State<MobileToolsBottomSheetContent> {
  late IndicatorTabLabel _selectedChip;

  /// Returns `true` if the limit of active indicators is reached.
  bool get isLimitReached => indicatorsRepo.items.length >= 3;

  late AddOnsRepository<IndicatorConfig> indicatorsRepo;

  late List<IndicatorItemModel> indicators;

  late IndicatorConfig _updatedConfig;

  @override
  void initState() {
    super.initState();
    _selectedChip = widget.selectedTab;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    indicatorsRepo = Provider.of<AddOnsRepository<IndicatorConfig>>(context);
    indicators = [
      IndicatorItemModel(
        category: IndicatorCategory.momentum,
        title: context.mobileChartWrapperLocalizations.labelMACD,
        subtitle: context.mobileChartWrapperLocalizations.labelMACD,
        icon: macdIcon,
        config: const MACDIndicatorConfig(),
        description: context.mobileChartWrapperLocalizations.infoMACD,
      ),
      IndicatorItemModel(
        category: IndicatorCategory.momentum,
        title:
            context.mobileChartWrapperLocalizations.labelRelativeStrengthIndex,
        subtitle: context.mobileChartWrapperLocalizations.labelRSI,
        icon: rsiIcon,
        config: const RSIIndicatorConfig(),
        description: context.mobileChartWrapperLocalizations.infoRSI,
      ),
      IndicatorItemModel(
        category: IndicatorCategory.volatility,
        title: context.mobileChartWrapperLocalizations.labelBollingerBands,
        subtitle: context.mobileChartWrapperLocalizations.labelBB,
        icon: bollingerBandsIcon,
        config: const BollingerBandsIndicatorConfig(),
        description: context.mobileChartWrapperLocalizations.infoBB,
      ),
      IndicatorItemModel(
        category: IndicatorCategory.movingAverages,
        title: context.mobileChartWrapperLocalizations.labelMovingAverage,
        subtitle: context.mobileChartWrapperLocalizations.labelMA,
        icon: movingAverageIcon,
        config: const MAIndicatorConfig(),
        description: context.mobileChartWrapperLocalizations.infoMA,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Ink(
            color: context.theme.colors.primary,
            child: Column(
              children: [
                const SizedBox(height: ThemeProvider.margin16),
                _buildChipsList(),
                const SizedBox(height: ThemeProvider.margin16),
                if (isLimitReached && _selectedChip != IndicatorTabLabel.active)
                  _buildLimitInfoBanner(),
                Expanded(
                  child: _selectedChip == IndicatorTabLabel.active
                      ? _buildIndicatorsActiveTab()
                      : _buildIndicatorsList(
                          getFilteredIndicators(indicators),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<IndicatorItemModel> getFilteredIndicators(
      List<IndicatorItemModel> indicators) {
    return _selectedChip == IndicatorTabLabel.all
        ? indicators
        : indicators
            .where(
              //TODO(Ramin): Check if we can only have one enum to use for
              //  labels and indicators' model category.
              (indicator) =>
                  indicator.category == _selectedChip.toIndicatorCategory,
            )
            .toList();
  }

  Widget _buildActiveTabHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeProvider.margin16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context
                  .mobileChartWrapperLocalizations.infoUpto3indicatorsAllowed,
              style: context.themeProvider.textStyle(
                textStyle: TextStyles.caption,
                color: context.themeProvider.colors.general,
              ),
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
          const SizedBox(width: ThemeProvider.margin16),
          Visibility(
            visible: indicatorsRepo.items.isNotEmpty,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: SecondaryButton(
              onPressed: _showDeleteAllIndicatorsDialog,
              child: Center(
                child: Text(
                  context.mobileChartWrapperLocalizations.labelDeleteAll,
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

  Widget _buildIndicatorsList(List<IndicatorItemModel> filteredIndicators) {
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
            onInfoIconTapped: () => _showIndicatorInfoBottomSheet(indicator),
            onTap: () {
              indicatorsRepo.add(
                indicator.config.copyWith(
                  number: indicatorsRepo.getNumberForNewAddOn(indicator.config),
                ),
              );
              widget.indicatorEventService?.logAddIndicatorByClickIndicatorType(
                indicator.title,
                indicator.category.name,
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
                  title: getIndicatorAbbreviationWithCount(
                      indicatorConfig, context),
                  subtitle: '(${indicatorConfig.configSummary})',
                  onTapSetting: () {
                    _updatedConfig = indicatorConfig;
                    showDerivModalBottomSheet(
                      context,
                      (context) => IndicatorSettingsBottomSheet(
                        indicator: getIndicatorAbbreviationWithCount(
                          indicatorConfig,
                          context,
                        ),
                        settings: _getConfigSettingPage(index, indicatorConfig),
                        onTapDelete: () async {
                          await _showDeleteIndicatorDialog(
                            indicatorConfig,
                            index,
                          ).then((isIndicatorRemoved) {
                            if (isIndicatorRemoved) {
                              widget.indicatorEventService
                                  ?.logDeleteActiveIndicatorFromSettings(
                                indicatorConfig.title,
                                getIndicatorCategoryTitle(
                                  indicatorConfig.title,
                                ),
                              );
                            }
                          });
                          if (context.mounted) Navigator.pop(context);
                        },
                        onTapInfo: () {
                          final IndicatorItemModel indicatorModel =
                              indicators.firstWhere((element) =>
                                  element.config.runtimeType ==
                                  indicatorConfig.runtimeType);

                          widget.indicatorEventService
                              ?.logOpenIndicatorInfoFromIndicatorSettings(
                            indicatorModel.title,
                            indicatorModel.category.name,
                          );

                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return IndicatorSettingsDescriptionBottomSheet(
                                  indicator: indicatorModel,
                                );
                              });
                        },
                      ),
                      showDragHandle: false,
                    );
                  },
                  onTapDelete: () =>
                      _showDeleteIndicatorDialog(indicatorConfig, index)
                          .then((isIndicatorRemoved) {
                    if (isIndicatorRemoved) {
                      widget.indicatorEventService?.logDeleteActiveIndicator(
                        indicatorConfig.title,
                        getIndicatorCategoryTitle(indicatorConfig.title),
                      );
                    }
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onConfigUpdated(IndicatorConfig config) {
    _updatedConfig = config;
  }

  void _onApply(int index, IndicatorConfig config) {
    indicatorsRepo.updateAt(index, config);
    Navigator.pop(context);
    widget.indicatorEventService?.logEditIndicatorSettings(
      config.title,
      getIndicatorCategoryTitle(config.title),
    );
  }

  Widget _getConfigSettingPage(int index, IndicatorConfig initialConfig) {
    if (initialConfig is RSIIndicatorConfig) {
      return RSISettingPage(
        initialConfig: initialConfig,
        onConfigUpdated: _onConfigUpdated,
        onApply: () => _onApply(index, _updatedConfig),
      );
    } else if (initialConfig is BollingerBandsIndicatorConfig) {
      return BollingerBandsSettingsPage(
        initialConfig: initialConfig,
        onConfigUpdated: _onConfigUpdated,
        onApply: () => _onApply(index, _updatedConfig),
      );
    } else if (initialConfig is MACDIndicatorConfig) {
      return MACDSettingsPage(
        initialConfig: initialConfig,
        onConfigUpdated: _onConfigUpdated,
        onApply: () => _onApply(index, _updatedConfig),
      );
    } else if (initialConfig is MAIndicatorConfig) {
      return MASettingsPage(
        initialConfig: initialConfig,
        onConfigUpdated: _onConfigUpdated,
        onApply: () => _onApply(index, _updatedConfig),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildIndicatorEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: ListView(
              children: [
                SvgPicture.asset(
                  emptyStateIndicatorsIcon,
                  height: Dimens.iconSize48,
                  package: 'deriv_mobile_chart_wrapper',
                ),
                const SizedBox(height: ThemeProvider.margin08),
                Text(
                  context
                      .mobileChartWrapperLocalizations.infoNoActiveIndicators,
                  style: context.themeProvider.textStyle(
                    textStyle: TextStyles.body1,
                    color: const Color(0xFF999999),
                  ),
                  textAlign: TextAlign.center,
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
              context.mobileChartWrapperLocalizations.infoAddIndicator,
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
    return InfoBanner(
      message: context
          .mobileChartWrapperLocalizations.infoMaximumActiveIndicatorsAdded,
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
                        labelBuilder: (_, __) => tabLabel.getTitle(context),
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

  void _showIndicatorInfoBottomSheet(IndicatorItemModel indicator) {
    widget.indicatorEventService?.logClickIndicatorInfo(
      indicator.title,
      indicator.category.name,
    );
    showModalBottomSheet(
      context: context,
      builder: (context) => IndicatorDescriptionBottomSheet(
        indicator: indicator,
        onAddIndicatorPressed: () {
          indicatorsRepo.add(indicator.config);
          Navigator.of(context).pop();
          widget.indicatorEventService
              ?.logAddIndicatorByClickAddOnIndicatorInfo(
            indicator.title,
            indicator.category.name,
          );
        },
      ),
    );
  }

  void _onChipTapped(IndicatorTabLabel? value, String? title) =>
      setState(() => _selectedChip = value ?? IndicatorTabLabel.all);

  Future<bool> _showDeleteIndicatorDialog(
    IndicatorConfig config,
    int index,
  ) async {
    bool isIndicatorRemoved = false;
    await showAlertDialog(
        context: context,
        title: context.mobileChartWrapperLocalizations.labelDeleteIndicator(
          getIndicatorAbbreviationWithCount(config, context),
        ),
        content: Text(
          context.mobileChartWrapperLocalizations.infoDeleteIndicator,
          style: TextStyles.subheading,
        ),
        positiveActionLabel:
            context.mobileChartWrapperLocalizations.labelDelete,
        negativeButtonLabel:
            context.mobileChartWrapperLocalizations.labelCancel,
        showLoadingIndicator: false,
        onPositiveActionPressed: () {
          indicatorsRepo.removeAt(index);
          Navigator.pop(context, true);
          isIndicatorRemoved = true;
        },
        onNegativeActionPressed: () {
          Navigator.pop(context, false);
        });
    return isIndicatorRemoved;
  }

  void _showDeleteAllIndicatorsDialog() {
    showAlertDialog(
        context: context,
        title: context.mobileChartWrapperLocalizations.labelDeleteAllIndicators,
        content: Text(
          context.mobileChartWrapperLocalizations.infoDeleteAllIndicators,
          style: TextStyles.subheading,
        ),
        positiveActionLabel:
            context.mobileChartWrapperLocalizations.labelDeleteAll,
        negativeButtonLabel:
            context.mobileChartWrapperLocalizations.labelCancel,
        showLoadingIndicator: false,
        onPositiveActionPressed: () {
          indicatorsRepo.clear();
          Navigator.pop(context);
          widget.indicatorEventService?.logCleanAllActiveIndicator();
        },
        onNegativeActionPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  void dispose() {
    widget.indicatorEventService?.logCloseIndicatorTypesBottomSheet();
    super.dispose();
  }
}
