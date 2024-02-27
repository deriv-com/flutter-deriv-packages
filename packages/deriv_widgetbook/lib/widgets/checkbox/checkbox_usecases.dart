import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'checked',
  type: CustomCheckbox,
)
Widget checkboxCheckedUsecase(BuildContext context) => CustomCheckbox(
      padding: const EdgeInsets.all(
        ThemeProvider.margin24,
      ),
      message: context.knobs
          .string(label: 'checkbox message', initialValue: 'Checkbox'),
      value: true,
    );

@UseCase(
  name: 'unchecked',
  type: CustomCheckbox,
)
Widget checkboxUncheckedUsecase(BuildContext context) => CustomCheckbox(
      padding: const EdgeInsets.all(
        ThemeProvider.margin24,
      ),
      message: context.knobs
          .string(label: 'checkbox message', initialValue: 'Checkbox'),
    );
