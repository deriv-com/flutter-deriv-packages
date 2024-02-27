import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'group.dart';

@UseCase(
  name: 'General Colors',
  type: ColorLabel,
)
Widget buildColorUseCase(BuildContext context) => WidgetbookGroup(
      label: 'General Colors',
      children: <Widget>[
        ColorLabel(
          label: 'Primary',
          color: context.theme.colors.primary,
        ),
        ColorLabel(
          label: 'Secondary',
          color: context.theme.colors.secondary,
        ),
        ColorLabel(
          label: 'Coral',
          color: context.theme.colors.coral,
        ),
        ColorLabel(
          label: 'Blue',
          color: context.theme.colors.blue,
        ),
        ColorLabel(
          label: 'Orange',
          color: context.theme.colors.orange,
        ),
        ColorLabel(
          label: 'Night',
          color: context.theme.colors.night,
        ),
        ColorLabel(
          label: 'Prominent',
          color: context.theme.colors.prominent,
        ),
        ColorLabel(
          label: 'General',
          color: context.theme.colors.general,
        ),
        ColorLabel(
          label: 'LessProminent',
          color: context.theme.colors.lessProminent,
        ),
        ColorLabel(
          label: 'Disabled',
          color: context.theme.colors.disabled,
        ),
        ColorLabel(
          label: 'Active',
          color: context.theme.colors.active,
        ),
        ColorLabel(
          label: 'Hover',
          color: context.theme.colors.hover,
        ),
        ColorLabel(
          label: 'Information',
          color: context.theme.colors.information,
        ),
        ColorLabel(
          label: 'Success',
          color: context.theme.colors.success,
        ),
        ColorLabel(
          label: 'Warning',
          color: context.theme.colors.warning,
        ),
        ColorLabel(
          label: 'Danger',
          color: context.theme.colors.danger,
        ),
      ],
    );

class ColorLabel extends StatelessWidget {
  const ColorLabel({
    required this.label,
    required this.color,
    super.key,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(label),
          ],
        ),
      );
}
