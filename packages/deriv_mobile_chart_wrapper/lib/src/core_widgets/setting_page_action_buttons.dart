import 'package:deriv_mobile_chart_wrapper/src/extensions.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

class SettingActionButtons extends StatelessWidget {
  const SettingActionButtons({
    required this.onApply,
    this.onReset,
    super.key,
  });

  /// The callback function to be called when the configuration is applied.
  final void Function() onApply;

  /// The callback function to be called when the configuration is reset.
  final void Function()? onReset;

  @override
  Widget build(BuildContext context) {
    return _buildActionButtons(context);
  }

  Widget _buildActionButtons(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeProvider.margin16,
        ),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: onReset,
                isEnabled: onReset != null,
                child: Text(
                  context.mobileChartWrapperLocalizations.labelReset,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: onReset != null
                        ? context.theme.colors.prominent
                        : context.theme.colors.active,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: ThemeProvider.margin08,
            ),
            Expanded(
              child: PrimaryButton(
                  onPressed: onApply,
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
