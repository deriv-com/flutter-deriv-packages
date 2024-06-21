import 'package:deriv_mobile_chart_wrapper/src/mobile_tools_ui/chips_list.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:flutter/material.dart';

import 'custom_chip.dart';

/// Bottom sheet content to show the list of support tools (indicators/ drawing
/// tools) for the mobile version.
class MobileToolsBottomSheetContent extends StatelessWidget {
  /// Initializes the bottom sheet content.
  const MobileToolsBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          _buildHeader(context),
          ChipsList(items: <CustomChip>[
            CustomChip(),
          ]),
        ],
      );

  Widget _buildHeader(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.margin16),
        alignment: Alignment.center,
        child: Text(
          context.mobileChartWrapperLocalizations.labelIndicators,
          style: DerivThemeProvider.getTheme(context).textStyle(
            textStyle: TextStyles.subheading,
            color: DerivThemeProvider.getTheme(context).colors.prominent,
          ),
        ),
      );
}
