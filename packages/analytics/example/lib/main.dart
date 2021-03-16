import 'package:flutter/material.dart';
import 'package:analytics/analytics.dart';

void main() {
  runApp(MyApp());
}

/// Sample main widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Analytics().init();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Analytics example app'),
          ),
          body: Builder(
            builder: (BuildContext context) => GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(16),
              children: _eventsList(context),
            ),
          ),
        ),
      );

  List<Widget> _eventsList(BuildContext context) => <Widget>[
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Center(
                child: Text(
              'Identify',
              style: TextStyle(fontSize: 18),
            )),
            color: Colors.teal[100],
          ),
          onTap: () async {
            await Analytics().logLoginEvent(
                deviceToken: 'xxx-xxxx-xxxx-xxxxx-xxxx-test', userId: 998);
            _showSnackBar(context, true);
          },
        ),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Center(
                  child: Text(
                'Track',
                style: TextStyle(fontSize: 18),
              )),
              color: Colors.blue[100],
            ),
            onTap: () async {
              Analytics().logAppOpened();
              _showSnackBar(context, true);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Center(
                  child: Text(
                'Screen',
                style: TextStyle(fontSize: 18),
              )),
              color: Colors.orange[100],
            ),
            onTap: () async {
              Analytics().setCurrentScreen(
                  screenName: 'main',
                  properties: <String, dynamic>{
                    'entry1': 'test1',
                    'entry2': 'test2'
                  });
              _showSnackBar(context, true);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Center(
                  child: Text(
                'reset',
                style: TextStyle(fontSize: 18),
              )),
              color: Colors.deepOrange[100],
            ),
            onTap: () async {
              await Analytics().reset();
              _showSnackBar(context, true);
            }),
      ];

  void _showSnackBar(BuildContext context, bool success) {
    final SnackBar snackBar =
        SnackBar(content: Text(success ? 'Success' : 'Failure'));

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
