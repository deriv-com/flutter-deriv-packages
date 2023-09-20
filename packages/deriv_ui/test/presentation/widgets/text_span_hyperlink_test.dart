import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('buildTextSpanHyperlink', () {
    testWidgets('creates a TextSpan with the correct label and style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Builder(
              builder: (BuildContext context) {
                final TextSpan textSpan = buildTextSpanHyperlink(
                  context: context,
                  label: 'Test Label',
                );

                expect(textSpan.text, 'Test Label');
                expect(textSpan.style, context.theme.textStyle(textStyle: TextStyles.body1, color: context.theme.colors.coral));
                expect(textSpan.recognizer, isInstanceOf<TapGestureRecognizer>());
                
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });
  });
}
