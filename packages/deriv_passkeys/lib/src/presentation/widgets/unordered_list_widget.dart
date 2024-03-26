import 'package:flutter/material.dart';

/// A widget that displays a list of items with bullet points.
class UnorderedList extends StatelessWidget {
  /// Creates an [UnorderedList].
  const UnorderedList({required this.texts, this.style});

  /// The list of texts to display.
  final List<String> texts;

  /// The style to use for the text.
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final List<Column> widgetList = texts
        .map((String text) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UnorderedListItem(text, style),
                const SizedBox(height: 5),
              ],
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }
}

/// A widget that displays an unordered list item.
@visibleForTesting
class UnorderedListItem extends StatelessWidget {
  /// Creates an [UnorderedListItem].
  const UnorderedListItem(this.text, this.textStyle);

  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          const SizedBox(
            width: 5,
          ),
          Text('\u2022', style: textStyle),
          const SizedBox(
            width: 5,
          ),
          Text(text, style: textStyle),
        ],
      );
}
