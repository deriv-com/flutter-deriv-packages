import 'package:flutter/material.dart';

class ActiveSymbolDropdownItems extends StatelessWidget {
  const ActiveSymbolDropdownItems({
    required this.symbolName,
    required this.isSelected,
    super.key,
  });

  final String symbolName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          symbolName,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
}
