import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('showAlertDialog displays the dialog with correct properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
          builder: (BuildContext context) => ElevatedButton(
                onPressed: () async {
                  await showAlertDialog(
                    context: context,
                    title: 'Alert',
                    content: const Text('Sample content'),
                    positiveActionLabel: 'Retry',
                    negativeButtonLabel: 'Cancel',
                    onPositiveActionPressed: () {},
                    onNegativeActionPressed: () {},
                  );
                },
                child: const Text('Show Dialog'),
              )),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Sample content'), findsOneWidget);
    expect(find.text('Retry'.toUpperCase()), findsOneWidget);
    expect(find.text('Cancel'.toUpperCase()), findsOneWidget);
  });

  testWidgets(
      'showAlertDialogWithCheckbox displays the dialog with correct properties',
      (WidgetTester tester) async {
    bool isCheckedLocal = false;
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () async {
            await showAlertDialogWithCheckbox(
              context: context,
              title: 'Alert',
              content: const Text('Sample content'),
              positiveActionLabel: 'Retry',
              negativeButtonLabel: 'Cancel',
              checkBoxValue: isCheckedLocal,
              checkboxMessage: 'Checkbox Message',
              onCheckboxValueChanged: ({bool? isChecked}) {
                isCheckedLocal = isChecked ?? false;
              },
              onPositiveActionPressed: () {},
              onNegativeActionPressed: () {},
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Alert'), findsOneWidget);
    expect(find.text('Sample content'), findsOneWidget);
    expect(find.text('Retry'.toUpperCase()), findsOneWidget);
    expect(find.text('Cancel'.toUpperCase()), findsOneWidget);
    expect(find.text('Checkbox Message'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets(
      'showSimpleLoadingDialog shows a loading indicator with correct title and message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () async {
            await showSimpleLoadingDialog(
              context,
              title: 'Loading',
              bodyMessage: 'Please wait...',
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pump(const Duration(seconds: 5));

    expect(find.text('Loading'), findsOneWidget);
    expect(find.text('Please wait...'), findsOneWidget);
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets(
      'showErrorDialog shows an error dialog with correct message and action',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () async {
            await showErrorDialog(
              context: context,
              errorMessage: 'An error occurred',
              actionLabel: 'Try Again',
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('An error occurred'), findsOneWidget);
    expect(find.text('Try Again'.toUpperCase()), findsOneWidget);
  });

  testWidgets('showTokenExpiredDialog', (WidgetTester tester) async {
    bool isOnPositiveActionPressed = false;

    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (BuildContext context) => ElevatedButton(
          onPressed: () async {
            await showTokenExpiredDialog(
                context: context,
                title: 'Title',
                content: 'Content',
                positiveActionLabel: 'Positive Action Label',
                onPositiveActionPressed: () {
                  isOnPositiveActionPressed = true;
                });
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ));

    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Positive Action Label'.toUpperCase()), findsOneWidget);

    await tester.tap(find.text('Positive Action Label'.toUpperCase()));

    expect(isOnPositiveActionPressed, true);

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Content'), findsOneWidget);
  });
}
