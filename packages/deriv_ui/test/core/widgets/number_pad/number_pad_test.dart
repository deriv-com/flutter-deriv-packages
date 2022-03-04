import 'package:deriv_ui/core/enums.dart';
import 'package:deriv_ui/core/widgets/number_pad/model/number_pad_data.dart';
import 'package:deriv_ui/core/widgets/number_pad/number_pad.dart';
import 'package:deriv_ui/util/strings_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

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
            firstInputTitle: labelTradeAmount,
            formatter: formatter,
            firstInputMinimumValue: minValue,
            firstInputMaximumValue: maxValue,
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text(labelTradeAmount), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(1));
      expect(find.byType(TextButton), findsNWidgets(13));
      expect(find.text(currency), findsOneWidget);
      expect(
          find.text(warnValueShouldBeInRange(
            labelTradeAmount,
            minValue,
            currency,
            maxValue,
          )),
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
            firstInputTitle: labelTakeProfit,
            secondInputTitle: labelStopLoss,
            formatter: formatter,
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.text(labelTakeProfit), findsOneWidget);
      expect(find.text(labelStopLoss), findsOneWidget);
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
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      final String message = warnValueCantBeLessThan(
          firstTitle, firstMinValue, currency);
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
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      final String message = warnValueCantBeGreaterThan(
        firstTitle,
        firstMaxValue,
        currency,
      );

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
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      await tester.tap(find.text(numberToPress));
      await tester.pump();

      expect(find.text('$numberToPress'), findsNWidgets(2));
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
          ),
        ),
      );

      await tester.idle();
      await tester.pump();

      expect(find.text(actionOK), findsOneWidget);
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
          ),
        ),
      );

      await tester.idle();
      await tester.pump();

      expect(find.text(actionOK), findsOneWidget);
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
}

class TestWidget extends StatelessWidget {
  const TestWidget(this.numberInput);

  final NumberPad numberInput;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          bottomSheet: numberInput,
        ),
      );
}
