import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chart_bottom_sheet.dart';
import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/colours_palettes.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    required this.title,
    required this.initialColor,
    this.onColorChange,
    super.key,
  });

  final String title;

  final Color initialColor;

  final Function(Color)? onColorChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => ChartBottomSheet(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ColoursPalettes(onColorSelected: (color) {
                  setState(() {
                    _color = color;
                    widget.onColorChange?.call(color);
                  });
                  Navigator.pop(context);
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
              Text(widget.title, style: TextStyles.caption),
              Row(
                children: <Widget>[
                  Container(
                    width: ThemeProvider.margin24,
                    height: ThemeProvider.margin24,
                    decoration: BoxDecoration(
                      color: _color,
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
