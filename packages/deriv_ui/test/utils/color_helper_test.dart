import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Color and Opacity Utilities', () {
    testWidgets('getOpacity returns correct opacity based on enable state', (WidgetTester tester) async {
      expect(getOpacity(isEnabled: true), 1.0);
      expect(getOpacity(isEnabled: false), 0.32);
    });

    testWidgets('getTextColorByNumberSign returns correct color based on number sign', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              expect(getTextColorByNumberSign(context: context, value: -1), context.theme.colors.danger);
              expect(getTextColorByNumberSign(context: context, value: 1), context.theme.colors.success);

              return const Placeholder();
            },
          ),
        ),
      );
    });

    testWidgets('getLerpColor returns correctly interpolated color based on enable state', (WidgetTester tester) async {
      const Color enabledColor = Colors.blue;
      
      expect(getLerpColor(enabledColor: enabledColor, isEnabled: true), Color.lerp(Colors.black, enabledColor, getOpacity(isEnabled: true))!);
      expect(getLerpColor(enabledColor: enabledColor, isEnabled: false), Color.lerp(Colors.black, enabledColor, getOpacity(isEnabled: false)));
    });
  });
}
