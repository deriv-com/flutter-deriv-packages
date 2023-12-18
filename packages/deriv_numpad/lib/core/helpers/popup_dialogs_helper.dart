import 'dart:async';

import 'package:deriv_numpad/core/widgets/popup_alert_dialog.dart';
import 'package:flutter/material.dart';

/// Displays a pop alert dialog, usually retry and it is used when there is no connection to internet.
Future<void> showAlertDialog({
  required BuildContext context,
  String? title,
  Widget? content,
  String? positiveActionLabel,
  String? negativeButtonLabel,
  bool dismissible = true,
  bool showLoadingIndicator = true,
  bool useRootNavigator = true,
  VoidCallback? onPositiveActionPressed,
  VoidCallback? onNegativeActionPressed,
}) async {
  final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
    title: title,
    content: content,
    showLoadingIndicator: showLoadingIndicator,
    positiveButtonLabel: positiveActionLabel,
    negativeButtonLabel: negativeButtonLabel,
    onPositiveActionPressed: onPositiveActionPressed,
    onNegativeActionPressed: onNegativeActionPressed,
  );

  await Future<void>.delayed(
    Duration.zero,
    () => showDialog<WillPopScope>(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => dismissible,
        child: popupAlertDialog,
      ),
    ),
  );
}
