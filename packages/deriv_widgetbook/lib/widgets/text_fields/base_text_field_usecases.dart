import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Created to preserve state while changing knobs.
final uscase1Key = GlobalKey();
final uscase2Key = GlobalKey();
@UseCase(
  name: 'Enabled',
  type: BaseTextField,
)
Widget baseTextFieldEnabledUseCase(BuildContext context) {
  return BaseTextField(
    key: uscase1Key,
    autofocus: true,
    onChanged: (value) {},
    labelText: 'Label',
  );
}

@UseCase(
  name: 'Disabled',
  type: BaseTextField,
)
Widget baseTextFieldDisabledUseCase(BuildContext context) {
  return BaseTextField(
    onChanged: (value) {},
    labelText: 'Label',
    enabled: false,
  );
}

@UseCase(
  name: 'Error',
  type: BaseTextField,
)
Widget baseTextFieldErrorUseCase(BuildContext context) {
  return BaseTextField(
    key: uscase2Key,
    autofocus: true,
    onChanged: (value) {},
    labelText: 'Enter something for error',
    validator: (p0) {
      return 'This field is required';
    },
  );
}
