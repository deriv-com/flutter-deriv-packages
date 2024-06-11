//handlePasskeysError
import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/src/extensions/context_extensions.dart';
import 'package:deriv_ui/widgets/popup_alert_dialog.dart';
import 'package:flutter/material.dart';

/// Handles the passkeys error state.
void handlePasskeysError(BuildContext context, DerivPasskeysErrorState state) {
  if (state is NoCredentialErrorState) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupAlertDialog(
        title: context.derivPasskeysLocalizations.noPasskeyFound,
        content:
            Text(context.derivPasskeysLocalizations.noPasskeyFoundDescription),
        positiveButtonLabel: context.derivPasskeysLocalizations.ok,
        onPositiveActionPressed: () {
          Navigator.pop(context, context.derivPasskeysLocalizations.ok);
        },
      ),
    );
  } else {
    bool showErrorDialogue = false;
    String title = context.derivPasskeysLocalizations.unexpectedError;
    String content = state.message;

    if (state.errorCode == 'PASSKEYS_SERVICE_ERROR') {
      content = state.message;
      showErrorDialogue = true;
    }
    if (state.errorCode == 'PASSKEYS_NOT_FOUND') {
      title = context.derivPasskeysLocalizations.noPasskeyFound;
      content = state.message;
      showErrorDialogue = true;
    }

    if (state.errorCode == 'PASSKEYS_OFF' || state.errorCode == 'PasskeysOff') {
      title = context.derivPasskeysLocalizations.unable_to_process_your_request;
      content = context.derivPasskeysLocalizations
          .unable_to_process_your_request_description;
      showErrorDialogue = true;
    }

    if (showErrorDialogue) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => PopupAlertDialog(
          title: title,
          content: Text(content),
          positiveButtonLabel: context.derivPasskeysLocalizations.ok,
          onPositiveActionPressed: () {
            Navigator.pop(context, context.derivPasskeysLocalizations.ok);
          },
        ),
      );
    }
  }
}
