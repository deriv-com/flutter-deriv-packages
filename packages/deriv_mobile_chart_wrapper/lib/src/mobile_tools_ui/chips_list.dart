import 'package:flutter/material.dart';
import 'package:deriv_theme/deriv_theme.dart';

import 'custom_chip.dart';

// TODO(Ramin): add to deriv_ui package.
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
  Widget build(BuildContext context) => Container(
        height: ThemeProvider.margin36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (_, int index) {
            final double leftPadding =
                index == 0 ? horizontalPadding : ThemeProvider.zeroMargin;
            final double rightPadding = index == items.length - 1
                ? horizontalPadding
                : ThemeProvider.margin08;

            return Padding(
              padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
              child: items[index],
            );
          },
        ),
      );
}
