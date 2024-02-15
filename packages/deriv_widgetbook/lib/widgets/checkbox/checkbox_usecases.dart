import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'checked',
  type: CustomCheckbox,
)
Widget checkboxCheckedUsecase(BuildContext context) {
  return CustomCheckbox(
    message: context.knobs
        .string(label: 'checkbox message', initialValue: 'Checkbox'),
    value: true,
  );
}

@UseCase(
  name: 'unchecked',
  type: CustomCheckbox,
)
Widget checkboxUncheckedUsecase(BuildContext context) {
  return CustomCheckbox(
    message: context.knobs
        .string(label: 'checkbox message', initialValue: 'Checkbox'),
    value: false,
  );
}
