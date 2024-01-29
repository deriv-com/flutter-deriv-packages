import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InfoIconButton', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoIconButton(
              iconSize: 24,
              dialogTitle: 'Dialog Title',
              dialogDescription: 'Dialog Description',
              positiveActionLabel: 'OK',
            ),
          ),
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows dialog when tapped', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InfoIconButton(
              dialogTitle: 'Dialog Title',
              dialogDescription: 'Dialog Description',
              positiveActionLabel: 'OK',
            ),
          ),
        ),
      );

      final Finder infoIconButtonFinder = find.byType(IconButton);
      final Finder dialogTitleFinder = find.text('Dialog Title');
      final Finder dialogDescriptionFinder = find.text('Dialog Description');
      final Finder positiveActionButtonFinder =
          find.widgetWithText(TextButton, 'OK');

      expect(infoIconButtonFinder, findsOneWidget);

      await tester.tap(infoIconButtonFinder);
      await tester.pumpAndSettle();

      expect(dialogTitleFinder, findsOneWidget);
      expect(dialogDescriptionFinder, findsOneWidget);
      expect(positiveActionButtonFinder, findsOneWidget);
    });
  });
}
