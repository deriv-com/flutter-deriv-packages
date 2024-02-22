import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() {
  group('NumberPad widget test', () {
    testWidgets(
        'Appearance of the necessary titles and inputs and keys of single input',
        (WidgetTester tester) async {
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');
      const String currency = 'USDT';
      const double minValue = 10;
      const double maxValue = 60;

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            currency: currency,
            firstInputTitle: 'Trade Amount',
            formatter: formatter,
            firstInputMinimumValue: minValue,
            firstInputMaximumValue: maxValue,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text('Trade Amount'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(1));
      expect(find.byType(TextButton), findsNWidgets(13));
      expect(find.text(currency), findsOneWidget);
      expect(
          find.text(
            'Trade Amount between $minValue $currency and $maxValue $currency',
          ),
          findsOneWidget);
    });

    testWidgets(
        'Appearance of the necessary titles and inputs and keys of double input',
        (WidgetTester tester) async {
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');
      const String currency = 'USDT';

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.doubleInput,
            currency: currency,
            firstInputTitle: 'Take Profit',
            secondInputTitle: 'Stop Loss',
            formatter: formatter,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text('Take Profit'), findsOneWidget);
      expect(find.text('Stop Loss'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text(currency), findsOneWidget);
      expect(find.byType(TextButton), findsNWidgets(13));
    });

    testWidgets(
        'The initial values should be visible in the UI with correct formatting',
        (WidgetTester tester) async {
      const double firstInitialValue = 10;
      const double secondInitialValue = 20;
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.doubleInput,
            formatter: formatter,
            firstInputInitialValue: firstInitialValue,
            secondInputInitialValue: secondInitialValue,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text(formatter.format(firstInitialValue)), findsOneWidget);
      expect(find.text(formatter.format(secondInitialValue)), findsOneWidget);
    });

    testWidgets('Show proper message for input less than minimum',
        (WidgetTester tester) async {
      const double firstInitialValue = 10;
      const double firstMinValue = 20;
      const String firstTitle = 'first';
      const String currency = 'USDT';
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            currency: currency,
            formatter: formatter,
            firstInputInitialValue: firstInitialValue,
            firstInputMinimumValue: firstMinValue,
            firstInputTitle: firstTitle,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      const String message =
          '$firstTitle can\'t be less than $firstMinValue $currency';
      expect(find.text(message), findsOneWidget);
    });

    testWidgets('Show proper message for input greater than maximum',
        (WidgetTester tester) async {
      const String currency = 'USDT';
      const double firstInitialValue = 30;
      const double firstMaxValue = 20;
      const String firstTitle = 'first';
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            currency: currency,
            formatter: formatter,
            firstInputInitialValue: firstInitialValue,
            firstInputMaximumValue: firstMaxValue,
            firstInputTitle: firstTitle,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      const String message =
          '$firstTitle can\'t be greater than $firstMaxValue $currency';

      expect(find.text(message), findsOneWidget);
    });

    testWidgets('onOpen event be called properly', (WidgetTester tester) async {
      bool isOpened = false;
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            formatter: formatter,
            onOpen: () {
              isOpened = true;
            },
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(isOpened, true);
    });

    testWidgets('keys click event works and updates inputField',
        (WidgetTester tester) async {
      const String numberToPress = '5';
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            formatter: formatter,
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      await tester.tap(find.text(numberToPress));
      await tester.pump();

      expect(find.text(numberToPress), findsNWidgets(2));
    });

    testWidgets('onClose event returns the proper values',
        (WidgetTester tester) async {
      bool isClosed = false;
      late NumberPadData data;
      const double firstInitialValue = 20;
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            formatter: formatter,
            firstInputInitialValue: firstInitialValue,
            onClose: (NumberPadWidgetType a, NumberPadCloseType c,
                NumberPadData param2) {
              isClosed = true;
              data = NumberPadData(
                firstInputValue: param2.firstInputValue,
                secondInputValue: param2.secondInputValue,
              );
            },
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pump();

      expect(find.text('OK'), findsOneWidget);
      expect(
        tester.widget<IgnorePointer>(find.byType(IgnorePointer).last).ignoring,
        false,
      );

      tester.widget<TextButton>(find.byType(TextButton).last).onPressed?.call();
      await tester.pump();

      expect(isClosed, true);
      expect(data.firstInputValue, firstInitialValue);
      expect(data.secondInputValue, isNull);
    });

    testWidgets(
        'onClose event returns the proper values when input is not in range',
        (WidgetTester tester) async {
      bool isClosed = false;
      late NumberPadData data;
      const double firstInitialValue = 20;
      final NumberFormat formatter = NumberFormat('#.00', 'en_US');

      await tester.pumpWidget(
        TestWidget(
          NumberPad(
            numberPadType: NumberPadWidgetType.singleInput,
            formatter: formatter,
            firstInputInitialValue: firstInitialValue,
            firstInputMinimumValue: 30,
            onClose: (NumberPadWidgetType a, NumberPadCloseType c,
                NumberPadData param2) {
              isClosed = true;
              data = NumberPadData(
                firstInputValue: param2.firstInputValue,
                secondInputValue: param2.secondInputValue,
              );
            },
            label: NumberPadLabel(
              semanticNumberPadBottomSheetHandle:
                  'semanticNumberPadBottomSheetHandle',
              warnValueCantBeLessThan:
                  (Object input, Object minValue, Object currency) =>
                      '$input can\'t be less than $minValue $currency',
              warnValueCantBeGreaterThan:
                  (Object input, Object maxValue, Object currency) =>
                      '$input can\'t be greater than $maxValue $currency',
              warnDoubleInputValueCantBeLessThan: (Object input,
                      Object minValue, Object currency) =>
                  'Invalid $input. $input can\'t be less than $minValue $currency',
              warnDoubleInputValueCantBeGreaterThan: (Object input,
                      Object maxValue, Object currency) =>
                  'Invalid $input. $input can\'t be greater than $maxValue $currency',
              warnValueShouldBeInRange: (Object input, Object minValue,
                      Object currency, Object maxValue) =>
                  '$input between $minValue $currency and $maxValue $currency',
              actionOK: 'OK',
            ),
          ),
        ),
      );

      await tester.idle();
      await tester.pump();

      expect(find.text('OK'), findsOneWidget);
      expect(
        tester.widget<IgnorePointer>(find.byType(IgnorePointer).last).ignoring,
        true,
      );

      tester.widget<TextButton>(find.byType(TextButton).last).onPressed?.call();

      await tester.pump();

      expect(isClosed, true);
      expect(data.firstInputValue, isNull);
      expect(data.secondInputValue, isNull);
    });
  });

  group('NumberPad with exchange currency', () {
    late ExchangeRateModel mockExchangeRate;
    late Stream<ExchangeRateModel> mockExchangeStream;
    setUpAll(() {
      mockExchangeRate = ExchangeRateModel(
        baseCurrency: 'BTC',
        targetCurrency: 'USD',
        exchangeRate: 42800,
      );
      mockExchangeStream =
          StreamController<ExchangeRateModel>.broadcast().stream;
    });

    testWidgets('should render exchange switcher, numpad, and title',
        (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(
        TestWidget(
          NumberPad.withCurrencyExchanger(
            primaryCurrency: CurrencyDetail(0.123, 'BTC'),
            exchangeRatesStream: mockExchangeStream,
            initialExchangeRate: mockExchangeRate,
            title: 'Amount',
            label: NumberPadLabel(
              actionOK: 'OK',
            ),
          ),
        ),
      );

      expect(find.text('Amount'), findsOneWidget);
      expect(find.byType(CurrencySwitcher), findsOneWidget);
      expect(find.byType(TextButton), findsNWidgets(13));
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets(
        'should populate the textfield when there is an amount in primaryCurrency. ',
        (WidgetTester widgetTester) async {
      final CurrencyDetail mockPrimaryCurrency = CurrencyDetail(0.123, 'BTC');
      await widgetTester.pumpWidget(
        TestWidget(
          NumberPad.withCurrencyExchanger(
            primaryCurrency: mockPrimaryCurrency,
            exchangeRatesStream: mockExchangeStream,
            initialExchangeRate: mockExchangeRate,
            title: 'Amount',
            label: NumberPadLabel(
              actionOK: 'OK',
            ),
          ),
        ),
      );

      final TextField textField =
          find.byType(TextField).evaluate().first.widget as TextField;

      expect(textField.controller!.text, mockPrimaryCurrency.displayAmount);

      expect(find.text('5264.40 '), findsOneWidget);
    });

    testWidgets(
        'should render the exchanged amount in USD in UI when user inputs amount in BTC from the keypad.',
        (WidgetTester widgetTester) async {
      final CurrencyDetail mockPrimaryCurrency = CurrencyDetail(0, 'BTC');
      await widgetTester.pumpWidget(
        TestWidget(
          NumberPad.withCurrencyExchanger(
            primaryCurrency: mockPrimaryCurrency,
            exchangeRatesStream: mockExchangeStream,
            initialExchangeRate: mockExchangeRate,
            title: 'Amount',
            label: NumberPadLabel(
              actionOK: 'OK',
            ),
          ),
        ),
      );

      // Inputted 0 from the keypad
      await widgetTester.tap(find.text('0'));
      await widgetTester.pumpAndSettle();

      // Inputted . from the keypad
      await widgetTester.tap(find.text('.'));
      await widgetTester.pumpAndSettle();

      // Inputted 3 from the keypad
      await widgetTester.tap(find.text('3'));
      await widgetTester.pumpAndSettle();

      // Inputted 5 from the keypad
      await widgetTester.tap(find.text('5'));
      await widgetTester.pumpAndSettle();

      // Inputted 5 from the keypad
      await widgetTester.tap(find.text('5'));
      await widgetTester.pumpAndSettle();

      expect(find.text('15194.00 '), findsOneWidget);
    });

    testWidgets(
      'should switch amount from currency switcher to textfield and vice versa when currency Switcher is pressed.',
      (WidgetTester widgetTester) async {
        final CurrencyDetail mockPrimaryCurrency = CurrencyDetail(0.123, 'BTC');

        await widgetTester.pumpWidget(
          TestWidget(
            NumberPad.withCurrencyExchanger(
              primaryCurrency: mockPrimaryCurrency,
              exchangeRatesStream: mockExchangeStream,
              initialExchangeRate: mockExchangeRate,
              title: 'Amount',
              label: NumberPadLabel(
                actionOK: 'OK',
              ),
            ),
          ),
        );

        await widgetTester.tap(find.text('5264.40 '));
        await widgetTester.pumpAndSettle();

        final TextField textField =
            find.byType(TextField).evaluate().first.widget as TextField;

        expect(textField.controller!.text, '5264.40');
        expect(find.text('0.12300000 '), findsOneWidget);
      },
    );

    testWidgets(
      'should render the exchanged amount in BTC in UI when user inputs amount in USD from the keypad after it is switched.',
      (WidgetTester widgetTester) async {
        final CurrencyDetail mockPrimaryCurrency = CurrencyDetail(0, 'BTC');

        await widgetTester.pumpWidget(
          TestWidget(
            NumberPad.withCurrencyExchanger(
              primaryCurrency: mockPrimaryCurrency,
              exchangeRatesStream: mockExchangeStream,
              initialExchangeRate: mockExchangeRate,
              title: 'Amount',
              label: NumberPadLabel(
                actionOK: 'OK',
              ),
            ),
          ),
        );

        // switch to USD amount.
        await widgetTester.tap(find.text('USD'));
        await widgetTester.pumpAndSettle();

        // Inputted 1 from the keypad
        await widgetTester.tap(find.text('1'));
        await widgetTester.pumpAndSettle();

        // Inputted 8 from the keypad
        await widgetTester.tap(find.text('8'));
        await widgetTester.pumpAndSettle();

        // Inputted 0 from the keypad
        await widgetTester.tap(find.text('0'));
        await widgetTester.pumpAndSettle();

        // Inputted 0 from the keypad
        await widgetTester.tap(find.text('0'));
        await widgetTester.pumpAndSettle();

        expect(find.text('0.04205607 '), findsOneWidget);
      },
    );
  });
}

class TestWidget extends StatelessWidget {
  const TestWidget(this.numberInput, {Key? key}) : super(key: key);

  final NumberPad numberInput;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          bottomSheet: numberInput,
        ),
      );
}
