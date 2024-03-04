import 'package:deriv_theme/theme_provider.dart';
import 'package:deriv_ui/deriv_ui.dart';

import 'package:flutter/material.dart';

/// {@template language_item_list}
/// List of language items.
/// Handles [onLanguageSelected] when item is selected.
/// {@endtemplate}
class LanguageItemList extends StatefulWidget {
  /// {@macro language_item_list}
  const LanguageItemList({
    required this.items,
    required this.onLanguageSelected,
    this.selectedItem,
  });

  /// List of language items
  final List<LanguageModel> items;

  /// Default language selected
  final LanguageModel? selectedItem;

  /// Callback function for on language item select
  final ValueSetter<LanguageModel> onLanguageSelected;

  @override
  _LanguageItemListState createState() => _LanguageItemListState();
}

class _LanguageItemListState extends State<LanguageItemList> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ThemeProvider.margin16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.items
              .map((LanguageModel item) => LanguageSelectorItem(
                  item: item,
                  isSelected: widget.selectedItem != null &&
                      widget.selectedItem?.code == item.code,
                  onPressed: (LanguageModel item) {
                    widget.onLanguageSelected(item);

                    Navigator.of(context).pop();
                  }))
              .toList(),
        ),
      );
}
