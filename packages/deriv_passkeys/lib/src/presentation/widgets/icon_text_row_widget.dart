import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays an icon and text in a row.
class IconTextRowWidget extends StatelessWidget {
  /// Creates an [IconTextRowWidget].
  const IconTextRowWidget({
    required this.assetName,
    required this.text,
  });

  /// The name of the asset to display.
  final String assetName;

  /// The text to display.
  final String text;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          SvgPicture.asset(
            assetName,
            package: 'deriv_passkeys',
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      );
}
