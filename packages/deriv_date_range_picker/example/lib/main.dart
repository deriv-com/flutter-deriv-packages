import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Deriv Date Range Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateRangeModel? date =
      DateRangeModel(startDate: DateTime.now(), endDate: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            final dateChosen = await showDialog<DateRangeModel>(
                context: context,
                builder: (context) => DerivDateRangePicker(
                      currentDate: DateTime.now(),
                      minAllowedDate: DateTime(2021, 1, 1),
                      maxAllowedDate: DateTime(2021, 12, 31),
                      initialStartDate: DateTime(2021, 1, 1),
                      initialEndDate: DateTime(2021, 1, 28),
                      mode: DateRangPickerMode.calendar,
                    ));
            setState(() {
              date = dateChosen;
            });
          },
          child: Text('${date?.startDate} - ${date?.endDate}'),
        ),
      ),
    );
  }
}
