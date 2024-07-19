import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

import 'custom_chip.dart';

/// A widget to show a list of `CustomChip` widgets.
class ChipsList extends StatelessWidget {
  /// Constructor of the widget
  const ChipsList({
    required this.items,
    this.isHorizontalPaddingEnabled = false,
    double? horizontalPadding,
    Key? key,
  })  : horizontalPadding = isHorizontalPaddingEnabled
            ? (horizontalPadding ?? ThemeProvider.margin16)
            : ThemeProvider.zeroMargin,
        super(key: key);

  /// The list of the items.
  final List<CustomChip> items;

  /// If true enable a padding at the start and end of the list.
  /// Default value is false.
  final bool isHorizontalPaddingEnabled;

  /// The padding value for the horizontal padding.
  /// If [isHorizontalPaddingEnabled] is true and [horizontalPadding] is null
  /// then [ThemeProvider.margin16] will be used as default value.
  /// Otherwise [ThemeProvider.zeroMargin] will be used as default value.
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: ThemeProvider.margin36,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (_, int index) => Padding(
            padding: const EdgeInsets.only(
                left: ThemeProvider.zeroMargin, right: ThemeProvider.margin08),
            child: items[index],
          ),
        ),
      );
}
