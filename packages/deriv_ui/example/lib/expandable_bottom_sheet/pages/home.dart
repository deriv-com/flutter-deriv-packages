/// This imports the required packages.
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';

/// This is a home screen widget that displays a button to show the expandable bottom sheet.
class Home extends StatelessWidget {
  /// This is a const constructor that takes a key.
  const Home({Key? key}) : super(key: key);

  /// This function displays the expandable bottom sheet when the button is clicked.
  Future<void> _showExpandableBottomSheet(BuildContext context) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) => SafeArea(
          child: ExpandableBottomSheet(
            labelContractDetails: 'Test Label Contract Details',
            upperContent: Container(
              height: 200,
              child: const Text(
                'Example Upper Content',
                style: TextStyle(fontSize: 24),
              ),
            ),
            lowerContent: Container(
              height: 200,
              child: const Text(
                'Example Lower Content',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Expandable Bottom Sheet Demo'),
        ),
        body: MediaQuery(
          data: const MediaQueryData(),
          child: Center(
            child: ElevatedButton(
              child: const Text('Show Expandable Bottom Sheet'),
              onPressed: () => _showExpandableBottomSheet(context),
            ),
          ),
        ),
      );
}
