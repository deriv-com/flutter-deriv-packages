import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// Custom checkbox.
class CustomCheckbox extends StatelessWidget {
  /// Initializes alert dialog checkbox.
  const CustomCheckbox({
    required this.message,
    this.value = false,
    this.onValueChanged,
    Key? key,
  }) : super(key: key);

  /// String literal of the checkbox message.
  final String message;

  /// Checkbox value.
  final bool? value;

  /// A callback for the listeners of a checkbox, when the checkbox's value changes.
  final Function({bool? newValue})? onValueChanged;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: ThemeProvider.margin08),
        transform: Matrix4.translationValues(-14, 0, 0),
        child: Row(
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
                onTap: onValueChanged == null
                    ? null
                    : () => _onCheckboxValueChange(newValue: value),
                child: Text(
                  message,
                  textAlign: TextAlign.left,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.colors.general,
                  ),
                ),
              ),
            )
          ],
        ),
      );

  void _onCheckboxValueChange({bool? newValue}) =>
      onValueChanged?.call(newValue: newValue);
}
