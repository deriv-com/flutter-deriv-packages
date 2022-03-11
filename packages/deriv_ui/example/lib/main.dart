import 'package:deriv_ui/core/widgets/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/core/widgets/date_range_picker/models/date_range_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomePage());

}

/// Home Page
class HomePage extends StatefulWidget {
  /// Initialize constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDate = '';

  Future<void> showDatePicker() async {
    final DateRangeModel? selectedDateRange = await showDialog<DateRangeModel>(
        context: context,
        builder: (_) => DateRangePicker(
          currentDate: DateTime.now(),
          minAllowedDate: DateTime(1999),
          maxAllowedDate: DateTime.now(),
        ));
    if (selectedDateRange?.startDate != null ||
        selectedDateRange?.endDate != null) {

      setState(() {
        selectedDate =
        '${selectedDateRange?.startDate} - '
            '${selectedDateRange?.endDate}';
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Example App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('Select Date: $selectedDate')),
          ElevatedButton(
            onPressed: ()  {
              showDatePicker();
            },
            child: const Text('Click Date Picker'),
          ),
        ],
      ),
    );
}
