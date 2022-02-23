import 'package:deriv_live_chat/deriv_live_chat.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _chatButton() => Container(
      decoration: BoxDecoration(
        color: Colors.blue[500],
        borderRadius: BorderRadius.circular(4),
      ),
      child:  TextButton(
          onPressed: () {
            DerivLiveChat.startChatView(
                '13724181',
                '',
                'Sneha',
                '', <String, String>{
                'userName': 'sneha-solutelabs',
                'role': 'Flutter developer'
            });
          },
          child: const Text(
            'start chat',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFFFFFF),
            ),
          )
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('LiveChat')),
        body: Column(
          children: [
            Center(
                child: _chatButton()
            ),
          ],
        ),
      ),
    );
  }
}
