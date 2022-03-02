import 'package:deriv_ui/core/widgets/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/core/widgets/date_range_picker/models/date_range_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String selectedDate = '';
  final GlobalKey _key = GlobalKey();
  final ValueNotifier<double> _height = ValueNotifier<double>(-1);
  final List<String> countries = ['india', 'USA', 'China', 'Ukrain'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final RenderBox box =
          _key.currentContext!.findRenderObject()! as RenderBox;
      final Offset position = box.localToGlobal(Offset.zero);

      _height.value = 2 * box.size.height - position.dy - 0;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
          // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          //   S.delegate,
          // ],
          // supportedLocales: S.delegate.supportedLocales,
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
                    final DateRangeModel? selectedDateRange =
                        await showDialog<DateRangeModel>(
                            context: context,
                            builder: (_) => DateRangePicker(
                                  currentDate: DateTime.now(),
                                  minAllowedDate: DateTime(1999),
                                  maxAllowedDate: DateTime.now(),
                                ));
                    if (selectedDateRange?.startDate != null ||
                        selectedDateRange?.endDate != null) {
                      selectedDate =
                          '${selectedDateRange?.startDate.toString()} - ${selectedDateRange?.endDate.toString()}';
                      setState(() {});
                    }
                  },
                  child: const Text('Click Date Picker'),
                ),

              ],
            ),
          ));
}
