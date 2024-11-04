import 'package:deriv_theme/theme_provider.dart';
import 'package:deriv_ui/deriv_ui.dart';

import 'package:flutter/material.dart';

/// {@template language_item_list}
/// List of language items. Used in bottom sheet for providing language options.
/// Handles [onLanguageSelected] when item is selected.
/// {@endtemplate}
class LanguageItemList extends StatefulWidget {
  /// {@macro language_item_list}
  const LanguageItemList({
    required this.items,
    required this.onLanguageSelected,
    this.selectedItem,
    this.package,
  });

  /// List of language items
  final List<LanguageModel> items;

  /// Default language selected
  final LanguageModel? selectedItem;

  /// Callback function for on language item select
  final ValueSetter<LanguageModel> onLanguageSelected;

  /// Name of the package where the flag image is located.
  final String? package;

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
                  package: widget.package,
                  item: item,
                  isSelected: widget.selectedItem != null &&
                      widget.selectedItem?.extendedCode.toUpperCase() ==
                          item.extendedCode.toUpperCase(),
                  onPressed: (LanguageModel item) {
                    widget.onLanguageSelected(item);

                    Navigator.of(context).pop();
                  }))
              .toList(),
        ),
      );
}
