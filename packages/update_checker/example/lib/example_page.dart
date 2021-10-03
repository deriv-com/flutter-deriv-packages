import 'package:flutter/material.dart';

import './update_bloc_page.dart';
import './update_checker_page.dart';

/// ExamplePage
class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'You can use the '),
                      TextSpan(
                        text: 'update_checker',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' package in two ways, One is to use '),
                      TextSpan(text: ' pure bloc in your code and listen to '),
                      TextSpan(text: ' states and dispatch events to the '),
                      TextSpan(
                        text: 'UpdateBloc',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' or you can simply use the '),
                      TextSpan(
                        text: 'UpdateChecker',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' helper widget and just implement your '),
                      TextSpan(text: ' logic for each callback you need '),
                      TextSpan(text: ' without dealing with bloc itself.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  child: const Text('UpdateBloc'),
                  onPressed: () {
                    Navigator.of(context).push<dynamic>(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => UpdateBlocPage(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('UpdateChecker'),
                  onPressed: () {
                    Navigator.of(context).push<dynamic>(
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => UpdateCheckerPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
