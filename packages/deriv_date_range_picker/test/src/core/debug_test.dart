import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('debugCheckHasDateRangeLocalizations asserts correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DateRangeLocalizations.delegate,
        ],
        home: Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  minAllowedDate: DateTime(2022),
                  maxAllowedDate: DateTime(2023),
                )),
      ),
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'debugCheckHasDateRangeLocalizations throws error when DateRangeLocalizations is not found',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  minAllowedDate: DateTime(2022),
                  maxAllowedDate: DateTime(2023),
                )),
      ),
    );

    final FlutterError error = tester.takeException() as FlutterError;
    expect(error.message.contains('No DateRangeLocalizations found.'), true);
  });
}
