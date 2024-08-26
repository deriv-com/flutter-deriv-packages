import 'package:deriv_numpad/core/assets.dart';
import 'package:deriv_numpad/number_pad/model/currency_detail.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    : _CurrencyText('${currencyDetail.displayAmount} '),
                _CurrencyText(currencyDetail.displayCurrency),
                const SizedBox(width: ThemeProvider.margin04),
                SvgPicture.asset(
                  swapIcon,
                  package: 'deriv_numpad',
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
  const _CurrencyText(this.message);

  final String message;

  @override
  Widget build(BuildContext context) => Text(
        message,
        style: context.theme.textStyle(
          textStyle: TextStyles.body1,
          color: context.theme.colors.general,
        ),
      );
}
