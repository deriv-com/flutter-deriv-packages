import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'enabled',
  type: SecondaryButton,
)
Widget secondaryButtonEnabledUseCase(BuildContext context) {
  return SecondaryButton(
    onPressed: () {},
    child: Text(context.knobs.string(
      label: 'Button Text',
      initialValue: 'Text',
    )),
  );
}

@UseCase(
  name: 'disabled',
  type: SecondaryButton,
)
Widget secondaryButtonDisabledUseCase(BuildContext context) {
  return SecondaryButton(
    onPressed: () {},
    isEnabled: false,
    child: Text(
      context.knobs.string(
        label: 'Button Text',
        initialValue: 'Text',
      ),
    ),
  );
}
