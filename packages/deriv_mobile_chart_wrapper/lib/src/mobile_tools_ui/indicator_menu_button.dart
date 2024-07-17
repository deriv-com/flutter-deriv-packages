import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'chart_setting_button_with_background.dart';

/// A button that opens the indicator menu.
class IndicatorMenuButton extends StatelessWidget {
  /// Initializes the indicator menu button.
  const IndicatorMenuButton({
    required this.onTap,
    super.key,
  });

  /// The callback function to be called when the button is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ChartSettingButtonWithBackground(
        onTap: onTap,
        child: SvgPicture.asset(
          indicatorsMenuIcon,
          width: ThemeProvider.margin18,
          height: ThemeProvider.margin18,
          package: 'deriv_mobile_chart_wrapper',
        ),
      );
}
