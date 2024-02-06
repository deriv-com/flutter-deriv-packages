import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MaterialColor coralColor = Colors.red;

  group('LoadingIndicator', () {
    testWidgets('Displays CircularProgressIndicator when isCircular is true', 
      (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: LoadingIndicator(
              
            ),
          ),
          theme: ThemeData(
            hintColor: coralColor,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Displays LinearProgressIndicator when isCircular is false', 
      (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: LoadingIndicator(
              isCircular: false,
            ),
          ),
          theme: ThemeData(
            hintColor: coralColor,
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('CircularProgressIndicator has the correct colors and strokeWidth', 
      (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: LoadingIndicator(
              valueColor: Colors.green,
              backgroundColor: Colors.blue,
              strokeWidth: 6,
            ),
          ),
          theme: ThemeData(
            // If you have a custom theme, define it here
            hintColor: coralColor,
          ),
        ),
      );

      final CircularProgressIndicator circularIndicator = 
        tester.widget<CircularProgressIndicator>(find.byType(CircularProgressIndicator));

      expect(circularIndicator.backgroundColor, Colors.blue);
      expect(circularIndicator.valueColor?.value, Colors.green);
      expect(circularIndicator.strokeWidth, 6);
    });

    testWidgets('LinearProgressIndicator has the correct colors', 
      (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Scaffold(
            body: LoadingIndicator(
              valueColor: Colors.green,
              backgroundColor: Colors.blue,
              isCircular: false,
            ),
          ),
          theme: ThemeData(
            // If you have a custom theme, define it here
            hintColor: coralColor,
          ),
        ),
      );

      final LinearProgressIndicator linearIndicator = 
        tester.widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator));

      expect(linearIndicator.backgroundColor, Colors.blue);
      expect(linearIndicator.valueColor?.value, Colors.green);
    });
  });
}
