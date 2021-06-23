import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_install_referer/flutter_install_referer.dart';

void main() {
  runApp(MyApp());
}

/// Example of using install referer.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,String> _refererInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String,dynamic> refererInfo;
    try {
      refererInfo = await FlutterInstallReferer.installReferer;
    } on PlatformException {
      refererInfo = <String,String>{};
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _refererInfo = refererInfo;
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_install_referer'),
        ),
        body: Center(
          child: Text('Referer Info: \n$_refererInfo'),
        ),
      ),
    );
}
