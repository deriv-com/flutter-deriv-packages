import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppSettingGestureDetector', () {
    testWidgets('correctly counts the taps and triggers navigation function', (WidgetTester tester) async {
      bool onTapNavigationCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppSettingGestureDetector(
          child: const Text('Test Text', style: TextStyle(fontSize: 50),),
          onTapNavigation: (){onTapNavigationCalled = true;},
          ),
          )
        ),
      );

      final Finder gestureDetector = find.byType(GestureDetector);

      

      for (int i = 0; i < maxTapCount + 1; i++) {
        await tester.tap(gestureDetector);
        await tester.pumpAndSettle();
        
      }


      // expect(gestureDetector, findsOneWidget);
      // await tester.ensureVisible(gestureDetector);

        

        await tester.pump(const Duration(seconds: tapIntervalTimeout));

      // Verify that the navigation function was called
      expect(onTapNavigationCalled, true);
    });

    testWidgets('resets the count after _tapIntervalTimeout seconds if _maxTapCount is not reached', (WidgetTester tester) async {
      int navigationCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AppSettingGestureDetector(
              child: const SizedBox.shrink(),
              onTapNavigation: () => navigationCount++,
            ),
          ),
        ),
      );


      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      await tester.pumpAndSettle(const Duration(seconds: tapIntervalTimeout + 1));


      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      await tester.pump(const Duration(seconds: tapIntervalTimeout));


      expect(navigationCount, 0);
    });
  });
}
