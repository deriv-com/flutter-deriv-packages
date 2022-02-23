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
      body: const Center(child: Text('Hello World')),
    ),
  );
}
