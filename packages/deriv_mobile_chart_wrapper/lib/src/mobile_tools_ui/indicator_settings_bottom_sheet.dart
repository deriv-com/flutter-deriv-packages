import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndicatorSettingsBottomSheet extends StatefulWidget {
  const IndicatorSettingsBottomSheet({
    super.key,
    this.theme,
    required this.settings,
    required this.indicator,
    required this.onApply,
    required this.onReset,
    required this.onTapInfo,
    required this.onTapDelete,
  });

  /// The theme of the chart which the bottom sheet is being placed inside.
  final ChartTheme? theme;

  /// The settings widget of the indicator.
  final Widget settings;

  /// The indicator name.
  final String indicator;

  /// The callback when the apply button is pressed.
  final VoidCallback onApply;

  /// The callback when the reset button is pressed.
  final VoidCallback onReset;

  /// The callback when the info button is pressed.
  final VoidCallback onTapInfo;

  /// The callback when the delete button is pressed.
  final VoidCallback onTapDelete;

  @override
  State<IndicatorSettingsBottomSheet> createState() =>
      _IndicatorSettingsBottomSheetState();
}

class _IndicatorSettingsBottomSheetState
    extends State<IndicatorSettingsBottomSheet> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeProvider.margin16,
                ),
                child: Column(
                  children: <Widget>[
                    _buildTopHandle(),
                    _buildHeader(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: widget.settings,
                      ),
                    ),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopHandle() => Container(
        padding: EdgeInsets.symmetric(vertical: _theme.margin08Chart),
        width: double.infinity,
        child: Center(
          child: Container(
            width: ThemeProvider.margin40,
            height: ThemeProvider.margin04,
            decoration: BoxDecoration(
              color: _theme.base05Color,
              borderRadius: BorderRadius.circular(_theme.borderRadius04Chart),
            ),
          ),
        ),
      );

  Widget _buildHeader() => Padding(
        padding: EdgeInsets.symmetric(vertical: _theme.margin12Chart),
        child: Row(
          children: [
            /// make it downward
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
            ),
            const SizedBox(
              width: ThemeProvider.margin16,
            ),
            Text(
              widget.indicator,
              style: context.theme.textStyle(
                textStyle: TextStyles.title,
                color: context.theme.colors.prominent,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.info_outline),
              color: context.theme.colors.prominent,
              onPressed: widget.onTapInfo,
            ),
            const SizedBox(
              width: ThemeProvider.margin12,
            ),
            IconButton(
              onPressed: widget.onTapDelete,
              color: context.theme.colors.prominent,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      );

  Widget _buildActionButtons() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin16,
        ),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: widget.onReset,
                child: Text(
                  context.mobileChartWrapperLocalizations.labelReset,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.disabled,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: ThemeProvider.margin08,
            ),
            Expanded(
              child: PrimaryButton(
                  onPressed: widget.onApply,
                  child: Text(
                    context.mobileChartWrapperLocalizations.labelApply,
                    style: context.theme.textStyle(
                      textStyle: TextStyles.body2,
                      color: context.theme.colors.prominent,
                    ),
                  )),
            )
          ],
        ),
      );
}
