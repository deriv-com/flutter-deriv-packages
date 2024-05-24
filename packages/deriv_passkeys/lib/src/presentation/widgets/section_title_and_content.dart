import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';

/// A widget that displays a section title and content.
class SectionTitleAndContent extends StatelessWidget {
  /// Creates a [SectionTitleAndContent].
  const SectionTitleAndContent({
    required this.title,
    required this.texts,
  });

  /// The title of the section.
  final String title;

  /// The content of the section.
  final List<String> texts;

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
          UnorderedList(
            texts: texts,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: context.theme.colors.general,
            ),
            expandedContent: true,
          ),
        ],
      );
}
