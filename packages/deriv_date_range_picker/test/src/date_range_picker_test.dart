import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pump_app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DateRangeLocalizations localization;

  setUpAll(() async => localization =
      await DateRangeLocalizations.delegate.load(const Locale('en')));

  group(' Date Range Picker Calendar Mode =>', () {
    testWidgets(
        'should show start and end label if initial start date and initial end date is not set.',
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
        'should show start and end date if initial start date and initial end date is set in same year.',
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
        'should show start and end date if initial start date and initial end date is set in different years.',
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
        'should show start if initial start date is set and initial end date is not set. also, year is not equal to current date year.',
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
        'should show start date if initial start date is set and initial end date is not set. also, year is equal to current date year.',
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
        'should show end date if initial end date is set and initial start date is not set. also, year is not equal to current date year.',
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
        'should show end date if initial end date is set and initial start date is not set. also, year is equal to current date year.',
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

    testWidgets(
        'should show date range picker input mode when edit button pressed from calendar',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                )),
      );

      final Finder editButton = find.widgetWithIcon(IconButton, Icons.edit);

      await tester.tap(editButton);
      await tester.pumpAndSettle();

      expect(find.byType(InputDateRange), findsOneWidget);
    });
  });

  group(' Date Range Picker Input Mode => ', () {
    testWidgets(
        'should open date range picker calendar mode when calendar tapped',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  mode: DateRangePickerMode.input,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                )),
      );

      await tester.pumpAndSettle();

      final Finder calendarIcon =
          find.widgetWithIcon(IconButton, Icons.date_range);

      await tester.tap(calendarIcon);
      await tester.pumpAndSettle();

      expect(find.byType(CalendarDateRange), findsOneWidget);
    });

    testWidgets('should close on cancel button tapped',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  mode: DateRangePickerMode.input,
                  currentDate: currentTime,
                  minAllowedDate: DateTime(currentTime.year - 1, 11),
                  maxAllowedDate: DateTime(currentTime.year, 11, 25),
                )),
      );

      await tester.pumpAndSettle();

      final Finder cancelButton = find.widgetWithText(
        TextButton,
        localization.labelActionCancel,
      );

      await tester.tap(cancelButton);
      await tester.pumpAndSettle();

      expect(find.byType(InputDateRange), findsNothing);
      expect(find.byType(DerivDateRangePicker), findsNothing);
    });

    testWidgets('should show red outline on invalid date',
        (WidgetTester tester) async {
      await tester.pumpApp(
        Builder(
            builder: (BuildContext context) => DerivDateRangePicker(
                  context: context,
                  mode: DateRangePickerMode.input,
                  minAllowedDate: DateTime(2022),
                  maxAllowedDate: DateTime(2023),
                )),
      );

      await tester.pumpAndSettle();

      final Finder startDateInput =
          find.widgetWithText(TextField, localization.labelStartDate);
      final Finder endDateInput =
          find.widgetWithText(TextField, localization.labelEndDate);

      final DateTime _dateLessThanMin = DateTime(2021, 11, 10);
      final DateTime _dateGreaterThanMax = DateTime(2024, 11, 10);

      await tester.enterText(startDateInput, _dateLessThanMin.toString());
      await tester.enterText(endDateInput, _dateGreaterThanMax.toString());
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: startDateInput,
          matching: find.byWidgetPredicate((Widget widget) =>
              widget is InputDecorator &&
              widget.decoration.enabledBorder!.borderSide.color ==
                  const Color(0xFFFF444F)), // deriv error border color
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: endDateInput,
          matching: find.byWidgetPredicate((Widget widget) =>
              widget is InputDecorator &&
              widget.decoration.enabledBorder!.borderSide.color ==
                  const Color(0xFFFF444F)), // deriv error border color
        ),
        findsOneWidget,
      );
    });
  });
}
