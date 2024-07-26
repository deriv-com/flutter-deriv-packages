import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A button with a background.
class ChartSettingButtonWithBackground extends StatelessWidget {
  /// Creates a button with a background.
  const ChartSettingButtonWithBackground({
    required this.child,
    required this.onTap,
    super.key,
  });

  /// The button content.
  final Widget child;

  /// The callback function to be called when the button is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
        width: ThemeProvider.margin32,
        height: ThemeProvider.margin32,
        decoration: BoxDecoration(
          color: context.theme.colors.secondary,
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
          child: InkWell(
            borderRadius: BorderRadius.circular(ThemeProvider.borderRadius04),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(ThemeProvider.margin08),
              child: child,
            ),
          ),
        ),
      );
}
