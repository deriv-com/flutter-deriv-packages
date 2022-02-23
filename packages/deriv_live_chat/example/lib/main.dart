import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:deriv_live_chat/deriv_live_chat.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion =
          await DerivLiveChat.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() => _platformVersion = platformVersion);
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
            DerivLiveChat.startChat(
                '13724181',
                '',
                'Sneha',
                'sneha.s@solutelabs.com', <String, String>{
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
