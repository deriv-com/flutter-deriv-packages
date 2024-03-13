import 'dart:async';

import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'With Currency Exchanger',
  type: NumberPad,
)
Widget numpadWithCurrencyExchangerUseCase(BuildContext context) {
  final StreamController<ExchangeRateModel> controller =
      StreamController<ExchangeRateModel>.broadcast();
  return Align(
    alignment: Alignment.bottomCenter,
    child: NumberPad.withCurrencyExchanger(
      onClose: (NumberPadWidgetType type, NumberPadCloseType closeType,
          NumberPadData result) {},
      title: 'Amount',
      exchangeRatesStream: controller.stream,
      initialExchangeRate: ExchangeRateModel(
        baseCurrency: 'BTC',
        targetCurrency: 'USD',
        exchangeRate: 42800,
      ),
      primaryCurrency: CurrencyDetail(0.123, 'BTC'),
      label: NumberPadLabel(
        onValidate: (String value) {
          if (value.isEmpty) {
            return NumpadValidationText(
              enableActionButton: false,
              text: RichText(
                text: TextSpan(
                  text: 'Please enter an amount',
                  style: context.theme.textStyle(
                    textStyle: TextStyles.captionBold,
                    color: context.theme.colors.blue,
                  ),
                ),
              ),
            );
          }
          if (double.parse(value) > 50) {
            return NumpadValidationText(
              enableActionButton: false,
              text: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'You have reached the daily transfer limit of [50,000.00] USD between your USD Wallet and Deriv X.',
                  style: context.theme.textStyle(
                    textStyle: TextStyles.captionBold,
                    color: context.theme.colors.blue,
                  ),
                ),
              ),
            );
          } else {
            return NumpadValidationText(
              text: RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'This looks good! Hehe',
                      style: context.theme.textStyle(
                        textStyle: TextStyles.captionBold,
                        color: context.theme.colors.disabled,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        actionOK: 'OK',
      ),
    ),
  );
}
