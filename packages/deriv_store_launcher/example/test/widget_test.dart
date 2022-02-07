import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_store_launcher_example/main.dart';

void main() {
  testWidgets('Verify Platform version', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    final bool isAndroid = Platform.isAndroid;

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text &&
            widget.data! ==
                '${isAndroid ? 'Open Play Store' : 'Open App Store'}',
      ),
      findsOneWidget,
    );
  });
}
