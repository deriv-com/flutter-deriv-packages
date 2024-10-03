import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A button that opens the indicator menu.
class IndicatorMenuButton extends StatefulWidget {
  /// Initializes the indicator menu button.
  const IndicatorMenuButton({
    required this.toolsController,
    super.key,
  });

  final ToolsController toolsController;

  @override
  State<IndicatorMenuButton> createState() => _IndicatorMenuButtonState();
}

class _IndicatorMenuButtonState extends State<IndicatorMenuButton> {
  late ValueNotifier<int?> _count;

  @override
  void initState() {
    super.initState();
    _count = ValueNotifier<int?>(
        widget.toolsController.configs?.indicatorConfigs.length);
    widget.toolsController.addListener(() {
      _count.value = widget.toolsController.configs?.indicatorConfigs.length;
    });
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<int?>(
      valueListenable: _count,
      builder: (context, count, _) {
        return DerivBadge(
          count: count,
          enabled: count != null,
          child: ChartSettingButtonWithBackground(
            onTap: () {
              widget.toolsController.showIndicatorsToolsMenu();
            },
            child: SvgPicture.asset(
              indicatorsMenuIcon,
              width: ThemeProvider.margin18,
              height: ThemeProvider.margin18,
              package: 'deriv_mobile_chart_wrapper',
            ),
          ),
        );
      });
}
