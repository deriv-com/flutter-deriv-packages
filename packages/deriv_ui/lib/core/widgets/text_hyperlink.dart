import 'package:flutter/material.dart';

/// A widget for clickable texts.
class TextHyperlink extends StatelessWidget {
  /// Initializes [TextHyperlink].
  const TextHyperlink({
    required this.label,
    required this.url,
    required this.containerMargin,
    required this.openWebPage,
    this.style,
    Key? key,
  }) : super(key: key);

  /// Label of the [TextHyperlink].
  final String label;

  /// Url of the [TextHyperlink].
  final String url;

  /// Style of the [TextHyperlink].
  final TextStyle? style;

  /// Margin for parent container [TextHyperlink].
  final double containerMargin;

  /// Callback function for opening webpages from [TextHyperlink].
  final Function(BuildContext, String) openWebPage;

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          padding: EdgeInsets.all(containerMargin),
          child: Text(
            label,
            style: style,
          ),
        ),
        onTap: () => openWebPage(context, url),
      );
}
