import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Custom checkbox.
class CustomCheckbox extends StatelessWidget {
  /// Initializes alert dialog checkbox.
  const CustomCheckbox({
    required this.message,
    this.value = false,
    this.onValueChanged,
    this.padding = const EdgeInsets.only(top: ThemeProvider.margin08),
    this.contentsVerticalAlignment = CrossAxisAlignment.center,
    Key? key,
  }) : super(key: key);

  /// String literal of the checkbox message.
  final String message;

  /// Checkbox value.
  final bool? value;

  /// A callback for the listeners of a checkbox, when the checkbox's value changes.
  final Function({bool? isChecked})? onValueChanged;

  /// Padding of the checkbox.
  final EdgeInsetsGeometry padding;

  /// The vertical alignment of the check and message within the row.
  /// Defaults to [CrossAxisAlignment.center].
  ///
  /// Example use case:
  /// If the checkbox's message is longer than the width of the screen,
  /// the message will be wrapped to the multiple line. Then, the message and
  /// the checkbox can be aligned vertically top, center, or bottom of the row.
  final CrossAxisAlignment contentsVerticalAlignment;

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        transform: Matrix4.translationValues(-14, 0, 0),
        child: Row(
          crossAxisAlignment: contentsVerticalAlignment,
          children: <Widget>[
            Theme(
              data: ThemeData(
                unselectedWidgetColor: context.theme.colors.disabled,
              ),
              child: Checkbox(
                checkColor: context.theme.colors.primary,
                activeColor: context.theme.colors.coral,
                value: value,
                onChanged: onValueChanged == null
                    ? null
                    : (bool? newValue) =>
                        _onCheckboxValueChange(newValue: newValue!),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.general,
                  ),
                ),
                onTap: onValueChanged == null
                    ? null
                    : () => _onCheckboxValueChange(newValue: value),
              ),
            )
          ],
        ),
      );

  void _onCheckboxValueChange({bool? newValue}) =>
      onValueChanged?.call(isChecked: newValue);
}
