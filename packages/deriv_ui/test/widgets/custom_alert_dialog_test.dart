import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomAlertDialog', () {
    testWidgets('renders correctly with title and content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAlertDialog(
              title: Text('Title'),
              content: Text('Content'),
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('renders correctly without title and content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAlertDialog(),
          ),
        ),
      );

      expect(find.byType(Text), findsNothing);
    });

    testWidgets(
        'calls onNegativeActionPressed when negative action button is pressed',
        (WidgetTester tester) async {
      bool negativeActionPressedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomAlertDialog(
              negativeActionLabel: 'Cancel',
              onNegativeActionPressed: () => negativeActionPressedCalled = true,
            ),
          ),
        ),
      );

      final Finder cancelButton = find.widgetWithText(TextButton, 'Cancel');

      expect(cancelButton, findsOneWidget);

      await tester.tap(cancelButton);

      expect(negativeActionPressedCalled, isTrue);
    });

    testWidgets(
        'calls onPositiveActionPressed when positive action button is pressed',
        (WidgetTester tester) async {
      bool positiveActionPressedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomAlertDialog(
              positiveActionLabel: 'Confirm',
              onPositiveActionPressed: () => positiveActionPressedCalled = true,
            ),
          ),
        ),
      );

      final Finder confirmButton = find.widgetWithText(TextButton, 'Confirm');

      expect(confirmButton, findsOneWidget);

      await tester.tap(confirmButton);

      expect(positiveActionPressedCalled, isTrue);
    });
  });
}
