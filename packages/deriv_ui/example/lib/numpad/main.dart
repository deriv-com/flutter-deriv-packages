import 'dart:async';

import 'package:deriv_ui/deriv_ui.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DerivNumberPad Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final controller =
                  StreamController<ExchangeRateModel>.broadcast();

              final Timer timer =
                  Timer.periodic(const Duration(seconds: 5), (Timer timer) {
                controller.add(
                  ExchangeRateModel(
                    baseCurrency: 'BTC',
                    targetCurrency: 'USD',
                    exchangeRate: (23 * timer.tick).toDouble(),
                  ),
                );
              });

              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPad.withCurrencyExchanger(
                      onClose: (type, closeType, result) {},
                      title: 'Amount',
                      exchangeRatesStream: controller.stream,
                      initialExchangeRate: ExchangeRateModel(
                        baseCurrency: 'BTC',
                        targetCurrency: 'USD',
                        exchangeRate: 42800,
                      ),
                      primaryCurrency: CurrencyDetail(0.123, 'BTC'),
                      label: NumberPadLabel(
                        onValidate: (value) {
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
                                  children: [
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
                  ],
                ),
              );
            },
            child: const Text('Numpad with currency exchange'),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPad(
                      numberPadType: NumberPadWidgetType.singleInput,
                      currency: 'USD',
                      firstInputTitle: 'Amount',
                      formatter: NumberFormat.decimalPattern(),
                      firstInputInitialValue: 20,
                      firstInputMaximumValue: 100,
                      firstInputMinimumValue: 10,
                      label: NumberPadLabel(
                        semanticNumberPadBottomSheetHandle:
                            'semanticNumberPadBottomSheetHandle',
                        warnValueCantBeLessThan: (Object input, Object minValue,
                                Object currency) =>
                            '$input can\'t be less than $minValue $currency',
                        warnValueCantBeGreaterThan: (Object input,
                                Object maxValue, Object currency) =>
                            '$input can\'t be greater than $maxValue $currency',
                        warnDoubleInputValueCantBeLessThan: (Object input,
                                Object minValue, Object currency) =>
                            'Invalid $input. $input can\'t be less than $minValue $currency',
                        warnDoubleInputValueCantBeGreaterThan: (Object input,
                                Object maxValue, Object currency) =>
                            'Invalid $input. $input can\'t be greater than $maxValue $currency',
                        warnValueShouldBeInRange: (Object input,
                                Object minValue,
                                Object currency,
                                Object maxValue) =>
                            '$input between $minValue $currency and $maxValue $currency',
                        actionOK: 'OK',
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Numpad'),
          ),
        ],
      ),
    );
  }
}
