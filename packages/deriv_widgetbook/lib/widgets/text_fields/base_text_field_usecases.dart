import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Enabled',
  type: BaseTextField,
)
Widget baseTextFieldEnabledUseCase(BuildContext context) {
  return BaseTextField(
    focusNode: FocusNode(),
    autofocus: true,
    onChanged: (value) {},
    labelText: context.knobs.string(
      label: 'Label',
      initialValue: 'Label',
    ),
  );
}

@UseCase(
  name: 'Disabled',
  type: BaseTextField,
)
Widget baseTextFieldDisabledUseCase(BuildContext context) {
  return BaseTextField(
    focusNode: FocusNode(),
    onChanged: (value) {},
    labelText: context.knobs.string(
      label: 'Label',
      initialValue: 'Label',
    ),
    enabled: false,
  );
}

@UseCase(
  name: 'Error',
  type: BaseTextField,
)
Widget baseTextFieldErrorUseCase(BuildContext context) {
  return BaseTextField(
    focusNode: FocusNode(),
    onChanged: (value) {},
    labelText: context.knobs.string(
      label: 'Label',
      initialValue: 'Label',
    ),
    validator: (p0) {
      return 'This field is required';
    },
  );
}
