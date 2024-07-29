import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

import 'colours_grid.dart';

/// example of how to use the ColorSelector widget:
///
/// Center(
///       child: ColorSelector(
///          colors: const [
///           Color(0xFFFFFFFF), // White
///           Color(0xFFF39230), // Orange
///           Color(0xFFEF6B53), // Deep Orange
///           Color(0xFFD73737), // Red
///           Color(0xFF03BFF0), // Light Blue
///           Color(0xFF3271B4), // Blue
///           Color(0xFF2FBCB5), // Teal
///           Color(0xFF8EC648), // Light Green
///           Color(0xFF48A25C), // Green
///           Color(0xFFFFF224), // Yellow
///           Color(0xFFEE6EA9), // Pink
///           Color(0xFF853289), // Purple
///         ],
///         selectedColorIndex: selectedColorIndex,
///         onColorChanged: (int index) {
///           setState(() {
///             selectedColorIndex = index;
///           });
///           print('Selected color index: $index');
///         },
///         title: 'Color Selector',
///       ),
///     );
///
class ColorSelector extends StatefulWidget {
  ColorSelector({
    required this.colors,
    required this.title,
    this.selectedColorIndex,
    required this.onColorChanged,
  }) : super(key: ValueKey(selectedColorIndex));

  final String title;

  final int? selectedColorIndex;

  final List<Color> colors;

  final void Function(int index) onColorChanged;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int? _selectedColorIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _selectedColorIndex = widget.selectedColorIndex;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => StatefulBuilder(builder: (context, state) {
              return DerivBottomSheet(
                height: MediaQuery.of(context).size.height * 0.38,
                title: widget.title,
                hasActionButton: true,
                actionButtonLabel:
                    context.mobileChartWrapperLocalizations.labelOK,
                onActionButtonPressed: _selectedColorIndex == null
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
                child: SizedBox(
                  child: ColoursGrid(
                    onColorSelected: (int index) {
                      state(() {
                        _selectedColorIndex = index;
                      });
                      widget.onColorChanged(index);
                    },
                    colors: widget.colors,
                    selectedColorIndex: _selectedColorIndex,
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
              Text(widget.title, style: TextStyles.caption),
              Row(
                children: <Widget>[
                  Container(
                    width: ThemeProvider.margin24,
                    height: ThemeProvider.margin24,
                    decoration: _selectedColorIndex == null
                        ? null
                        : BoxDecoration(
                            color: widget.colors[_selectedColorIndex!],
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
