import 'package:deriv_ui/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomCheckbox', () {
    testWidgets('renders correctly with message and unchecked state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomCheckbox(
              message: 'Message',
            ),
          ),
        ),
      );

      expect(find.text('Message'), findsOneWidget);

      final Checkbox checkbox = tester.widget<Checkbox>(find.byType(Checkbox));

      expect(checkbox.value, false);
    });

    testWidgets('calls onValueChanged when checkbox value changes',
        (WidgetTester tester) async {
      bool onValueChangedCalled = false;
      bool? checkboxValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomCheckbox(
              message: 'Message',
              onValueChanged: ({bool? isChecked}) {
                onValueChangedCalled = true;
                checkboxValue = isChecked;
              },
            ),
          ),
        ),
      );

      final Finder checkbox = find.byType(Checkbox);

      expect((tester.widget(checkbox) as Checkbox).value, false);

      await tester.tap(checkbox);

      expect(onValueChangedCalled, isTrue);
      expect(checkboxValue, true);
    });
  });
}
