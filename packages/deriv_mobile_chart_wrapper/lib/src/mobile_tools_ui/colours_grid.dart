import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

///
class ColoursGrid extends StatelessWidget {
  final void Function(int index) onColorSelected;

  const ColoursGrid(
      {super.key,
      required this.colors,
      this.selectedColor,
      required this.onColorSelected});

  final List<Color> colors;

  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onColorSelected(index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: selectedColor == colors[index]
                    ? Border.all(color: context.theme.colors.blue, width: 1)
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
