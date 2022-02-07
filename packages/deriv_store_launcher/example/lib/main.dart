import 'dart:io';

import 'package:flutter/material.dart';

import 'package:deriv_store_launcher/deriv_store_launcher.dart';

void main() => runApp(const App());

/// This Widget is the main application widget.
class App extends StatefulWidget {
  /// initializes [App].
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final bool isAndroid = Platform.isAndroid;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Store Luncher Example App'),
          ),
          body: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: isAndroid ? Colors.blue : Colors.green,
              ),
              child:
                  Text('${isAndroid ? 'Open Play Store' : 'Open App Store'}'),
              onPressed: () => DerivStoreLauncher.openWithStore(
                isAndroid ? 'com.deriv.dp2p' : '1506901451',
              ),
            ),
          ),
        ),
      );
}
