import 'package:flutter/material.dart';
import 'package:deriv_ui/deriv_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  final int groupCount = 3;
  final int itemsCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupedListView Example'),
      ),
      body: GroupedListView<dynamic, String>(
        items: listItems,
        groupBy: (dynamic element) => element['group'],
        groupBuilder: (String value) => Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
        itemBuilder: (dynamic element) => Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(element['name']),
        ),
        hasStickyHeader: true,
      ),
    );
  }
}

final List<Map<String, String>> listItems = <Map<String, String>>[
  <String, String>{'name': 'Item 01', 'group': 'Group 01'},
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
  <String, String>{'name': 'Item 25', 'group': 'Group 02'},
  <String, String>{'name': 'Item 26', 'group': 'Group 02'},
  <String, String>{'name': 'Item 27', 'group': 'Group 03'},
  <String, String>{'name': 'Item 28', 'group': 'Group 02'},
  <String, String>{'name': 'Item 29', 'group': 'Group 03'},
  <String, String>{'name': 'Item 30', 'group': 'Group 01'},
  <String, String>{'name': 'Item 31', 'group': 'Group 03'},
  <String, String>{'name': 'Item 32', 'group': 'Group 01'},
  <String, String>{'name': 'Item 33', 'group': 'Group 01'},
  <String, String>{'name': 'Item 34', 'group': 'Group 02'},
  <String, String>{'name': 'Item 35', 'group': 'Group 02'},
  <String, String>{'name': 'Item 36', 'group': 'Group 02'},
  <String, String>{'name': 'Item 37', 'group': 'Group 03'},
  <String, String>{'name': 'Item 38', 'group': 'Group 02'},
];
