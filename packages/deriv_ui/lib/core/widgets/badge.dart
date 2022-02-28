import 'package:flutter/material.dart';

/// This widget displays a widget with the possibility of showing a badge icon
/// with a count value on the widget
class Badge extends StatelessWidget {
  /// Initializes the widget.
  const Badge({
    required this.showDotMinWidth,
    required this.showDotMinHeight,
    required this.semanticLabel,
    required this.notificationBadgeBorderWidth,
    required this.notificationBadgeBackgroundColor,
    required this.noShowDotMinWidth,
    required this.countLabelTextStyle,
    required this.noShowDotMinHeight,
    required this.countLabelContainerWidth,
    required this.countLabelContainerHeight,
    required this.childWidgetPadding,
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

  /// Padding for the child widget that is going to be displayed
  final double childWidgetPadding;


  /// Semantic Notification Count Icon label
  final String semanticLabel;

  /// Notification badge background color
  final Color notificationBadgeBackgroundColor;

  /// Notification badge border radius
  final double notificationBadgeBorderWidth;

  /// Text style of count label shown on badge
  final TextStyle countLabelTextStyle;

  /// Text container width of count label shown on badge
  final double countLabelContainerWidth;

  /// Text container height of count label shown on badge
  final double countLabelContainerHeight;

  /// Min width of the dot container when visibility is true
  final double showDotMinWidth;

  /// Min width of the dot container when visibility is false
  final double noShowDotMinWidth;

  /// Min height of the dot container when visibility is true
  final double showDotMinHeight;

  /// Min height of the dot container when visibility is false
  final double noShowDotMinHeight;

  @override
  Widget build(BuildContext context) {
    final bool showDot = count == null;
    final bool hasCount = !showDot && count! > 0;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        Padding(
          child: child ?? const SizedBox.shrink(),
          padding: EdgeInsets.all(childWidgetPadding),
        ),
        Visibility(
          visible: enabled,
          child: Container(
            decoration: showDot || hasCount
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    color: notificationBadgeBackgroundColor,
                    border: Border.all(width: notificationBadgeBorderWidth),
                  )
                : null,
            constraints: BoxConstraints(
              minWidth:
                  showDot ? showDotMinWidth : noShowDotMinWidth,
              minHeight:
                  showDot ? showDotMinHeight : noShowDotMinHeight,
            ),
            child: hasCount
                ? SizedBox(
                    width: countLabelContainerWidth,
                    height: countLabelContainerHeight,
                    child: Center(
                      child: Text(
                        '$count',
                        semanticsLabel: semanticLabel,
                        textAlign: TextAlign.center,
                        style: countLabelTextStyle,
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
