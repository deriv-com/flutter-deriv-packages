import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// List item widget to show an indicator.
class IndicatorListItem extends StatelessWidget {
  /// Constructor of the widget
  const IndicatorListItem({
    required this.iconAssetPath,
    required this.title,
    required this.onTap,
    required this.onInfoIconTapped,
    this.count = 0,
    super.key,
  });

  /// The path to the SVG icon asset.
  final String iconAssetPath;

  /// The title of the indicator.
  final String title;

  /// The callback which will be called when the indicator item is tapped.
  final VoidCallback onTap;

  /// The callback which will be called when the info icon is tapped.
  final VoidCallback onInfoIconTapped;

  /// Number of added indicators of this type.
  ///
  /// It will show in the item if it's greater than 0.
  final int count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(ThemeProvider.margin16),
        child: Row(
          children: [
            _buildIndicatorIcon(),
            const SizedBox(width: Dimens.margin08),
            _buildIndicatorTitle(context),
            const SizedBox(width: Dimens.margin08),
            _buildIndicatorBadge(count),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: context.themeProvider.colors.prominent,
              onPressed: onInfoIconTapped,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorIcon() => SvgPicture.asset(
        iconAssetPath,
        width: ThemeProvider.margin24,
        height: ThemeProvider.margin24,
        package: 'deriv_mobile_chart_wrapper',
      );

  Widget _buildIndicatorTitle(BuildContext context) => Text(
        title,
        style: context.themeProvider.textStyle(
          textStyle: TextStyles.body1,
          color: context.themeProvider.colors.general,
        ),
      );

  Widget _buildIndicatorBadge(int count) {
    return DerivBadge(
      count: count,
      enabled: count > 0,
    );
  }
}
