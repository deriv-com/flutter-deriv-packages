import 'package:deriv_ui/models/custom_icon_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget to show svg or other assets base on [iconData] information.
class CustomImage extends StatelessWidget {
  /// Initializes custom image
  const CustomImage({
    required this.iconData,
    this.semanticLabel,
    Key? key,
  }) : super(key: key);

  /// The icon details that contains the path of the icon from assets, and its width and height.
  final CustomIconData iconData;

  /// The value indicates the purpose of the picture, and will be read out by screen readers.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) => iconData.icon.contains('.svg')
      ? SvgPicture.asset(
          iconData.icon,
          width: iconData.width,
          height: iconData.height,
          semanticsLabel: semanticLabel,
        )
      : Image.asset(
          iconData.icon,
          width: iconData.width,
          height: iconData.height,
          semanticLabel: semanticLabel,
        );
}
