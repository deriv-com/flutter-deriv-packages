import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

/// Created to preserve state while changing knobs.
final GlobalKey<State<StatefulWidget>> enabledTextFieldKey = GlobalKey();
final GlobalKey<State<StatefulWidget>> errorTextFieldKey = GlobalKey();

@UseCase(
  name: 'Enabled',
  type: BaseTextField,
)
Widget baseTextFieldEnabledUseCase(BuildContext context) => BaseTextField(
      key: enabledTextFieldKey,
      autofocus: true,
      onChanged: (String value) {},
      labelText: 'Label',
    );

@UseCase(
  name: 'Disabled',
  type: BaseTextField,
)
Widget baseTextFieldDisabledUseCase(BuildContext context) => BaseTextField(
      onChanged: (String value) {},
      labelText: 'Label',
      enabled: false,
    );

@UseCase(
  name: 'Error',
  type: BaseTextField,
)
Widget baseTextFieldErrorUseCase(BuildContext context) => BaseTextField(
      key: errorTextFieldKey,
      autofocus: true,
      onChanged: (String value) {},
      labelText: 'Enter something for error',
      validator: (String? p0) => 'This field is required',
    );
