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
            child: FutureBuilder<String>(
              future: appToken,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'App Token\n${snapshot.data}',
                    textAlign: TextAlign.center,
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      );
}
