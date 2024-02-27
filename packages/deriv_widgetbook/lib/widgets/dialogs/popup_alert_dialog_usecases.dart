import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'With checkbox',
  type: PopupAlertDialog,
)
Widget popupAlertDialogUseCase(BuildContext context) => PopupAlertDialog(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      content: Text(
        context.knobs.string(
          label: 'Content',
          initialValue: 'This is the default content.',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.general,
        ),
      ),
      checkBoxValue: true,
      checkboxMessage: context.knobs.string(
        label: 'Checkbox Message',
        initialValue: 'This is the default checkbox message.',
      ),
      isCheckboxVisible: true,
      negativeButtonLabel: context.knobs.string(
        label: 'Negative Button Label',
        initialValue: 'Cancel',
      ),
      positiveButtonLabel: context.knobs.string(
        label: 'Positive Action Label',
        initialValue: 'Confirm',
      ),
      onPositiveActionPressed: () {},
      onNegativeActionPressed: () {},
    );

@UseCase(
  name: 'Without checkbox',
  type: PopupAlertDialog,
)
Widget popupAlertDialogWithoutCheckboxUseCase(BuildContext context) =>
    PopupAlertDialog(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      content: Text(
        context.knobs.string(
          label: 'Content',
          initialValue: 'This is the default content.',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.general,
        ),
      ),
      checkBoxValue: false,
      checkboxMessage: context.knobs.string(
        label: 'Checkbox Message',
        initialValue: 'This is the default checkbox message.',
      ),
      negativeButtonLabel: context.knobs.string(
        label: 'Negative Button Label',
        initialValue: 'Cancel',
      ),
      positiveButtonLabel: context.knobs.string(
        label: 'Positive Action Label',
        initialValue: 'Confirm',
      ),
      onPositiveActionPressed: () {},
      onNegativeActionPressed: () {},
    );
