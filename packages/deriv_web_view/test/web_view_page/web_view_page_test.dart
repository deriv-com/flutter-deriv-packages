import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_web_view/widgets/web_view_page/web_view_page.dart';

void main() {
  group('Web view page tests =>', () {
    testWidgets('should start the web view from the passed url.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WebViewPage(url: 'https://google.com'),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(WebViewPage), findsOneWidget);
    });

    testWidgets('Should update progress base on web view progress.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WebViewPage(url: 'https://google.com'),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'should not find any progress bar when [showProgressIndicator] is set to false.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WebViewPage(
            url: 'https://google.com',
            showProgressIndicator: false,
          ),
        ),
      );

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsNothing);
    });
  });
}
