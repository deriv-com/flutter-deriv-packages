import 'package:deriv_ui/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A class to represent an [IconButton] with an asset badge.
class AssetBadgeButton extends StatelessWidget {
  /// Initializes [AssetBadgeButton]
  ///
  /// [iconAssetName] and [semanticLabel] are required.
  /// [badgeAssetName] default value is `null`, if [badgeAssetName] sets to `null` badge will be invisible.
  const AssetBadgeButton({
    required this.iconAssetName,
    required this.badgeAssetName,
    required this.semanticLabel,
    Key? key,
    this.onPressed,
    this.right=4,
    this.top=4,
  }) : super(key: key);

  /// Badge path.
  final String? badgeAssetName;

  /// Icon asset name.
  final String iconAssetName;

  /// semantic label.
  final String semanticLabel;

  /// On pressed handler.
  final VoidCallback? onPressed;

  final double right;
  final double top;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              iconAssetName,
              semanticsLabel: semanticLabel,
            ),
            onPressed: onPressed?.call,
          ),
          if (badgeAssetName != null)
            Positioned(
              right: right,
              top: top,
              child: ClipOval(
                child: SvgPicture.asset(
                  badgeAssetName!,
                  semanticsLabel:
                      context.localization.semanticBadgeIndicatorIcon,
                ),
              ),
            )
        ],
      );
}
