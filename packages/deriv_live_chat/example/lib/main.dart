import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:deriv_live_chat/deriv_live_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deriv Live Chat',
      home: Support(),
    );
  }
}

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final licenseNoTextController = TextEditingController();
  final groupIdTextController = TextEditingController();
  final visitorNameTextController = TextEditingController();
  final visitorEmailTextController = TextEditingController();
  final organizationTextController = TextEditingController();
  final positionTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            title: "Start Live Chat",
            onPress: () {
              DerivLiveChat.beginChat(
                  "13694064", //License Number
                  "dZp3EAfnR", //group id
                  "Demo User name", // user name
                  "demo@gmail.com", //user email
                  <String, String>{
                    //optional parameter
                    'Appid': "Deriv Go user app id",
                    'UDID': "1234567890",
                  });
            }),
      ),
    );
  }
}

/// Custom button
class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPress;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextButton(
          onPressed: () {
            onPress();
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFFFFFFF),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
