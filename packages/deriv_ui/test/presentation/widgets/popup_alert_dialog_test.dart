import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String testTitle;
  late String testContent;
  late String firstActionLabel;
  late String secondActionLabel;

  setUpAll(() {
    testTitle = 'My Test title';
    testContent = 'My Test content';
    firstActionLabel = 'Action 1';
    secondActionLabel = 'Action 2';
  });

  group('Popup alert dialog widget tests =>', () {
    testWidgets('Should show a popup dialog with a title.',
        (WidgetTester tester) async {
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('Should show a popup dialog with a title and content.',
        (WidgetTester tester) async {
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
        content: Text(testContent),
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testContent), findsOneWidget);
    });

    testWidgets(
        'Should show a popup dialog with a title, content, and one action.',
        (WidgetTester tester) async {
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
        content: Text(testContent),
        positiveButtonLabel: firstActionLabel,
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testContent), findsOneWidget);
      expect(find.text(firstActionLabel.toUpperCase()), findsOneWidget);
    });

    testWidgets(
        'Should show a popup dialog with a title, content, and 2 actions.',
        (WidgetTester tester) async {
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
        content: Text(testContent),
        positiveButtonLabel: firstActionLabel,
        negativeButtonLabel: secondActionLabel,
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testContent), findsOneWidget);
      expect(find.text(firstActionLabel.toUpperCase()), findsOneWidget);
      expect(find.text(secondActionLabel.toUpperCase()), findsOneWidget);
    });

    testWidgets('Should notify when positive action is clicked.',
        (WidgetTester tester) async {
      bool isActionClicked = false;
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
        positiveButtonLabel: firstActionLabel,
        onPositiveActionPressed: () => isActionClicked = true,
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(firstActionLabel.toUpperCase()), findsOneWidget);

      await tester.tap(find.text(firstActionLabel.toUpperCase()));
      await tester.pump();

      expect(isActionClicked, isTrue);
    });

    testWidgets('Should notify when negative action is clicked.',
        (WidgetTester tester) async {
      bool isActionClicked = false;
      final PopupAlertDialog popupAlertDialog = PopupAlertDialog(
        title: testTitle,
        negativeButtonLabel: secondActionLabel,
        onNegativeActionPressed: () => isActionClicked = true,
      );

      await tester.pumpWidget(_PopupAlertDialogTest(popupAlertDialog));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(secondActionLabel.toUpperCase()), findsOneWidget);

      await tester.tap(find.text(secondActionLabel.toUpperCase()));
      await tester.pump();

      expect(isActionClicked, isTrue);
    });
  });
}

class _PopupAlertDialogTest extends StatelessWidget {
  const _PopupAlertDialogTest(this.popupAlertDialog);

  final PopupAlertDialog popupAlertDialog;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Material(
          child: Builder(
            builder: (BuildContext context) => Center(
              child: ElevatedButton(
                child: const Text('X'),
                onPressed: () {
                  showDialog<PopupAlertDialog>(
                    context: context,
                    builder: (BuildContext context) => popupAlertDialog,
                  );
                },
              ),
            ),
          ),
        ),
      );
}
