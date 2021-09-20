import 'package:flutter/material.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

void main() => runApp(MyApp());

/// App class.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('App Token Example App'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                const Spacer(),
                Text(
                  'Production App Token\n$productionAppToken',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Text(
                  'Development App Token\n$developmentAppToken',
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );
}
