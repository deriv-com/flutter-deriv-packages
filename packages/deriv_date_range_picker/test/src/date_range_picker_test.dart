import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pump_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Calendar Date Range Picker =>', () {
    late DateRangeLocalizations localization;

    setUpAll(() async => localization =
        await DateRangeLocalizations.delegate.load(const Locale('en')));

    testWidgets(
        'date range picker should show start and end label if initial start date and initial end date is not set.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11, 20),
                  maxAllowedDate: DateTime(currentTime.year + 1, 11, 25),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  '${localization.labelStartDate} - ${localization.labelEndDate}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show start and end date if initial start date and initial end date is set in same year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                  initialStartDate: DateTime(currentTime.year, 11, 10),
                  initialEndDate: DateTime(currentTime.year, 11, 19),
                  context: context,
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is RichText &&
            widget.text.toPlainText() ==
                'Nov 10 - Nov 19, ${currentTime.year}'),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show start and end date if initial start date and initial end date is set in different years.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                  initialStartDate: DateTime(currentTime.year - 1, 11, 10),
                  initialEndDate: DateTime(currentTime.year, 11, 19),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  'Nov 10, ${currentTime.year - 1} - Nov 19, ${currentTime.year}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show start if initial start date is set and initial end date is not set. also, year is not equal to current date year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                  initialStartDate: DateTime(currentTime.year - 1, 11, 10),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  'Nov 10, ${currentTime.year - 1} - ${localization.labelEndDate}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show start if initial start date is set and initial end date is not set. also, year is equal to current date year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year + 1, 11, 25),
                  initialStartDate: DateTime(currentTime.year, 11, 10),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  'Nov 10 - ${localization.labelEndDate}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show end if initial end date is set and initial start date is not set. also, year is not equal to current date year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                  initialEndDate: DateTime(currentTime.year - 1, 11, 10),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  '${localization.labelStartDate} - Nov 10, ${currentTime.year - 1}',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show end if initial end date is set and initial start date is not set. also, year is equal to current date year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                  initialEndDate: DateTime(currentTime.year, 11, 10),
                )),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DerivDateRangePicker), findsOneWidget);

      expect(find.text(localization.labelSelectedDateRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() ==
                  '${localization.labelStartDate} - Nov 10',
        ),
        findsOneWidget,
      );
    });
  });
}
