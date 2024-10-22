import 'package:deriv_mobile_chart_wrapper/src/models/indicator_item_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

class IndicatorSettingsDescriptionBottomSheet extends StatelessWidget {
  const IndicatorSettingsDescriptionBottomSheet({
    super.key,
    required this.indicator,
  });

  final IndicatorItemModel indicator;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(ThemeProvider.borderRadius16),
        topRight: Radius.circular(ThemeProvider.borderRadius16),
      ),
      child: Material(
        elevation: 8,
        color: context.theme.colors.secondary,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildTopHandle(context),
            _buildTitle(context),
            _buildDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHandle(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin08),
        width: double.infinity,
        child: Center(
          child: Container(
            width: ThemeProvider.margin40,
            height: ThemeProvider.margin04,
            decoration: BoxDecoration(
              color: context.theme.colors.disabled,
              borderRadius: BorderRadius.circular(
                ThemeProvider.borderRadius04,
              ),
            ),
          ),
        ),
      );

  Widget _buildTitle(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: ThemeProvider.margin14),
        child: Text(
          indicator.title,
          style: context.theme.textStyle(
            textStyle: TextStyles.subheading,
            color: context.theme.colors.prominent,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget _buildDescription(BuildContext context) => ColoredBox(
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
      );
}
