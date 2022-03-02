import 'package:deriv_ui/core/widgets/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/util/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'core/enums.dart';
import 'core/helpers/number_helper.dart';
import 'core/widgets/date_range_picker/models/date_range_model.dart';
import 'core/widgets/number_pad/model/number_pad_data.dart';
import 'core/widgets/number_pad/number_pad.dart';
import 'core/widgets/shimmer/shimmer.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var selectedDate = '';
  final GlobalKey _key = GlobalKey();
  final ValueNotifier<double> _height = ValueNotifier<double>(-1);
  final countries = ['india', 'USA', 'China', 'Ukrain'];

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   final RenderBox box =
    //   _key.currentContext?.findRenderObject()! as RenderBox;
    //   final Offset position = box.localToGlobal(Offset.zero);
    //
    //   _height.value = 2  - position.dy - 8;
    //   // _height.value = 100;
    // });
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NumberPad(
                    currency: "R",
                    formatter: NumberFormat(
                      '0.'.padRight(
                        2 + getCurrencyFractionalDigits(11),
                        '0',
                      ),
                    ),
                    numberPadType: NumberPadWidgetType.singleInput,
                    firstInputTitle: 'context.localization.labelTradeAmount',
                    // firstInputInitialValue: selectedStakeValue,
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
                Shimmer(
                  baseColor:LightThemeColors.base07,
                  highlightColor: LightThemeColors.base06,
                  child: Align(
                    child: Container(
                      width: 24,
                      decoration: BoxDecoration(
                        color: LightThemeColors.base07,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
                // Expanded(
                //   child: ExpandableBottomSheet(
                //     title: 'context.localization.labelChooseCountry',
                //     upperContent: ValueListenableBuilder<double>(
                //       valueListenable: _height,
                //       builder: (BuildContext context, double height, _) =>
                //           SizedBox(
                //             height: height == -1
                //                 ? MediaQuery.of(context).size.height
                //                 : height,
                //             child: ListView.builder(
                //               key: _key,
                //               itemCount: countries.length,
                //               itemBuilder: (BuildContext context, int index) =>
                //                   ListTile(
                //                     title: Padding(
                //                       padding: const EdgeInsets.all(12),
                //                       child: Text(
                //                         countries[index]!,
                //                       ),
                //                     ),
                //                     onTap: () {
                //                       //  widget.onChanged.call(index);
                //                       print('Country name: ${countries[index]}');
                //                    //   Navigator.of(context).pop(index);
                //                     },
                //                   ),
                //             ),
                //           ),
                //     ),
                //   ),
                // )
              ],
            ),
          ));
}
