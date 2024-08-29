import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

import 'colours_grid.dart';

/// A widget that allows the user to select a color from a list of colors.
class ColorSelector extends StatefulWidget {
  ColorSelector({
    this.colors = const [
      Color(0xFFFFFFFF), // White
      Color(0xFFF39230), // Orange
      Color(0xFFEF6B53), // Deep Orange
      Color(0xFFD73737), // Red
      Color(0xFF03BFF0), // Light Blue
      Color(0xFF3271B4), // Blue
      Color(0xFF2FBCB5), // Teal
      Color(0xFF8EC648), // Light Green
      Color(0xFF48A25C), // Green
      Color(0xFFFFF224), // Yellow
      Color(0xFFEE6EA9), // Pink
      Color(0xFF853289), // Purple
    ],
    required this.title,
    this.selectedColor,
    required this.onColorChanged,
  }) : super(key: ValueKey(selectedColor));

  final String title;

  final Color? selectedColor;

  final List<Color> colors;

  final void Function(Color selectedColor) onColorChanged;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color? _selectedColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _selectedColor = widget.selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => StatefulBuilder(builder: (context, state) {
              return SafeArea(
                child: DerivBottomSheet(
                  title: widget.title,
                  hasActionButton: true,
                  actionButtonLabel:
                      context.mobileChartWrapperLocalizations.labelOK,
                  onActionButtonPressed: _selectedColor == null
                      ? null
                      : () {
                          widget.onColorChanged(_selectedColor!);
                          Navigator.of(context).pop();
                        },
                  child: ColoredBox(
                    color: context.theme.colors.primary,
                    child: ColoursGrid(
                      onColorSelected: (int index) {
                        state(() {
                          _selectedColor = widget.colors[index];
                        });
                      },
                      colors: widget.colors,
                      selectedColor: _selectedColor,
                    ),
                  ),
                ),
              );
            }),
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
              Text(widget.title,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.caption,
                    color: context.theme.colors.general,
                  )),
              Row(
                children: <Widget>[
                  Container(
                    width: ThemeProvider.margin24,
                    height: ThemeProvider.margin24,
                    decoration: _selectedColor == null
                        ? null
                        : BoxDecoration(
                            color: _selectedColor,
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
