import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Two buttons',
  type: CustomAlertDialog,
)
Widget customAlertDialogUseCase(BuildContext context) => CustomAlertDialog(
      title: Text(
        context.knobs.string(
          label: 'Title',
          initialValue: 'Title',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.title,
          color: context.theme.colors.prominent,
        ),
      ),
      content: Text(
        context.knobs.string(
          label: 'Content',
          initialValue: 'This is the default content.',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.prominent,
        ),
      ),
      negativeActionLabel: context.knobs.string(
        label: 'Negative Action Label',
        initialValue: 'Cancel',
      ),
      positiveActionLabel: context.knobs.string(
        label: 'Positive Action Label',
        initialValue: 'Confirm',
      ),
      onNegativeActionPressed: () {},
      onPositiveActionPressed: () {},
    );

@UseCase(
  name: 'One button',
  type: CustomAlertDialog,
)
Widget customAlertDialogOneButtonUseCase(BuildContext context) =>
    CustomAlertDialog(
      title: Text(
        context.knobs.string(
          label: 'Title',
          initialValue: 'Title',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.title,
          color: context.theme.colors.prominent,
        ),
      ),
      content: Text(
        context.knobs.string(
          label: 'Content',
          initialValue: 'This is the default content.',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.prominent,
        ),
      ),
      positiveActionLabel: context.knobs.string(
        label: 'Positive Action Label',
        initialValue: 'Confirm',
      ),
      onPositiveActionPressed: () {},
    );

@UseCase(
  name: 'No button',
  type: CustomAlertDialog,
)
Widget customAlertDialogNoButtonUseCase(BuildContext context) =>
    CustomAlertDialog(
      title: Text(
        context.knobs.string(
          label: 'Title',
          initialValue: 'Title',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.title,
          color: context.theme.colors.prominent,
        ),
      ),
      content: Text(
        context.knobs.string(
          label: 'Content',
          initialValue: 'This is the default content.',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.prominent,
        ),
      ),
    );
