import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_draggable_sheet.dart';

/// Bottom sheet container used in chart library.
class ChartBottomSheet extends StatefulWidget {
  /// Creates a bottom sheet container for [child].
  const ChartBottomSheet({
    required this.child,
    this.theme,
    this.title,
    Key? key,
  }) : super(key: key);

  /// Body of bottom sheet container.
  final Widget child;

  /// The theme of the chart which the bottom sheet is being placed inside.
  final ChartTheme? theme;

  final String? title;

  @override
  _ChartBottomSheetState createState() => _ChartBottomSheetState();
}

class _ChartBottomSheetState extends State<ChartBottomSheet> {
  late ChartTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = widget.theme ??
        (Theme.of(context).brightness == Brightness.dark
            ? ChartDefaultDarkTheme()
            : ChartDefaultLightTheme());
  }

  @override
  Widget build(BuildContext context) => CustomDraggableSheet(
        child: Provider<ChartTheme>.value(
          value: _theme,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_theme.borderRadius24Chart),
              topRight: Radius.circular(_theme.borderRadius24Chart),
            ),
            child: Material(
              elevation: 8,
              color: _theme.base07Color,
              child: Column(
                children: <Widget>[
                  _buildTopHandle(),
                  if (widget.title != null) _buildTitle(context, widget.title!),
                  Expanded(
                    child: Ink(
                      color: widget.title != null
                          ? _theme.base08Color
                          : _theme.base07Color,
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildTopHandle() => Container(
        padding: EdgeInsets.symmetric(vertical: _theme.margin08Chart),
        width: double.infinity,
        child: Center(
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: _theme.base05Color,
              borderRadius: BorderRadius.circular(_theme.borderRadius04Chart),
            ),
          ),
        ),
      );

  Widget _buildTitle(BuildContext context, String title) => Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.margin16),
        alignment: Alignment.center,
        child: Text(
          title,
          style: DerivThemeProvider.getTheme(context).textStyle(
            textStyle: TextStyles.subheading,
            color: DerivThemeProvider.getTheme(context).colors.prominent,
          ),
        ),
      );
}
