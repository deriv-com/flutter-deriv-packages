import 'package:deriv_date_range_picker/deriv_date_range_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        DateRangeLocalizations.delegate,
      ],
      supportedLocales: DateRangeLocalizations.supportedLocales,
      home: DatePickerPage(title: 'Date Picker'),
    );
  }
}

class DatePickerPage extends StatefulWidget {
  final String title;
  const DatePickerPage({super.key, required this.title});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateRangeModel date = DateRangeModel(
      startDate: DateTime(2021, 1, 2), endDate: DateTime(2021, 1, 26));
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
                builder: (_) => DerivDateRangePicker(
                      context: context,
                      currentDate: DateTime.now(),
                      minAllowedDate: DateTime(2021, 1, 1),
                      maxAllowedDate: DateTime(2021, 12, 31),
                      initialStartDate: date.startDate,
                      initialEndDate: date.endDate,
                      mode: DateRangePickerMode.calendar,
                    ));
            setState(() {
              date = dateChosen ?? date;
            });
          },
          child: Text('${date.startDate} - ${date.endDate}'),
        ),
      ),
    );
  }
}
