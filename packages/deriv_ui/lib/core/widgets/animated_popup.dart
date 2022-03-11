import 'package:flutter/material.dart';

import '../../util/color.dart';

/// Animated popup dialog, to be used as the container of the popup dialogs with
/// animation.
class AnimatedPopupDialog extends StatefulWidget {
  /// Initializes animated popup dialog
  const AnimatedPopupDialog({
    required this.child,
    this.animationDuration = const Duration(milliseconds: 150),
    this.cardPadding = 2,
    this.cardBorderRadius = 4,
    this.cardElevation = 4,
    this.cardColor = LightThemeColors.base08,
    this.verticalMargin = 8,
    Key? key,
  }) : super(key: key);

  /// Content of this dialog.
  final Widget child;

  /// Animation Duration of this dialog.
  final Duration animationDuration;

  /// Container vertical margin of this dialog.
  final double? verticalMargin;

  /// Card Elevation value of this dialog.
  final double? cardElevation;

  /// Card color of this dialog.
  final Color? cardColor;

  /// Card border radius of this dialog.
  final double? cardBorderRadius;

  /// Card padding of this dialog
  final double? cardPadding;

  @override
  State<StatefulWidget> createState() => _AnimatedPopupDialogState();
}

class _AnimatedPopupDialogState extends State<AnimatedPopupDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    controller
      ..addListener(() => setState(() {}))
      ..forward();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: _calculateHorizontalPadding(context),
              vertical: widget.verticalMargin ?? 8,
            ),
            child: Card(
              elevation: widget.cardElevation ?? 4,
              color: widget.cardColor ?? LightThemeColors.base08,
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(widget.cardBorderRadius ?? 4),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(widget.cardPadding ?? 2),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      );

  double _calculateHorizontalPadding(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 900) {
      return 0.25 * screenWidth;
    } else if (screenWidth > 750) {
      return 0.2 * screenWidth;
    } else if (screenWidth < 400) {
      return 0.02 * screenWidth;
    } else if (screenWidth < 500) {
      return 0.05 * screenWidth;
    } else {
      return 0.1 * screenWidth;
    }
  }
}
