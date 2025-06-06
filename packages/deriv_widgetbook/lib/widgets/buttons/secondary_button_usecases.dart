import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Enabled',
  type: SecondaryButton,
)
Widget secondaryButtonEnabledUseCase(BuildContext context) => SecondaryButton(
      onPressed: () {},
      child: Text(
        context.knobs.string(
          label: 'Button Text',
          initialValue: 'Text',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body2,
          color: context.theme.colors.prominent,
        ),
      ),
    );

@UseCase(
  name: 'Disabled',
  type: SecondaryButton,
)
Widget secondaryButtonDisabledUseCase(BuildContext context) => SecondaryButton(
      onPressed: () {},
      isEnabled: false,
      child: Text(
        context.knobs.string(
          label: 'Button Text',
          initialValue: 'Text',
        ),
        style: context.theme.textStyle(
          textStyle: TextStyles.body2,
          color: context.theme.colors.prominent
              .withOpacity(getOpacity(isEnabled: false)),
        ),
      ),
    );
