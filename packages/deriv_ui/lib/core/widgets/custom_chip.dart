import 'package:flutter/material.dart';

///  The type of function to be passed to [CustomChip]'s `onTap` property.
typedef OnTapCustomChip = void Function(String value, String? title);

/// Will be called to get the content that needs to be shown inside chips.
typedef LabelBuilder = String Function(String value, String? title);

/// A Custom chip with a disabled and enabled design based on [isEnabled].
class CustomChip extends StatelessWidget {
  /// Initializes a [CustomChip] widget.
  const CustomChip({
    required this.value,
    required this.chipHorizontalPadding,
    required this.chipVerticalPadding,
    required this.containerHeight,
    required this.chipBorderRadius,
    required this.disabledTextColor,
    required this.enabledTextColor,
    required this.disabledBackgroundColor,
    required this.enabledBackgroundColor,
    required this.textStyle,
    this.labelBuilder,
    this.title,
    this.isEnabled = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  /// Whether the chip is enabled or not.
  final bool isEnabled;

  /// The title text to be shown inside of the chip.
  final String? title;

  /// The value text to be shown inside of the chip.
  final String value;

  /// To get the content to be shown inside chips.
  final LabelBuilder? labelBuilder;

  /// Called when a custom chip is tapped.
  final OnTapCustomChip? onTap;

  /// TextStyle of the chip title.
  final TextStyle textStyle;

  /// Height of custom Chip
  final double containerHeight;

  /// Horizontal padding for Chip
  final double chipHorizontalPadding;

  /// Vertical padding for Chip
  final double chipVerticalPadding;
  /// Border radius for Chip
  final double chipBorderRadius;

  /// Enabled background color for Chip
  final Color enabledBackgroundColor;

  /// Disabled background color for Chip
  final Color disabledBackgroundColor;

  /// Enabled Text color for Chip
  final Color enabledTextColor;

  /// Disabled Text color for Chip
  final Color disabledTextColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onTap?.call(value, title),
        child: Container(
          height: containerHeight,
          padding: EdgeInsets.symmetric(
            horizontal: chipHorizontalPadding,
            vertical: chipVerticalPadding,
          ),
          decoration: BoxDecoration(
            color: _backgroundColor(),
            borderRadius: BorderRadius.circular(chipBorderRadius),
          ),
          child: Row(
            children: <Widget>[
              Text(
                labelBuilder?.call(value, title) ??
                    "${title ?? ''}${title != null ? ': ' : ''}$value",
                style: textStyle.copyWith(color: _textColor())
              ),
            ],
          ),
        ),
      );

  Color _backgroundColor() =>
      isEnabled ? enabledBackgroundColor : disabledBackgroundColor;

  Color _textColor() =>
      isEnabled ? enabledTextColor : disabledTextColor;
}
