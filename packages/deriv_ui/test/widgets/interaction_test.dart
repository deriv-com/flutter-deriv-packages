import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getOpacity', () {
    test('returns correct opacity for enabled state', () {
      expect(getOpacity(isEnabled: true), 1.0);
    });

    test('returns correct opacity for disabled state', () {
      expect(getOpacity(isEnabled: false), 0.32);
    });
  });

  group('Interaction', () {
    testWidgets('disables interaction when isEnabled is false',
        (WidgetTester tester) async {
      bool isOnPressedCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Interaction(
            child: TextButton(
              onPressed: () {
                isOnPressedCalled = true;
              },
              child: const Text('Button'),
            ),
            isEnabled: false,
          ),
        ),
      );

      final Finder textButton = find.byType(TextButton);

      await tester.tap(textButton, warnIfMissed: false);

      expect(isOnPressedCalled, false);
    });

    testWidgets('enables interaction when isEnabled is true',
        (WidgetTester tester) async {
      bool isOnPressedCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Interaction(
            child: TextButton(
              onPressed: () {
                isOnPressedCalled = true;
              },
              child: const Text('Button'),
            ),
            isEnabled: true,
          ),
        ),
      );

      final Finder textButton = find.byType(TextButton);

      await tester.tap(textButton);

      expect(isOnPressedCalled, true);
    });


    testWidgets('opacity value matches getOpacity return value when isEnabled is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Interaction(
            child: TextButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
            isEnabled: true,
          ),
        ),
      );

      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, getOpacity(isEnabled: true));
    });

    testWidgets('opacity value matches getOpacity return value when isEnabled is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Interaction(
            child: TextButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
            isEnabled: false,
          ),
        ),
      );

      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, getOpacity(isEnabled: false));
    });
  });
}
