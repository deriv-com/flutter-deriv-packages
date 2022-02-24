import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_deriv_bloc_manager/manager.dart';

import 'package:flutter_deriv_theme/text_styles.dart';
import 'package:flutter_deriv_theme/theme_provider.dart';

import 'package:flutter_multipliers/core/helpers/helpers.dart';
import 'package:flutter_multipliers/core/presentation/widgets/popup_alert_dialog.dart';
import 'package:flutter_multipliers/core/extensions/extensions.dart';
import 'package:flutter_multipliers/core/presentation/widgets/loading_indicator.dart';
import 'package:flutter_multipliers/core/presentation/widgets/text_span_hyperlink.dart';
import 'package:flutter_multipliers/core/states/auth/auth_cubit.dart';

/// Displays a pop alert dialog, usually retry and it is used when there is no connection to internet.
Future<void> showAlertDialog({
  required BuildContext context,
  String? title,
  Widget? content,
  String? positiveActionLabel,
  String? negativeButtonLabel,
  bool dismissible = true,
  VoidCallback? onPositiveActionPressed,
  VoidCallback? onNegativeActionPressed,
}) async {
  final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
    title: title,
    content: content,
    showLoadingIndicator: true,
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
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => dismissible,
        child: popupAlertDialog,
      ),
    ),
  );
}

/// Displays a pop alert dialog with a checkbox in the content.
Future<void> showAlertDialogWithCheckbox({
  required BuildContext context,
  String? title,
  Widget? content,
  String? positiveActionLabel,
  String? negativeButtonLabel,
  bool? checkBoxValue,
  String? checkboxMessage,
  bool dismissible = true,
  Function(bool?)? onCheckboxValueChanged,
  VoidCallback? onPositiveActionPressed,
  VoidCallback? onNegativeActionPressed,
}) async {
  final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
    title: title,
    content: content,
    showLoadingIndicator: true,
    positiveButtonLabel: positiveActionLabel,
    onPositiveActionPressed: onPositiveActionPressed,
    negativeButtonLabel: negativeButtonLabel,
    onNegativeActionPressed: onNegativeActionPressed,
    isCheckboxVisible: true,
    checkBoxValue: checkBoxValue,
    checkboxMessage: checkboxMessage,
    onCheckboxValueChanged: onCheckboxValueChanged,
  );

  await Future<void>.delayed(
    Duration.zero,
    () => showDialog<WillPopScope>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => dismissible,
        child: popupAlertDialog,
      ),
    ),
  );
}

/// Shows a simple loading indicator dialog.
Future<void> showSimpleLoadingDialog(BuildContext context) =>
    Future<void>.delayed(
      Duration.zero,
      () async {
        await showDialog<LoadingIndicator>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Center(
            child: Container(
              height: ThemeProvider.margin72,
              width: ThemeProvider.margin72,
              decoration: BoxDecoration(
                color: context.theme.base08Color,
                borderRadius:
                    BorderRadius.circular(ThemeProvider.borderRadius08),
              ),
              child: const Center(child: LoadingIndicator()),
            ),
          ),
        );
      },
    );

/// Shows a simple error dialog with single `TryAgain` action.
Future<void> showErrorDialog({
  required BuildContext context,
  required String errorMessage,
}) =>
    Future<void>.delayed(
      Duration.zero,
      () => showAlertDialog(
        context: context,
        content: Text(
          errorMessage,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.base03Color,
          ),
        ),
        positiveActionLabel: context.localization.actionTryAgain,
        onPositiveActionPressed: () => Navigator.pop(context),
      ),
    );

/// Shows a dialog for informing user that his session has been expired.
Future<void> showTokenExpiredDialog(BuildContext context) => showAlertDialog(
      context: context,
      title: context.localization.informLoggedOutHint,
      content: Text(
        context.localization.informSessionExpiredHint,
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.base03Color,
        ),
      ),
      positiveActionLabel: context.localization.actionLogin,
      dismissible: false,
      onPositiveActionPressed: () => _redirectToLoginPage(context),
    );

/// Shows a dialog for informing user that his account has been deactivated.
Future<void> showAccountDeactivatedDialog(BuildContext context) =>
    showAlertDialog(
      context: context,
      title: context.localization.informAccountDeactivation,
      content: RichText(
        text: TextSpan(
          text: context.localization.informAccountDeactivationDescription1,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.base03Color,
          ),
          children: <InlineSpan>[
            buildTextSpanHyperlink(
              context: context,
              label: context.localization.informAccountDeactivationDescription2,
              url: '$helpCentreUrl',
            ),
            TextSpan(
              text: context.localization.informAccountDeactivationDescription3,
            )
          ],
        ),
      ),
      positiveActionLabel: context.localization.actionOK,
      dismissible: false,
      onPositiveActionPressed: () => _redirectToLoginPage(context),
    );

/// Shows a dialog if account has been flagged as `self_closed`.
Future<void> showSelfClosedDialog(BuildContext context) => Future<void>.delayed(
      Duration.zero,
      () => showAlertDialog(
        context: context,
        title: context.localization.informSelfClosedTitle,
        content: RichText(
          text: TextSpan(
            text: context.localization.informSelfClosedDescription1,
            style: context.theme.textStyle(
              textStyle: TextStyles.body1,
              color: context.theme.base02Color,
            ),
            children: <InlineSpan>[
              buildTextSpanHyperlink(
                context: context,
                label: context.localization.informSelfClosedDescription2,
                url: '$helpCentreUrl',
                style: context.theme.textStyle(
                  textStyle: TextStyles.body1Bold,
                  color: context.theme.brandCoralColor,
                ),
              ),
              TextSpan(
                text: context.localization.informSelfClosedDescription3,
                style: context.theme.textStyle(
                  textStyle: TextStyles.body1,
                  color: context.theme.base02Color,
                ),
              )
            ],
          ),
        ),
        negativeButtonLabel: context.localization.actionLoginToDeriv,
        positiveActionLabel: context.localization.actionCancel,
        onNegativeActionPressed: () {
          openDerivWebPage(context);
          Navigator.pop(context);
        },
        onPositiveActionPressed: () => Navigator.pop(context),
      ),
    );

Future<void> _redirectToLoginPage(BuildContext context) async {
  Navigator.pop(context);

  await BlocManager.instance.fetch<AuthCubit>().logout(isForcedLogout: true);
}
