import 'package:flutter/material.dart';

import '../../util/strings_const.dart';

/// This widget displays a widget with the possibility of showing a badge icon
/// with a count value on the widget
class Badge extends StatelessWidget {
  /// Initializes the widget.
  const Badge({
    this.child,
    this.count,
    this.enabled = true,
    this.alignment = Alignment.topRight,
    this.padding = 4,
    this.badgeTextStyle,
    this.borderWidth = 2,
    this.boxColor = Colors.redAccent,
    this.boxHeight = 16,
    this.boxWidth = 16,
    this.minWidthISCountNull = 16,
    this.minWidthISCountNotNull = 12,
    this.minHeightISCountNull = 16,
    this.minHeightISCountNotNull = 12,
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

  /// PAdding
  final double padding;

  /// Badge Text Style
  final TextStyle? badgeTextStyle;

  /// Border width
  final double borderWidth;

  /// Box Color
  final Color boxColor;

  /// Box width
  final double boxWidth;

  /// Box height
  final double boxHeight;

  /// Min width show dot
  final double minWidthISCountNull;

  /// Min width not show dot
  final double minWidthISCountNotNull;

  /// Min height show dot
  final double minHeightISCountNull;

  /// Min height not show dot
  final double minHeightISCountNotNull;

  @override
  Widget build(BuildContext context) {
    final bool showDot = count == null;
    final bool hasCount = !showDot && count! > 0;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        Padding(
          child: child ?? const SizedBox.shrink(),
          padding: EdgeInsets.all(padding),
        ),
        Visibility(
          visible: enabled,
          child: Container(
            decoration: showDot || hasCount
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: boxColor,
                    border: Border.all(width: borderWidth),
                  )
                : const BoxDecoration(),
            constraints: BoxConstraints(
              minWidth: showDot ? minWidthISCountNull : minWidthISCountNotNull,
              minHeight:
                  showDot ? minHeightISCountNull : minHeightISCountNotNull,
            ),
            child: hasCount
                ? SizedBox(
                    width: boxWidth,
                    height: boxHeight,
                    child: Center(
                      child: Text(
                        '$count',
                        semanticsLabel:
                            _getSemanticLabel(count: count!),
                        textAlign: TextAlign.center,
                        // style: badgeTextStyle,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  String _getSemanticLabel({
    required int count,
  }) =>
      count == 1
          ? semanticNotificationCountIcon
          :semanticNotificationsCountIcon(count);
}
