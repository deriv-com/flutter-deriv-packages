import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Picture badge widget.
class PictureBadge extends StatelessWidget {
  /// Initializes [PictureBadge].
  const PictureBadge({required this.icon, required this.badge, Key? key})
      : super(key: key);

  /// Icon asset path.
  final SvgPicture icon;

  /// badge asset path.
  final SvgPicture badge;

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          width: ThemeProvider.margin96,
          height: ThemeProvider.margin96,
          child: Stack(
            children: <Widget>[
              Center(
                child: icon,
              ),
              Positioned(
                right: ThemeProvider.margin06,
                bottom: ThemeProvider.margin06,
                child: badge,
              ),
            ],
          ),
        ),
      );
}
