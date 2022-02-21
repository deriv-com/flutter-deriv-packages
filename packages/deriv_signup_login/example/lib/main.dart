import 'package:flutter/material.dart';

void main() => runApp(const App());

/// App class.
class App extends StatefulWidget {
  /// Initializes [App].
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Example app')),
          body: const Center(),
        ),
      );
}
