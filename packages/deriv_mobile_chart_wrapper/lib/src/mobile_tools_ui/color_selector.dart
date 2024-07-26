import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

import 'colours_palettes.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    required this.title,
    required this.color,
    this.onColorChanged,
    super.key,
  });

  final String title;

  final Color color;

  final Function(Color)? onColorChanged;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => DerivBottomSheet(
              title: title,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ColoursPalettes(onColorSelected: (color) {
                  onColorChanged?.call(color);
                }),
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08),
            border: Border.all(color: context.theme.colors.active),
          ),
          padding: const EdgeInsets.all(ThemeProvider.margin08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: TextStyles.caption),
              Row(
                children: <Widget>[
                  Container(
                    width: ThemeProvider.margin24,
                    height: ThemeProvider.margin24,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(
                        ThemeProvider.borderRadius04,
                      ),
                    ),
                  ),
                  const SizedBox(width: ThemeProvider.margin08),
                  const Icon(Icons.keyboard_arrow_down_rounded),
                ],
              )
            ],
          ),
        ),
      );
}
