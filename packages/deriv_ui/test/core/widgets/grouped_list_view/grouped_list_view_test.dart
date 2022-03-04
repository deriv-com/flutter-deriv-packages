import 'package:deriv_ui/core/widgets/grouped_list_view/grouped_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'grouped_list_view_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Grouped List View =>', () {
    const int _groupCount = 3;
    const int _itemsCount = 6;

    const String _group01Name = 'Group 01';
    const String _group02Name = 'Group 02';
    const String _group03Name = 'Group 03';

    const String _item01Name = 'Item 01';
    const String _item02Name = 'Item 02';
    const String _item03Name = 'Item 03';
    const String _item04Name = 'Item 04';
    const String _item05Name = 'Item 05';
    const String _item06Name = 'Item 06';

    testWidgets('list should have ${listItems.length * 2} elements.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      expect(
        tester.widget<ListView>(find.byType(ListView).last).semanticChildCount,
        listItems.length * 2,
      );
    });

    testWidgets('list should have $_groupCount groups.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      expect(find.text(_group01Name), findsOneWidget);
      expect(find.text(_group02Name), findsOneWidget);
      expect(find.text(_group03Name), findsOneWidget);
    });

    testWidgets('list should have $_itemsCount items.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_TestApp());

      expect(find.text(_item01Name), findsOneWidget);
      expect(find.text(_item02Name), findsOneWidget);
      expect(find.text(_item03Name), findsOneWidget);
      expect(find.text(_item04Name), findsOneWidget);
      expect(find.text(_item05Name), findsOneWidget);
      expect(find.text(_item06Name), findsOneWidget);
    });

    testWidgets('list should have a sticky header and a group with same name.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: listItems,
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) => Text(value),
            itemBuilder: (dynamic element) => Text(element['name']),
            hasStickyHeader: true,
          ),
        ),
      );

      expect(find.text(_group01Name), findsNWidgets(2));
    });

    testWidgets('list should call onRefresh handler on pull down.',
        (WidgetTester tester) async {
      bool isRefreshed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: listItems,
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) =>
                Container(height: 100, child: Text(value)),
            itemBuilder: (dynamic element) =>
                Container(height: 100, child: Text(element['name'])),
            hasRefreshIndicator: true,
            onRefresh: () async => isRefreshed = true,
          ),
        ),
      );

      await tester.drag(find.byType(Scrollable), const Offset(0, 300));
      await tester.pumpAndSettle(const Duration(milliseconds: 50));

      expect(isRefreshed, isTrue);
    });

    testWidgets(
        'list should show load more indicator if `showLoadMoreIndicator` set to true.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: listItems,
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) => Text(value),
            itemBuilder: (dynamic element) => Text(element['name']),
            hasStickyHeader: true,
            showLoadMoreIndicator: true,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'list should not show load more indicator if `showLoadMoreIndicator` set to false.',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: listItems,
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) => Text(value),
            itemBuilder: (dynamic element) => Text(element['name']),
            hasStickyHeader: true,
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('list should show empty list widget when list is empty.',
        (WidgetTester tester) async {
      const String emptyPageContent = 'Empty Page.';

      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: const <dynamic>[],
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) => Text(value),
            itemBuilder: (dynamic element) => Text(element['name']),
            emptyList: const Text(emptyPageContent),
          ),
        ),
      );

      expect(find.text(emptyPageContent), findsOneWidget);
    });

    testWidgets('list should not show empty list widget when list has item.',
        (WidgetTester tester) async {
      const String emptyPageContent = 'Empty Page.';

      await tester.pumpWidget(
        MaterialApp(
          home: GroupedListView<dynamic, String>(
            items: listItems,
            groupBy: (dynamic element) => element['group'],
            groupBuilder: (String value) => Text(value),
            itemBuilder: (dynamic element) => Text(element['name']),
            emptyList: const Text(emptyPageContent),
          ),
        ),
      );

      expect(find.text(emptyPageContent), findsNothing);
    });
  });
}

class _TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: GroupedListView<dynamic, String>(
          items: listItems,
          groupBy: (dynamic element) => element['group'],
          groupBuilder: (String value) => Text(value),
          itemBuilder: (dynamic element) => Text(element['name']),
        ),
      );
}
