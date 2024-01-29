
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Custom Tooltip class.
class CustomTooltip extends StatefulWidget {
  /// Initializes the custom tooltip class.
  const CustomTooltip({
    required this.message,
    required this.child,
    required this.tooltipKey,
    this.paddingHorizontal,
    this.paddingVertical,
    this.borderRadius,
    this.backgroundColor,
    this.textStyle,
    this.preferBelow = true,
  });

  /// Message to be displayed in tooltip.
  final String message;

  /// Widget that displays tooltip when tapped/ long pressed.
  final Widget child;

  /// Unique identifier for Widgets with tooltip.
  final GlobalKey tooltipKey;

  /// Horizontal padding for tooltip.
  ///
  /// Default to `ThemeProvider.margin16`.
  final double? paddingHorizontal;

  /// Vertical padding for tooltip.
  ///
  /// Default to `ThemeProvider.margin08`.
  final double? paddingVertical;

  /// Border radius for tooltip.
  ///
  /// Default to `ThemeProvider.borderRadius08`.
  final double? borderRadius;

  /// Background colour for tooltip.
  ///
  /// Default to `theme.base06Color`.
  final Color? backgroundColor;

  /// TextStyle for tooltip message.
  ///
  /// Default to `TextStyles.caption`.
  final TextStyle? textStyle;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// Defaults to true. If there is insufficient space to display the tooltip in
  /// the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  final bool preferBelow;

  @override
  _CustomTooltipState createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  @override
  Widget build(BuildContext context) => Tooltip(
        key: widget.tooltipKey,
        child: InkWell(
            child: widget.child,
            onTap: () => showToolTipMessage(widget.tooltipKey)),
        message: widget.message,
        textStyle: widget.textStyle ?? TextStyles.caption,
        padding: EdgeInsets.symmetric(
          horizontal: widget.paddingHorizontal ?? ThemeProvider.margin16,
          vertical: widget.paddingVertical ?? ThemeProvider.margin08,
        ),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? context.theme.colors.hover,
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? ThemeProvider.borderRadius08,
          ),
        ),
        preferBelow: widget.preferBelow,
      );
}

/// Display the tooltip.
void showToolTipMessage(GlobalKey toolTipKey) {
  final dynamic tooltip = toolTipKey.currentState;

  tooltip.ensureTooltipVisible();
}
