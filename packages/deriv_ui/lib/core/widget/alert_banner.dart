import 'package:flutter/material.dart';

/// A Material Design alerts banner.
///
/// A banner displays an important message to the user, and provides actions for
/// users to address (or dismiss the banner). A user action is required for it
/// to be dismissed.
///
/// Banners should be displayed at the top of the screen, below the top app bar.
class AlertBanner extends StatelessWidget {
  /// Creates an alert banner that takes place below the top app bar of the page.
  ///
  /// [positiveButtonLabel] is the label of the action button at the most right
  /// of the banner. [onPositiveActionPressed] is called when this button is
  /// clicked.
  ///
  /// [negativeButtonLabel] is the label of the second action button.
  /// [onNegativeActionPressed] is called when this button is clicked.
  ///
  /// [content], [positiveButtonLabel], and [onPositiveActionPressed] are
  /// required as the widget requires user's interaction to dismiss the widget.
  const AlertBanner({
    required this.content,
    required this.positiveButtonLabel,
    required this.onPositiveActionPressed,
    this.negativeButtonLabel,
    this.onNegativeActionPressed,
    this.backgroundColor,
    this.textStyle,
    this.negativeButtonTextStyle,
    this.positiveButtonTextStyle,
    Key? key,
  }) : super(key: key);

  /// The content of the alert banner.
  final String content;

  /// The label of the alert banner positive action button.
  final String positiveButtonLabel;

  /// The label of the alert banner negative action button.
  final String? negativeButtonLabel;

  /// [onPositiveActionPressed] callback
  ///
  /// This callback will be called when the positive action button is visible
  /// on the screen and was tapped.
  final VoidCallback onPositiveActionPressed;

  /// [onNegativeActionPressed] callback
  ///
  /// This callback will be called when the negative action button is visible
  /// on the screen and was tapped.
  final VoidCallback? onNegativeActionPressed;

  /// Background color
  final Color? backgroundColor;

  /// TextStyle
  final TextStyle? textStyle;

  /// Negative button TextStyle[negativeButtonTextStyle]
  final TextStyle? negativeButtonTextStyle;

  /// Negative button TextStyle[positiveButtonTextStyle]
  final TextStyle? positiveButtonTextStyle;

  @override
  Widget build(BuildContext context) => MaterialBanner(
        forceActionsBelow: true,
        content: Text(
          content,
          style: textStyle,
        ),
        backgroundColor: backgroundColor,
        actions: <Widget>[
          if (negativeButtonLabel != null)
            TextButton(
              child: Text(
                negativeButtonLabel!.toUpperCase(),
                style: negativeButtonTextStyle,
              ),
              onPressed: onNegativeActionPressed,
            ),
          TextButton(
            child: Text(
              positiveButtonLabel.toUpperCase(),
              style: positiveButtonTextStyle,
            ),
            onPressed: onPositiveActionPressed,
          ),
        ],
      );
}
