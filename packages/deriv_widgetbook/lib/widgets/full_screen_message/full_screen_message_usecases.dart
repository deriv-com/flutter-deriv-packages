import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'No button',
  type: FullscreenMessage,
)
Widget fullScreenMessageUseCase(BuildContext context) => FullscreenMessage(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      iconData: CustomIconData(
        icon: '/icons/ic_no_connection.svg',
      ),
      description: context.knobs.string(
        label: 'Description',
        initialValue: 'This is the default content.',
      ),
    );

@UseCase(
  name: 'With button',
  type: FullscreenMessage,
)
Widget fullScreenMessageWithButtonUseCase(BuildContext context) =>
    FullscreenMessage(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title',
      ),
      description: context.knobs.string(
        label: 'Description',
        initialValue: 'This is the default content.',
      ),
      iconData: CustomIconData(
        icon: '/icons/ic_no_connection.svg',
      ),
      actionLabel: context.knobs.string(
        label: 'Action Label',
        initialValue: 'Confirm',
      ),
    );
