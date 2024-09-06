import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// List item for the active indicator list.
class ActiveDrawingToolListItem extends StatelessWidget {
  /// Initializes the active indicator list item.
  const ActiveDrawingToolListItem({
    required this.iconAssetPath,
    required this.title,
    required this.onTapDelete,
    super.key,
  });

  /// The path to the SVG icon asset.
  final String iconAssetPath;

  /// The title of the drawing tool.
  final String title;

  /// The callback which will be called when the
  /// drawing tool delete button is tapped.
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
            Text(title),
          ],
        ),
        trailing: IconButton(
          onPressed: onTapDelete,
          color: context.themeProvider.colors.prominent,
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}