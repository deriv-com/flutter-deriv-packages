import 'package:deriv_expandable_bottom_sheet/deriv_expandable_bottom_sheet.dart';
import 'package:deriv_theme/theme_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// Example application that shows how to use Expandable Bottom Sheet.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      title: 'Expandable Bottom Sheet Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable Bottom Sheet Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show Expandable Bottom Sheet'),
            onPressed: () => _showExpandableBottomSheet(context),
          ),
        ),
      ),
    );
  

  Future<void> _showExpandableBottomSheet(BuildContext context) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) => ExpandableBottomSheet(
          labelContractDetails: 'Test Label Contract Details', 
          themeProvider: const ThemeProvider(Brightness.dark), 
          upperContent: Container(
            height: 200,
            child: const Text(
              'Example Upper Content',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
}
