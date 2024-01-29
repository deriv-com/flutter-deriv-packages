import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Animated popup dialog, to be used as the container of the popup dialogs with animation.
class AnimatedPopupDialog extends StatefulWidget {
  /// Initializes animated popup dialog
  const AnimatedPopupDialog({
    required this.child,
    this.animationDuration = const Duration(milliseconds: 150),
    Key? key,
  }) : super(key: key);

  /// Content of this dialog.
  final Widget child;

  /// Animation Duration.
  final Duration animationDuration;

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
              vertical: ThemeProvider.margin08,
            ),
            child: Card(
              elevation: ThemeProvider.margin04,
              color: context.theme.colors.primary,
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(ThemeProvider.borderRadius04),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(ThemeProvider.margin02),
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
