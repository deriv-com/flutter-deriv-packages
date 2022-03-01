import 'dart:async';
import 'package:deriv_live_chat/deriv_live_chat.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  StreamSubscription? subscription;
  int _counter = 1;

  @override
  void initState() {
    super.initState();
    subscription = DerivLiveChat.onMessageRecieved?.listen((event) {
      _setCounter(++_counter);
    });
  }

  void _setCounter(int counter) {
    setState(() {
      _counter = counter;
    });
  }

  Future<void> openChatView() async {
    await DerivLiveChat.startChatView(
        '13694064', // Licence ID
        '', // group id in any
        'Demo User', //
        'DemoUser@gmail.com',
        <String, String>{
          //email
          'Appid': 'Demo', //optional name
          'udid': 'User' //optional role
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget _chatButton() => Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextButton(
                onPressed: () {
                  openChatView();
                },
                child: const Text(
                  'Open Chat',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFFFFFF),
                  ),
                )),
          ),
        );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Deriv Live Chat'),
          actions: <Widget>[
            Stack(children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  _setCounter(1);
                  openChatView();
                },
              ),
              _counter > 1
                  ? const Positioned(
                      // draw a red marble
                      top: 10,
                      right: 14,
                      child: Icon(Icons.brightness_1,
                          size: 8.0, color: Colors.redAccent),
                    )
                  : Container()
            ]),
          ],
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 36, 0, 0),
          child: _chatButton(),
        )),
      ),
    );
  }
}
