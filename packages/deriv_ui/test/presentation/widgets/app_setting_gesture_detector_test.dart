import 'package:deriv_ui/presentation/widgets/app_setting_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppSettingGestureDetector ', () {
    testWidgets('calls `onTapNavigation` on 6 taps within 5 seconds',
        (WidgetTester tester) async {
      bool tapped6Times = false;
      const Key testKey = Key('Test');

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: AppSettingGestureDetector(
            child: Container(
              key: testKey,
              width: 1,
              height: 1,
              color: Colors.red, // Not Tappable without color
            ),
            onTapNavigation: () => tapped6Times = true,
          ),
        ),
      ));

      for (final int _ in Iterable<int>.generate(5)) {
        await tester.tap(find.byKey(testKey));
      }
      expect(tapped6Times, isFalse);

      await tester.tap(find.byKey(testKey)); // LastTap
      expect(tapped6Times, isTrue);

      await tester.pump(
        const Duration(seconds: 5),
      ); // Error if we don't pump scheduled time.
    });

    testWidgets('dont call `onTapNavigation` on 6 taps in more than 5 seconds',
        (WidgetTester tester) async {
      bool tapped6Times = false;
      const Key testKey = Key('Test');

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: AppSettingGestureDetector(
            child: Container(
              key: testKey,
              width: 1,
              height: 1,
              color: Colors.red, // Not Tappable without color
            ),
            onTapNavigation: () => tapped6Times = true,
          ),
        ),
      ));

      for (final int _ in Iterable<int>.generate(6)) {
        await tester.tap(find.byKey(testKey));
        await tester
            .pump(const Duration(seconds: 1)); // Simulate delay between taps
      }
      expect(tapped6Times, isFalse);

      await tester.pump(const Duration(seconds: 5));
    });
  });
}
