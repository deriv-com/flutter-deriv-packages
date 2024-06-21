import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// List item widget to show an indicator.
class IndicatorListItem extends StatelessWidget {
  /// Constructor of the widget
  const IndicatorListItem({
    required this.iconAssetPath,
    required this.title,
    required this.onInfoIconTapped,
    this.count = 0,
    super.key,
  });

  /// The path to the SVG icon asset.
  final String iconAssetPath;

  /// The title of the indicator.
  final String title;

  /// The callback which will be called when the info icon is tapped.
  final VoidCallback onInfoIconTapped;

  /// Number of added indicators of this type.
  ///
  /// It will show in the item if it's greater than 0.
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ThemeProvider.margin16),
      child: Row(
        children: [
          Image.asset(
            iconAssetPath,
            width: ThemeProvider.margin24,
            height: ThemeProvider.margin24,
          ),
          const SizedBox(width: Dimens.margin08),
          Text(
            title,
            style: context.themeProvider.textStyle(
              textStyle: TextStyles.body1,
              color: context.themeProvider.colors.general,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.info_outline),
            color: context.themeProvider.colors.prominent,
            onPressed: onInfoIconTapped,
          ),
        ],
      ),
    );
  }
}
