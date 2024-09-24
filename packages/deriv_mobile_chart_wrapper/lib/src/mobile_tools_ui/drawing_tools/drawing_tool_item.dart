import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// List item widget to show a drawing tool.
class DrawingToolItem extends StatelessWidget {
  /// Constructor of the widget
  const DrawingToolItem({
    required this.iconAssetPath,
    required this.title,
    required this.onTap,
    this.count = 0,
    super.key,
  });

  /// The path to the SVG icon asset.
  final String iconAssetPath;

  /// The title of the drawing tool.
  final String title;

  /// The callback which will be called when the drawing tool item is tapped.
  final VoidCallback onTap;

  /// Number of added drawing tools of this type.
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
            _buildDrawingToolIcon(),
            const SizedBox(width: Dimens.margin08),
            _buildDrawingToolTitle(context),
            const SizedBox(width: Dimens.margin08),
            _buildDrawingToolBadge(count),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawingToolIcon() => SvgPicture.asset(
        iconAssetPath,
        width: ThemeProvider.margin24,
        height: ThemeProvider.margin24,
        package: 'deriv_mobile_chart_wrapper',
      );

  Widget _buildDrawingToolTitle(BuildContext context) => Text(
        title,
        style: context.themeProvider.textStyle(
          textStyle: TextStyles.body1,
          color: context.themeProvider.colors.general,
        ),
      );

  Widget _buildDrawingToolBadge(int count) {
    return DerivBadge(
      count: count,
      enabled: count > 0,
    );
  }
}
