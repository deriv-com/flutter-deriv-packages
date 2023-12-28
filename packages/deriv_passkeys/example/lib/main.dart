import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:deriv_passkeys/deriv_passkeys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _derivPasskeysPlugin = DerivPasskeys();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _derivPasskeysPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  String base64UrlEncodeString(String input) {
    var bytes = utf8.encode(input);
    var base64Str = base64Url.encode(bytes);
    return base64Str;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: InkWell(
              onTap: () async {
                Map<String, dynamic> publicKeyCredentialUserEntityJson = {
                  "id": base64UrlEncodeString("yourUserId"),
                  "name": "user@example.com",
                  "displayName": "User Name"
                };

                Map<String, dynamic> json = {
                  "rp": {"id": "pro-7837426045311437779.frontendapi.corbado.io", "name": "Deriv"},
                  "user": publicKeyCredentialUserEntityJson,
                  "challenge":
                  "Base64URLStringChallenge", // Replace with actual Base64URL encoded challenge
                  "pubKeyCredParams": [
                    {"alg": -7, "type": "public-key"}
                  ],
                  "timeout": 60000,
                  "excludeCredentials": [], // Array of credentials to exclude
                  "authenticatorSelection": {},
                  "attestation": "none",
                  "extensions": {}
                };
                final passkey = await _derivPasskeysPlugin.createPasskey(json);
                print(passkey);
              },
              child: const Text('Plugin example app')),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
