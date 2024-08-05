import 'package:flutter/material.dart';

import 'package:deriv_theme/deriv_theme.dart';

///  The type of function to be passed to [CustomChip]'s `onTap` property.
typedef OnTapCustomChip<T> = void Function(T? value, String? title);

/// Will be called to get the content that needs to be shown inside chips.
typedef LabelBuilder<T> = String Function(T? value, String? title);

/// Will be called to get the content that needs to be shown inside chips.
typedef LabelWidgetBuilder<T> = Widget Function(T? value, String? title);

/// A Custom chip with a disabled and enabled design based on [isSelected].
class CustomChip<T> extends StatelessWidget {
  /// Initializes a [CustomChip] widget.
  const CustomChip({
    this.value,
    this.labelBuilder,
    this.labelWidgetBuilder,
    this.title,
    this.isSelected = true,
    this.textStyle,
    this.onTap,
    this.borderRadius = ThemeProvider.borderRadius04,
    this.activeBackgroundColor,
    Key? key,
  })  : assert(
          value != null || labelWidgetBuilder != null,
          'Both value and labelWidgetBuilder cannot be null at the same time.',
        ),
        super(key: key);

  /// Whether the chip is displayed as selected or not.
  final bool isSelected;

  /// The title text to be shown inside of the chip.
  final String? title;

  /// The value text to be shown inside of the chip.
  final T? value;

  /// To get the content to be shown inside chips.
  final LabelBuilder<T>? labelBuilder;

  /// To get the widget to be shown inside chips.
  final LabelWidgetBuilder<T>? labelWidgetBuilder;

  /// Called when a custom chip is tapped.
  /// Pass [onTap] as null to disable the functionality of the chips.
  final OnTapCustomChip<T>? onTap;

  /// The border radius of chips container.
  final double borderRadius;

  /// Container background color when [isSelected] is true.
  ///
  /// If null then [base6] apply as container background.
  final Color? activeBackgroundColor;

  /// TextStyle of the chip title.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _backgroundColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onTap == null ? null : () => onTap?.call(value, title),
        child: labelWidgetBuilder?.call(value, title) ??
            Text(
              labelBuilder?.call(value, title) ??
                  "${title ?? ''}${title == null ? '' : ': '}$value",
              style: context.theme.textStyle(
                textStyle: textStyle ?? TextStyles.body1,
                color: _textColor(context),
              ),
            ),
      );

  Color _backgroundColor(BuildContext context) => isSelected
      ? activeBackgroundColor ?? context.theme.colors.active
      : context.theme.colors.secondary;

  Color _textColor(BuildContext context) => isSelected
      ? context.theme.colors.prominent
      : context.theme.colors.lessProminent;
}
