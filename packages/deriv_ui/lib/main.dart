import 'package:deriv_ui/core/widgets/date_range_picker/date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'core/enums.dart';
import 'core/helpers/number_helper.dart';
import 'core/widgets/date_range_picker/models/date_range_model.dart';
import 'core/widgets/number_pad/model/number_pad_data.dart';
import 'core/widgets/number_pad/number_pad.dart';
import 'core/widgets/web_view_page/web_view_page.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: <String, WidgetBuilder>{
          '/web': (BuildContext context) => const Web(),
          '/home': (BuildContext context) => const HomePage()
        },
        navigatorKey: _navigator,
        initialRoute: '/home',
      );
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
  final List<String> countries = <String>['india', 'USA', 'China', 'Ukrain'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Example App')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                        '${selectedDateRange?.startDate} - '
                            '${selectedDateRange?.endDate}';
                    setState(() {});
                  }
                },
                child: const Text('Click Date Picker'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: NumberPad(
                  currency: 'R',
                  formatter: NumberFormat(
                    '0.'.padRight(
                      2 + getCurrencyFractionalDigits(11),
                      '0',
                    ),
                  ),
                  numberPadType: NumberPadWidgetType.singleInput,
                  firstInputTitle: 'context.localization.labelTradeAmount',
                  onClose: (
                    NumberPadWidgetType type,
                    NumberPadCloseType closeType,
                    NumberPadData result,
                  ) async {
                    if (closeType == NumberPadCloseType.pressOK &&
                        result.firstInputValue != null) {
                      //  onChange?.call(result.firstInputValue!);
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<BuildContext>(
                        builder: (BuildContext context) => const Web()),
                  );
                },
                child: const Text('Open web'),
              )
            ],
          ),
        ),
      );
}

/// Show web page
class Web extends StatelessWidget {
  /// initialize constructor
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const WebViewPage(
        appId: '1',
        title: 'webpage',
        heightProgressBar: 20,
        valueColorProgressBar: Colors.pink,
        url: 'https://www.google.com',
      );
}
