import 'package:deriv_ui/core/widgets/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/util/strings_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Calendar Date Range Picker =>', () {
    testWidgets(
        'date range picker should show start and end label if initial start date and initial end date is not set.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpWidget(_TestApp(DateRangePicker(
        currentDate: currentTime,
        minAllowedDate: DateTime(currentTime.year - 1, 11, 20),
        maxAllowedDate: DateTime(currentTime.year + 1, 11, 25),
      )));
      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DateRangePicker), findsOneWidget);

      expect(find.text(labelSelectedRange), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is RichText &&
              widget.text.toPlainText() == '$labelStartDate - $labelEndDate',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'date range picker should show start and end date if initial start date and initial end date is set in same year.',
        (WidgetTester tester) async {
      final DateTime currentTime = DateTime.now();

      await tester.pumpWidget(_TestApp(
        DateRangePicker(
          currentDate: currentTime,
          minAllowedDate: DateTime(currentTime.year - 1, 11),
          maxAllowedDate: DateTime(currentTime.year, 11, 25),
          initialStartDate: DateTime(currentTime.year, 11, 10),
          initialEndDate: DateTime(currentTime.year, 11, 19),
        ),
      ));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(IconButton), findsNWidgets(3));
      expect(find.byType(DateRangePicker), findsOneWidget);

      expect(find.text(labelSelectedRange), findsOneWidget);

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

        await tester.pumpWidget(
          _TestApp( DateRangePicker(
                currentDate: currentTime,
                minAllowedDate: DateTime(currentTime.year - 1, 11),
                maxAllowedDate: DateTime(currentTime.year, 11, 25),
                initialStartDate: DateTime(currentTime.year - 1, 11, 10),
                initialEndDate: DateTime(currentTime.year, 11, 19),
              ),
          )
        );

        await tester.idle();
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byType(DateRangePicker), findsOneWidget);

        expect(find.text(labelSelectedRange), findsOneWidget);

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

        await tester.pumpWidget(
          _TestApp(DateRangePicker(
                currentDate: currentTime,
                minAllowedDate: DateTime(currentTime.year - 1, 11),
                maxAllowedDate: DateTime(currentTime.year, 11, 25),
                initialStartDate: DateTime(currentTime.year - 1, 11, 10),
              ),
            ),

        );

        await tester.idle();
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byType(DateRangePicker), findsOneWidget);

        expect(find.text(labelSelectedRange), findsOneWidget);

        expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() ==
                    'Nov 10, ${currentTime.year - 1} - $labelEndDate',
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'date range picker should show start if initial start date is set and initial end date is not set. also, year is equal to current date year.',
          (WidgetTester tester) async {
        final DateTime currentTime = DateTime.now();

        await tester.pumpWidget(
          _TestApp( DateRangePicker(
                currentDate: currentTime,
                minAllowedDate: DateTime(currentTime.year - 1, 11),
                maxAllowedDate: DateTime(currentTime.year + 1, 11, 25),
                initialStartDate: DateTime(currentTime.year, 11, 10),
              ),
            ),

        );

        await tester.idle();
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byType(DateRangePicker), findsOneWidget);

        expect(find.text(labelSelectedRange), findsOneWidget);

        expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() ==
                    'Nov 10 - $labelEndDate',
          ),
          findsOneWidget,
        );
      });
    //
      testWidgets(
          'date range picker should show end if initial end date is set and initial start date is not set. also, year is not equal to current date year.',
          (WidgetTester tester) async {
        final DateTime currentTime = DateTime.now();

        await tester.pumpWidget(
         _TestApp( DateRangePicker(
                currentDate: currentTime,
                minAllowedDate: DateTime(currentTime.year - 1, 11),
                maxAllowedDate: DateTime(currentTime.year, 11, 25),
                initialEndDate: DateTime(currentTime.year - 1, 11, 10),
              ),
            ),

        );

        await tester.idle();
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byType(DateRangePicker), findsOneWidget);

        expect(find.text(labelSelectedRange), findsOneWidget);

        expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() ==
                    '$labelStartDate - Nov 10, ${currentTime.year - 1}',
          ),
          findsOneWidget,
        );
      });

      testWidgets(
          'date range picker should show end if initial end date is set and initial start date is not set. also, year is equal to current date year.',
          (WidgetTester tester) async {
        final DateTime currentTime = DateTime.now();

        await tester.pumpWidget(
          _TestApp( DateRangePicker(
                currentDate: currentTime,
                minAllowedDate: DateTime(currentTime.year - 1, 11),
                maxAllowedDate: DateTime(currentTime.year, 11, 25),
                initialEndDate: DateTime(currentTime.year, 11, 10),
              ),
            ),

        );

        await tester.idle();
        await tester.pumpAndSettle();

        expect(find.byType(IconButton), findsNWidgets(3));
        expect(find.byType(DateRangePicker), findsOneWidget);

        expect(find.text(labelSelectedRange), findsOneWidget);

        expect(
          find.byWidgetPredicate(
            (Widget widget) =>
                widget is RichText &&
                widget.text.toPlainText() ==
                    '$labelStartDate - Nov 10',
          ),
          findsOneWidget,
        );
      });
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp(this.dateRangePicker);

  final DateRangePicker dateRangePicker;

  @override
  Widget build(BuildContext context) => MaterialApp(

        home: dateRangePicker,
      );
}
