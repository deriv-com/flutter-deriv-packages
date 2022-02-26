import 'package:deriv_ui/core/widget/date_range_picker/date_range_picker.dart';
import 'package:deriv_ui/generated/l10n.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

/// This Widget is the main application widget.
class App extends StatelessWidget {
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
            body:  Center(
                child: DateRangePicker(
              currentDate: DateTime.now(),
              minAllowedDate: DateTime(1999),
              maxAllowedDate: DateTime.now(),
            )),
          ));
}
