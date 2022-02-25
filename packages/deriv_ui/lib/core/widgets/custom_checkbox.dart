import 'package:flutter/material.dart';

/// Custom checkbox.
class CustomCheckbox extends StatelessWidget {
  /// Initializes alert dialog checkbox.
  const CustomCheckbox({
    required this.message,
    this.value = false,
    this.topMargin = 0,
    this.onValueChanged,
    this.unselectedWidgetColor,
    this.messageStyle,
    this.checkboxActiveWidgetColor,
    this.checkboxCheckedWidgetColor,
    Key? key,
  }) : super(key: key);

  /// String literal of the checkbox message.
  final String message;

  /// Checkbox value.
  final bool? value;

  /// A callback for the listeners of a checkbox, when the checkbox's value changes.
  final Function(bool?)? onValueChanged;

  /// Parent container top margin
  final double? topMargin;

  /// Unselected checkbox widget color
  final Color? unselectedWidgetColor;

  /// Checkbox widget active color
  final Color? checkboxActiveWidgetColor;

  /// Checked checkbox widget color
  final Color? checkboxCheckedWidgetColor;

  /// Message text style
  final TextStyle? messageStyle;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(top: topMargin ?? 0),
        transform: Matrix4.translationValues(-14, 0, 0),
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(
                unselectedWidgetColor: unselectedWidgetColor,
              ),
              child: Checkbox(
                checkColor: checkboxCheckedWidgetColor,
                activeColor: checkboxActiveWidgetColor,
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
                  style: messageStyle,
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
      onValueChanged?.call(newValue);
}
