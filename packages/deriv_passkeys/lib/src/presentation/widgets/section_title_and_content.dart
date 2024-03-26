import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A widget that displays a section title and content.
class SectionTitleAndContent extends StatelessWidget {
  /// Creates a [SectionTitleAndContent].
  const SectionTitleAndContent({
    required this.title,
    required this.content,
  });

  /// The title of the section.
  final String title;

  /// The content of the section.
  final String content;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: context.theme.colors.prominent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: context.theme.colors.general,
            ),
          ),
        ],
      );
}
