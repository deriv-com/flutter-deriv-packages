import 'package:deriv_ui/core/widgets/custom_chip.dart';
import 'package:flutter/material.dart';

/// A widget to show a list of `CustomChip` widgets.
class ChipsList extends StatelessWidget {
  /// Constructor of the widget
  const ChipsList({
    required this.items,
    required this.containerHeight,
    required this.horizontalListPadding,
    required this.listSeparatorPadding,
    Key? key,
  }) : super(key: key);

  /// The list of the items.
  final List<CustomChip> items;

  /// Height of the parent container for Chip list
  final double containerHeight;

  /// Horizontal padding for Chip list
  final double horizontalListPadding;

  /// List Separator padding for Chip list items
  final double listSeparatorPadding;

  @override
  Widget build(BuildContext context) => Container(
        height: containerHeight,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: horizontalListPadding),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) => items[index],
          separatorBuilder: (_, int index) => SizedBox(
            width: listSeparatorPadding,
          ),
          itemCount: items.length,
        ),
      );
}
