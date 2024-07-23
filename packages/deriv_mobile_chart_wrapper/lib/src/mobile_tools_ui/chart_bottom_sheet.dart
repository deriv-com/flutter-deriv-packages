import 'package:deriv_chart/deriv_chart.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Bottom sheet container used in chart library.
class ChartBottomSheet extends StatefulWidget {
  /// Creates a bottom sheet container for [child].
  const ChartBottomSheet({
    required this.child,
    this.theme,
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.hasActionButton = false,
    this.actionButtonLabel,
    this.onActionButtonPressed,
    this.padding,
    this.height,
  }) : super(key: key);

  /// Body of bottom sheet container.
  final Widget child;

  /// The theme of the chart which the bottom sheet is being placed inside.
  final ChartTheme? theme;

  /// Title of the bottom sheet.
  final String title;

  /// Whether to show back button in the header.
  final bool showBackButton;

  /// Whether to show action button at the bottom of the sheet.
  final bool hasActionButton;

  /// Label of the action button.
  final String? actionButtonLabel;

  /// Callback when the action button is pressed.
  final VoidCallback? onActionButtonPressed;

  /// Height of the bottom sheet.
  final double? height;

  /// Padding of the bottom sheet content.
  final EdgeInsetsGeometry? padding;

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
  Widget build(BuildContext context) => Provider<ChartTheme>.value(
        value: _theme,
        child: DerivBottomSheet(
          title: widget.title,
          height: widget.height,
          color: _theme.base07Color,
          showBackButton: widget.showBackButton,
          hasActionButton: widget.hasActionButton,
          actionButtonLabel: widget.actionButtonLabel,
          onActionButtonPressed: widget.onActionButtonPressed,
          padding: widget.padding,
          child: widget.child,
        ),
      );
}
