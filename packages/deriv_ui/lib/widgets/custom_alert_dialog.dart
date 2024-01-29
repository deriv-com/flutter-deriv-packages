import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// {@template custom_alert_dialog}
/// Custom Alert Dialog based on [DerivThemeProvider] colors.
/// It has a title, content, positive and negative button.
/// {@endtemplate}
class CustomAlertDialog extends StatelessWidget {
  /// {@macro custom_alert_dialog}
  const CustomAlertDialog({
    this.title,
    this.content,
    this.positiveActionLabel,
    this.negativeActionLabel,
    this.onPositiveActionPressed,
    this.onNegativeActionPressed,
    Key? key,
  }) : super(key: key);

  /// Title of the dialog.
  final Widget? title;

  /// Description of the dialog.
  final Widget? content;

  /// Negative action label of the dialog.
  final String? negativeActionLabel;

  /// Positive action label of the dialog.
  final String? positiveActionLabel;

  /// Negative action press callback of the dialog.
  final Function? onNegativeActionPressed;

  /// Positive action press callback of the dialog.
  final Function? onPositiveActionPressed;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle textButtonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return context.theme.colors.hover;
          }
          return null;
        },
      ),
    );

    return AlertDialog(
      backgroundColor: context.theme.colors.secondary,
      title: title ?? const SizedBox.shrink(),
      content: content ?? const SizedBox.shrink(),
      actions: <Widget>[
        if (negativeActionLabel != null && onNegativeActionPressed != null)
          TextButton(
            style: textButtonStyle,
            child: Text(
              negativeActionLabel!,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: context.theme.colors.coral,
              ),
            ),
            onPressed: () => onNegativeActionPressed!(),
          ),
        if (negativeActionLabel != null && positiveActionLabel != null)
          const SizedBox(width: ThemeProvider.margin08),
        if (positiveActionLabel != null && onPositiveActionPressed != null)
          TextButton(
            style: textButtonStyle,
            child: Text(
              positiveActionLabel!,
              style: context.theme.textStyle(
                textStyle: TextStyles.button,
                color: context.theme.colors.coral,
              ),
            ),
            onPressed: () => onPositiveActionPressed!(),
          ),
      ],
    );
  }
}
