import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class IndicatorDescriptionBottomSheet extends StatelessWidget {
  const IndicatorDescriptionBottomSheet({
    super.key,
    required this.indicator,
    required this.onAddIndicatorPressed,
  });

  final IndicatorItemModel indicator;
  final VoidCallback onAddIndicatorPressed;

  @override
  Widget build(BuildContext context) {
    return DerivBottomSheet(
      height: MediaQuery.of(context).size.height * 0.55,
      title: indicator.title,
      showBackButton: true,
      hasActionButton: true,
      actionButtonLabel:
          context.mobileChartWrapperLocalizations.infoAddSelectedIndicator(
        indicator.subtitle,
      ),
      onActionButtonPressed: onAddIndicatorPressed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ColoredBox(
          color: context.theme.colors.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeProvider.margin16,
              horizontal: ThemeProvider.margin16,
            ),
            child: Text(
              indicator.description,
              style: context.theme.textStyle(
                textStyle: TextStyles.body1,
                color: context.theme.colors.general,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
