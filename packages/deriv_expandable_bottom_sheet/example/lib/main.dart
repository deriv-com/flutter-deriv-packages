import 'package:example/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example application that shows how to use Expandable Bottom Sheet.
class MyApp extends StatelessWidget {
  /// This is a const constructor that takes a key.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Expandable Bottom Sheet Demo',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          // Needed for bottom sheet, otherwise,
          // sharp edges and different background color will appear at the top of the sheet.
          backgroundColor: Colors.black.withOpacity(0),
        ),
      ),
      home: const Home());
}
