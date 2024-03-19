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
    final List<Widget> widgetList = <Widget>[];
    for (final String text in texts) {
      widgetList
        ..add(_UnorderedListItem(text, style))
        ..add(const SizedBox(height: 5));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgetList);
  }
}

class _UnorderedListItem extends StatelessWidget {
  const _UnorderedListItem(this.text, this.textStyle);
  final String text;
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
