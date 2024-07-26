import 'package:flutter/material.dart';

import 'package:deriv_theme/deriv_theme.dart';

/// This widget displays a widget with the possibility of showing a badge icon
/// with a count value on the widget
class DerivBadge extends StatelessWidget {
  /// Initializes the widget.
  const DerivBadge({
    super.key,
    this.child,
    this.count,
    this.enabled = true,
    this.alignment = Alignment.topRight,
  });

  /// The widget that is going to be displayed.
  final Widget? child;

  /// Is the badge of the widget is going to be displayed or not
  ///
  /// Default is true.
  final bool enabled;

  /// Displays a count value in the badge widget.
  final int? count;

  /// The position of the badge.
  ///
  /// Default is [Alignment.topRight].
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final bool showDot = count == null;
    final bool hasCount = !showDot && count! > 0;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(ThemeProvider.margin04),
          child: child ?? const SizedBox(),
        ),
        Visibility(
          visible: enabled,
          child: Container(
            decoration: showDot || hasCount
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.colors.danger,
                  )
                : const BoxDecoration(),
            constraints: BoxConstraints(
              minWidth:
                  showDot ? ThemeProvider.margin12 : ThemeProvider.margin16,
              minHeight:
                  showDot ? ThemeProvider.margin12 : ThemeProvider.margin16,
            ),
            child: hasCount
                ? SizedBox(
                    width: ThemeProvider.margin16,
                    height: ThemeProvider.margin16,
                    child: Center(
                      child: Text(
                        '$count',
                        textAlign: TextAlign.center,
                        style: context.theme.textStyle(
                          textStyle: TextStyles.badgeCounter,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
