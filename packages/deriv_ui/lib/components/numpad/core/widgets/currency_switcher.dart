import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/models.dart';
import '../../core/core.dart';

/// A widget that reflects the exchanged currency of what every typed in currency textfield.
class CurrencySwitcher extends StatelessWidget {
  /// Creates an instance of [CurrencySwitcher].
  const CurrencySwitcher({
    required this.currencyDetail,
    this.onTap,
  });

  /// Data class for currency information to show in this widget.
  final CurrencyDetail currencyDetail;

  /// call back when this widget is pressed.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Container(
        key: const ValueKey<String>('numpad_currency_switcher_button_key'),
        decoration: BoxDecoration(
          border: Border.all(
            color: context.theme.colors.general,
          ),
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(ThemeProvider.borderRadius08),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeProvider.margin08,
              vertical: ThemeProvider.margin04,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                currencyDetail.displayAmount.isEmpty
                    ? const SizedBox.shrink()
                    : _CurrencyText(
                        message: '${currencyDetail.displayAmount} ',
                        textKey: const ValueKey<String>(
                            'numpad_currency_switcher_amount_value_key'),
                      ),
                _CurrencyText(
                  message: currencyDetail.displayCurrency,
                  textKey: ValueKey<String>(
                      'numpad_currency_switcher_${currencyDetail.displayCurrency.toLowerCase()}_currency_key'),
                ),
                const SizedBox(width: ThemeProvider.margin04),
                SvgPicture.asset(
                  swapIcon,
                  package: 'deriv_ui',
                  height: ThemeProvider.iconSize16,
                  width: ThemeProvider.iconSize16,
                  colorFilter: ColorFilter.mode(
                    context.theme.colors.prominent,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class _CurrencyText extends StatelessWidget {
  const _CurrencyText({required this.message, this.textKey});

  final String message;
  final Key? textKey;

  @override
  Widget build(BuildContext context) => Text(
        message,
        key: textKey,
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.general,
        ),
      );
}
