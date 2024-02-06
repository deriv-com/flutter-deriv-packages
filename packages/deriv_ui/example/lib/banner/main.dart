import 'package:flutter/material.dart';

void main() => runApp(const App());

/// Sample app that shows how to use the [DerivBanner] widget.
class App extends StatefulWidget {
  /// Initializes a [DerivBanner] widget.
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Plugin example app'),
          ),
        ),
      );
}
