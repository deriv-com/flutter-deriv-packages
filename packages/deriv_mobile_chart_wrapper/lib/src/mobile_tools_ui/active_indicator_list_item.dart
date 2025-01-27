import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// List item for the active indicator list.
class ActiveIndicatorListItem extends StatelessWidget {
  /// Initializes the active indicator list item.
  const ActiveIndicatorListItem({
    required this.iconAssetPath,
    required this.title,
    required this.subtitle,
    required this.onTapSetting,
    required this.onTapDelete,
    super.key,
  });

  /// The path to the SVG icon asset.
  final String iconAssetPath;

  /// The title of the indicator.
  final String title;

  /// The subtitle of the indicator to show its properties.
  final String subtitle;

  /// The callback which will be called when the
  /// indicator setting button is tapped.
  final VoidCallback onTapSetting;

  /// The callback which will be called when the
  /// indicator delete button is tapped.
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.themeProvider.colors.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ThemeProvider.borderRadius08),
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            SvgPicture.asset(
              iconAssetPath,
              width: ThemeProvider.margin24,
              height: ThemeProvider.margin24,
              package: 'deriv_mobile_chart_wrapper',
            ),
            const SizedBox(width: ThemeProvider.margin08),
            _buildTitle(title, context),
          ],
        ),
        subtitle: _buildTitle(subtitle, context),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onTapSetting,
              color: context.themeProvider.colors.prominent,
              icon: const Icon(Icons.settings_outlined),
            ),
            IconButton(
              onPressed: onTapDelete,
              color: context.themeProvider.colors.prominent,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text, BuildContext context) => Text(
        title,
        style: context.themeProvider.textStyle(
          textStyle: TextStyles.body1,
          color: context.themeProvider.colors.general,
        ),
      );
}
