import 'package:deriv_numpad/core/helpers/popup_dialogs_helper.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// An Icon button that shows a pop-up dialog when it is tapped.
class InfoIconButton extends StatelessWidget {
  /// Initializes the [InfoIconButton].
  const InfoIconButton({
    required this.actionOK,
    this.dialogTitle,
    this.dialogDescription,
    this.showLoadingIndicator = false,
    this.iconSize = ThemeProvider.iconSize16,
    Key? key,
  }) : super(key: key);

  /// Title that is going to be shown in the dialog.
  final String? dialogTitle;

  /// Description that is going to be shown in the dialog.
  final String? dialogDescription;

  final String actionOK;

  /// Whether or not this [InfoIconButton] should show a loading indicator when
  /// the user taps on the positive action.
  final bool showLoadingIndicator;

  /// Size of the icon.
  ///
  /// Defaults to [ThemeProvider.iconSize16].
  final double iconSize;

  @override
  Widget build(BuildContext context) => IconButton(
        splashRadius: iconSize * 1.1,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(Icons.info_outline, size: iconSize),
        onPressed: () => showAlertDialog(
          showLoadingIndicator: showLoadingIndicator,
          context: context,
          title: dialogTitle,
          content: dialogDescription == null
              ? null
              : Text(
                  dialogDescription!,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body1,
                    color: context.theme.base02Color,
                  ),
                ),
          positiveActionLabel: actionOK,
          onPositiveActionPressed: Navigator.of(context).pop,
        ),
      );
}
