import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnorderedList', () {
    const List<String> texts = <String>['Item 1', 'Item 2', 'Item 3'];
    const TextStyle? style = TextStyle(fontSize: 16);

    testWidgets('Renders the correct number of items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      final Finder listItemFinder = find.byType(UnorderedListItem);
      expect(listItemFinder, findsNWidgets(texts.length));
    });

    testWidgets('Renders the correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      for (final String text in texts) {
        final Finder textFinder = find.text(text);
        expect(textFinder, findsOneWidget);
      }
    });

    testWidgets('Renders the correct bullet points',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      final Finder bulletPointFinder = find.text('\u2022');
      expect(bulletPointFinder, findsNWidgets(texts.length));
    });
  });
}
