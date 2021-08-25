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
          appBar: AppBar(title: const Text('App token example app')),
          body: Center(child: Text('app token: $getAppToken')),
        ),
      );
}
