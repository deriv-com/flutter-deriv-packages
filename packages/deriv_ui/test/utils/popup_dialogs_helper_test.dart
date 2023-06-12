import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('Alert Dialog Utilities', () {
    testWidgets('showAlertDialog displays alert dialog', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (BuildContext context) {
                showAlertDialog(
                  context: context,
                  title: 'Test Title',
                  content: const Text('Test Content'),
                  positiveActionLabel: 'Ok',
                );

                return const Placeholder();
              },
            ),
          ),
        ));

        await tester.pumpAndSettle();

        expect(find.text('Test Title'), findsOneWidget);
        expect(find.text('Test Content'), findsOneWidget);
        expect(find.text('Ok'), findsOneWidget);
      });
    });

    // Create similar tests for other functions like showAlertDialogWithCheckbox, showSimpleLoadingDialog, showErrorDialog, showTokenExpiredDialog, showAccountDeactivatedDialog
  });
}
