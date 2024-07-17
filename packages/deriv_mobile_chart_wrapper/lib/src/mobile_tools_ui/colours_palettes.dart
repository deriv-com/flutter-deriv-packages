import 'package:flutter/material.dart';

class ColoursPalettes extends StatefulWidget {
  final ValueChanged<Color> onColorSelected;

  const ColoursPalettes({super.key, required this.onColorSelected});

  @override
  ColoursPalettesState createState() => ColoursPalettesState();
}

class ColoursPalettesState extends State<ColoursPalettes> {
  final List<Color> colors = [
    const Color(0xFFFFFFFF), // White
   const Color(0xFFF39230), // Orange
   const Color(0xFFEF6B53), // Deep Orange
   const Color(0xFFD73737), // Red
   const Color(0xFF03BFF0), // Light Blue
   const Color(0xFF3271B4), // Blue
   const Color(0xFF2FBCB5), // Teal
   const Color(0xFF8EC648), // Light Green
   const Color(0xFF48A25C), // Green
   const Color(0xFFFFF224), // Yellow
   const Color(0xFFEE6EA9), // Pink
   const Color(0xFF853289), // Purple
  ];

  final Color borderColor = const Color(0xFF85ACB0);
  Color? selectedColor;

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
              setState(() {
                selectedColor = colors[index];
              });
              widget.onColorSelected(colors[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: selectedColor == colors[index]
                    ? Border.all(color: borderColor, width: 1)
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
