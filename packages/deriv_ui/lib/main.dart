import 'package:deriv_ui/core/widget/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/generated/l10n.dart';
import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';

import 'core/widget/date_range_picker/models/date_range_model.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var selectedDate = '';

  @override
  Widget build(BuildContext context) => MaterialApp(
          localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(title: const Text('Example App')),
            body: Column(

              children: [
                Text('Select Date: $selectedDate'),
                ElevatedButton(
                  onPressed: () async {
                    // final DateRangeModel? selectedDateRange =
                    //     await showDialog<DateRangeModel>(
                    //         context: context,
                    //         builder: (_) =>
                                DateRangePicker(
                                  currentDate: DateTime.now(),
                                  minAllowedDate: DateTime(1999),
                                  maxAllowedDate: DateTime.now(),
                                )
                    //     )
                        ;
                    // if (selectedDateRange?.startDate != null ||
                    //     selectedDateRange?.endDate != null) {
                    //   selectedDate =
                    //       '${selectedDateRange?.startDate.toString()} - ${selectedDateRange?.endDate.toString()}';
                    //   setState(() {});
                    // }
                  },
                  child: const Text('Click Date Picker'),
                ),
              ],
            ),
          )
  
  );


}
