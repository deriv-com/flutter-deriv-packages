import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deriv_passkeys/src/presentation/widgets/section_title_and_content.dart';

void main() {
  group('SectionTitleAndContent', () {
    testWidgets('should display the title and content',
        (WidgetTester tester) async {
      const String title = 'Test Title';
      const String content = 'Test Content';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionTitleAndContent(
              title: title,
              texts: <String>[content],
            ),
          ),
        ),
      );

      final Finder titleFinder = find.text(title);
      final Finder contentFinder = find.text(content);

      expect(titleFinder, findsOneWidget);
      expect(contentFinder, findsOneWidget);
    });
  });
}
