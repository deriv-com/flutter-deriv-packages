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

  @override
  void initState() {
    super.initState();
    subscription = DerivLiveChat.onMessageRecieved?.listen((event) {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    Widget _chatButton() => Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextButton(
                onPressed: () async {
                  await DerivLiveChat.startChatView(
                      '13694064', // Licence ID
                      '', // group id in any
                      'Demo User', //
                      'DemoUser@gmail.com',
                      <String, String>{
                        //email
                        'userName': 'Demo', //optional name
                        'role': 'User' //optional role
                      });
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
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
          child: _chatButton(),
        ),
      ),
    );
  }
}
