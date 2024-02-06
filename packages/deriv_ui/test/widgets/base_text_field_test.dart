import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseTextField', () {
    late TextEditingController controller;

    setUpAll(() {
      controller = TextEditingController();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BaseTextField(
              labelText: 'label',
              controller: controller,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('calls onChanged when input changes',
        (WidgetTester tester) async {
      bool onChangedCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BaseTextField(
              labelText: 'label',
              controller: controller,
              onChanged: (String value) => onChangedCalled = true,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'value');

      expect(onChangedCalled, isTrue);
    });

    testWidgets('shows error message when error occurs',
        (WidgetTester tester) async {
      const String invalidValue = 'invalid';
      const String errorMessage = 'error';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BaseTextField(
              labelText: 'label',
              controller: controller,
              validator: (String? value) =>
                  value == invalidValue ? errorMessage : null,
            ),
          ),
        ),
      );

      final Finder textField = find.byType(TextFormField);

      await tester.enterText(textField, invalidValue);

      await tester.pumpAndSettle();

      expect(find.text(errorMessage), findsOneWidget);
    });

    tearDownAll(() {
      controller.dispose();
    });
  });
}
