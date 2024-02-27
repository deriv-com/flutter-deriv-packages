import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Grouped List View',
  type: GroupedListView,
)
Widget groupedListViewUseCase(BuildContext context) =>
    GroupedListView<dynamic, String>(
      items: listItems,
      groupBy: (dynamic element) => element['group'],
      groupBuilder: (String value) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(value),
      ),
      itemBuilder: (dynamic element) => Container(
        padding: const EdgeInsets.all(8),
        child: Text(element['name']),
      ),
      hasStickyHeader: true,
    );

final List<Map<String, String>> listItems = <Map<String, String>>[
  <String, String>{'name': 'Item 02', 'group': 'Group 01'},
  <String, String>{'name': 'Item 03', 'group': 'Group 02'},
  <String, String>{'name': 'Item 04', 'group': 'Group 02'},
  <String, String>{'name': 'Item 05', 'group': 'Group 02'},
  <String, String>{'name': 'Item 06', 'group': 'Group 03'},
  <String, String>{'name': 'Item 07', 'group': 'Group 02'},
  <String, String>{'name': 'Item 08', 'group': 'Group 02'},
  <String, String>{'name': 'Item 09', 'group': 'Group 03'},
  <String, String>{'name': 'Item 10', 'group': 'Group 02'},
  <String, String>{'name': 'Item 11', 'group': 'Group 03'},
  <String, String>{'name': 'Item 12', 'group': 'Group 01'},
  <String, String>{'name': 'Item 13', 'group': 'Group 01'},
  <String, String>{'name': 'Item 14', 'group': 'Group 02'},
  <String, String>{'name': 'Item 15', 'group': 'Group 02'},
  <String, String>{'name': 'Item 16', 'group': 'Group 02'},
  <String, String>{'name': 'Item 17', 'group': 'Group 03'},
  <String, String>{'name': 'Item 18', 'group': 'Group 02'},
  <String, String>{'name': 'Item 19', 'group': 'Group 03'},
  <String, String>{'name': 'Item 20', 'group': 'Group 02'},
  <String, String>{'name': 'Item 21', 'group': 'Group 03'},
  <String, String>{'name': 'Item 22', 'group': 'Group 01'},
  <String, String>{'name': 'Item 23', 'group': 'Group 01'},
  <String, String>{'name': 'Item 24', 'group': 'Group 02'},
];
