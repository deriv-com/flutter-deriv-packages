import 'package:deriv_live_chat_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data!.startsWith('Running on:'),
      ),
      findsOneWidget,
    );
  });
}
