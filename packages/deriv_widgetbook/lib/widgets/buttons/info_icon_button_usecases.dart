import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Info icon button',
  type: InfoIconButton,
)
Widget infoIconButtonUseCase(BuildContext context) {
  return InfoIconButton(
    dialogTitle: context.knobs.string(
      label: 'Dialog Title',
      initialValue: 'Dialog Title',
    ),
    dialogDescription: context.knobs.string(
      label: 'Dialog Content',
      initialValue: 'Dialog Content',
    ),
    positiveActionLabel: context.knobs.string(
      label: 'Positive Action Label',
      initialValue: 'Okay',
    ),
  );
}
