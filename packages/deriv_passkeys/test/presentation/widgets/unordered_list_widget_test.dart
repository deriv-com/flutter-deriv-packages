import 'package:deriv_passkeys/src/presentation/widgets/unordered_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnorderedList', () {
    const List<String> texts = ['Item 1', 'Item 2', 'Item 3'];
    const TextStyle? style = TextStyle(fontSize: 16);

    testWidgets('Renders the correct number of items',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      final listItemFinder = find.byType(_UnorderedListItem);
      expect(listItemFinder, findsNWidgets(texts.length));
    });

    testWidgets('Renders the correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      for (final text in texts) {
        final textFinder = find.text(text);
        expect(textFinder, findsOneWidget);
      }
    });

    testWidgets('Renders the correct bullet points',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnorderedList(texts: texts, style: style),
          ),
        ),
      );

      final bulletPointFinder = find.text('\u2022');
      expect(bulletPointFinder, findsNWidgets(texts.length));
    });
  });
}
