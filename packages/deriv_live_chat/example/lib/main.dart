import 'dart:async';
import 'package:deriv_live_chat/deriv_live_chat.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

/// Deriv Live Chat App.
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Stream Subscription for in app notification event listener.
  late final StreamSubscription? subscription;

  bool _canGoBack = true;
  int _unreadNotificationCounter = 1;

  @override
  void initState() {
    super.initState();

    subscription = DerivLiveChat.onEventReceived?.listen((event) {
      switch (event) {
        case 'chatOpen':
          break;
        case 'chatClose':
          _canGoBack = true;
          break;

        default:
          _setCounter(_unreadNotificationCounter++);
      }
    });
  }

  /// When chat open it close first.
  Future<bool> _onWillPop() async {
    if (!_canGoBack) {
      _canGoBack = true;

      DerivLiveChat.closeChatView();

      return false;
    }
    return true;
  }

  void _setCounter(int counter) =>
      setState(() => _unreadNotificationCounter = counter);

  Future<void> openChatView() async {
    await DerivLiveChat.startChatView(
      licenseNo: '14122101',
      username: 'Demo User',
      email: 'DemoUser@gmail.com',
      groupId: '',
      customParameters: <String, String>{'Appid': 'Demo', 'udid': 'User'},
    );

    _canGoBack = false;
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
              onPressed: openChatView,
              child: const Text(
                'Open Chat',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Deriv Live Chat'),
            actions: <Widget>[
              Stack(children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    _setCounter(1);

                    openChatView();
                  },
                ),
                _unreadNotificationCounter > 1
                    ? const Positioned(
                        // draw a red marble
                        top: 10,
                        right: 14,
                        child: Icon(
                          Icons.brightness_1,
                          size: 8,
                          color: Colors.redAccent,
                        ),
                      )
                    : Container()
              ]),
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 36, 0, 0),
                child: _chatButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    subscription?.cancel();

    super.dispose();
  }
}
