import 'dart:async';

import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/widgets/loading_indicator.dart';
import 'package:deriv_ui/widgets/popup_alert_dialog.dart';
import 'package:deriv_ui/widgets/text_span_hyperlink.dart';
import 'package:flutter/material.dart';

/// Displays a pop alert dialog, usually retry and it is used when there is no connection to internet.
Future<void> showAlertDialog({
  required BuildContext context,
  String? title,
  Key? titleKey,
  Widget? content,
  String? positiveActionLabel,
  String? negativeButtonLabel,
  Key? positiveButtonKey,
  Key? negativeButtonKey,
  bool dismissible = true,
  bool showLoadingIndicator = true,
  bool useRootNavigator = true,
  VoidCallback? onPositiveActionPressed,
  VoidCallback? onNegativeActionPressed,
}) async {
  final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
    title: title,
    titleKey: titleKey,
    content: content,
    showLoadingIndicator: showLoadingIndicator,
    positiveButtonLabel: positiveActionLabel,
    negativeButtonLabel: negativeButtonLabel,
    positiveButtonKey: positiveButtonKey,
    negativeButtonKey: negativeButtonKey,
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
  Function({bool? isChecked})? onCheckboxValueChanged,
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
Future<void> showSimpleLoadingDialog(
  BuildContext context, {
  String? title,
  String? bodyMessage,
}) =>
    Future<void>.delayed(
      Duration.zero,
      () async {
        await showDialog<LoadingIndicator>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WillPopScope(
            onWillPop: () async => false,
            child: SizedBox(
              width: 0,
              height: 0,
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(ThemeProvider.margin24),
                    decoration: BoxDecoration(
                      color: context.theme.colors.hover,
                      borderRadius: BorderRadius.circular(
                        ThemeProvider.borderRadius08,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const LoadingIndicator(),
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: ThemeProvider.margin16,
                            ),
                            child: Text(
                              title,
                              style: context.theme.textStyle(
                                textStyle: TextStyles.title,
                                color: context.theme.colors.prominent,
                              ),
                            ),
                          ),
                        if (bodyMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: ThemeProvider.margin16,
                            ),
                            child: Text(
                              bodyMessage,
                              style: context.theme.textStyle(
                                textStyle: TextStyles.body1,
                                color: context.theme.colors.general,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

/// Shows a simple error dialog with single `TryAgain` action.
Future<void> showErrorDialog({
  required BuildContext context,
  required String? errorMessage,
  required String actionLabel,
  bool dismissible = false,
  bool useRootNavigator = true,
}) =>
    Future<void>.delayed(
      Duration.zero,
      () => showAlertDialog(
        context: context,
        dismissible: dismissible,
        useRootNavigator: useRootNavigator,
        content: Text(
          errorMessage ?? '',
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.general,
          ),
        ),
        positiveActionLabel: actionLabel,
        onPositiveActionPressed: () => Navigator.pop(context),
      ),
    );

/// Shows a dialog for informing user that his session has been expired.
Future<void> showTokenExpiredDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String positiveActionLabel,
  required Function() onPositiveActionPressed,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: Text(
        content,
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.general,
        ),
      ),
      positiveActionLabel: positiveActionLabel,
      dismissible: false,
      onPositiveActionPressed: onPositiveActionPressed,
    );

/// Shows a dialog for informing user that his account has been deactivated.
Future<void> showAccountDeactivatedDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String hyperlinkLabel,
  required String hyperlinkUrl,
  required String positiveActionLabel,
  required String hyperlinkDescription,
  required String userAgent,
  required Function() onPositiveActionPressed,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: RichText(
        text: TextSpan(
          text: content,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1,
            color: context.theme.colors.general,
          ),
          children: <InlineSpan>[
            buildTextSpanHyperlink(
              context: context,
              label: hyperlinkLabel,
              url: hyperlinkUrl,
              openInAppWebview: false,
              userAgent: userAgent,
            ),
            TextSpan(
              text: hyperlinkDescription,
            ),
          ],
        ),
      ),
      positiveActionLabel: positiveActionLabel,
      dismissible: false,
      onPositiveActionPressed: onPositiveActionPressed,
    );

/// Shows a dialog if account has been flagged as `self_closed`.
// Future<void> showSelfClosedDialog(
//   BuildContext context, {
//   required Function() onLiveChatClicked,
// }) =>
//     Future<void>.delayed(
//       Duration.zero,
//       () => showAlertDialog(
//         context: context,
//         title: context.localization.informSelfClosedTitle,
//         content: RichText(
//           text: TextSpan(
//             text: context.localization.informSelfClosedDescription1,
//             style: context.theme.textStyle(
//               textStyle: TextStyles.body1,
//               color: context.theme.base02Color,
//             ),
//             children: <InlineSpan>[
//               TextSpan(
//                   text: context.localization.informSelfClosedDescription2,
//                   style: context.theme.textStyle(
//                     textStyle: TextStyles.body1Bold,
//                     color: context.theme.brandCoralColor,
//                   ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = onLiveChatClicked),
//               TextSpan(
//                 text: context.localization.informSelfClosedDescription3,
//                 style: context.theme.textStyle(
//                   textStyle: TextStyles.body1,
//                   color: context.theme.base02Color,
//                 ),
//               )
//             ],
//           ),
//         ),
//         negativeButtonLabel: context.localization.actionLoginToDeriv,
//         positiveActionLabel: context.localization.actionCancel,
//         onNegativeActionPressed: () {
//           Navigator.pop(context);

//           openDerivLoginWebPage(context);
//         },
//         onPositiveActionPressed: () => Navigator.pop(context),
//       ),
//     );

// Future<void> _redirectToLoginPage(BuildContext context) async {
//   Navigator.pop(context);

//   await BlocManager.instance.fetch<DerivAuthCubit>().logout();
// }

// /// Shows a dialog for informing user that new account has been created.
// Future<void> showAccountCreatedDialog({
//   required BuildContext context,
//   required String selectedCurrency,
//   bool noActions = false,
// }) =>
//     showDialog(
//       context: context,
//       builder: (BuildContext dialogContext) => CustomAlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             PictureBadge(
//               icon: getCurrencyIconPath(selectedCurrency),
//               badge: activeIcon,
//             ),
//             const SizedBox(height: ThemeProvider.margin24),
//             Text(
//               context.localization.labelSuccessExclamation,
//               style: context.theme.textStyle(
//                 textStyle: TextStyles.subheading,
//                 color: context.theme.base01Color,
//               ),
//             ),
//             const SizedBox(height: ThemeProvider.margin08),
//             Text(
//               context.localization.labelAccountCreateDeposit(selectedCurrency),
//               style: context.theme.textStyle(
//                 textStyle: TextStyles.body1,
//                 color: context.theme.base03Color,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//         negativeActionLabel:
//             noActions ? null : context.localization.actionMaybeLater,
//         onNegativeActionPressed:
//             noActions ? null : () => Navigator.pop(dialogContext),
//         positiveActionLabel: noActions
//             ? context.localization.actionOK
//             : context.localization.actionDepositNow,
//         onPositiveActionPressed: () async {
//           if (!noActions) {
//             await openCashierDepositWebPage(dialogContext);
//           }
//           Navigator.of(dialogContext).pop();
//         },
//       ),
//     );
