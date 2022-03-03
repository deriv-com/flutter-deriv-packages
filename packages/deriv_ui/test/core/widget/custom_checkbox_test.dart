import 'package:deriv_ui/core/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Custom checkbox test', () {
    testWidgets(
      'should show presented message in widget',
      (WidgetTester tester) async {
        const String message = 'test message';

        await tester.pumpWidget(
          const _TestWidget(child: CustomCheckbox(message: message)),
        );

        expect(find.text(message), findsOneWidget);
      },
    );

    testWidgets(
      'should change its value when tapped',
      (WidgetTester tester) async {
        const bool initialValue = true;

        await tester.pumpWidget(
          _TestWidget(
            child: CustomCheckbox(
              message: 'Test',
              value: initialValue,
              onValueChanged: (bool? value) => expect(value, !initialValue),
            ),
          ),
        );

        await tester.tap(
          find.byType(Checkbox),
        );
      },
    );
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: Scaffold(body: child));
}
