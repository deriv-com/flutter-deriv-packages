import 'dart:convert';

import 'package:flutter/material.dart';
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
  final _derivPasskeysPlugin = DerivPasskeys();

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
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LargeBlueInkWellButton(
              onTap: () async {
                Map<String, dynamic> publicKeyCredentialUserEntityJson = {
                  "id": base64UrlEncodeString("yourUserId"),
                  "name": "bassam+3@deriv.com",
                  "displayName": "User Name"
                };

                Map<String, dynamic> json = {
                  "rp": {"id": "qa163.deriv.dev", "name": "Deriv"},
                  "user": publicKeyCredentialUserEntityJson,
                  "challenge":
                      "Base64URLStringChallenge", // Replace with actual Base64URL encoded challenge
                  "pubKeyCredParams": [
                    {"alg": -7, "type": "public-key"}
                  ],
                  "timeout": 60000,
                  "excludeCredentials": [], // Array of credentials to exclude
                  "authenticatorSelection": {
                    "authenticatorAttachment": "platform",
                    "requireResidentKey": true,
                    "residentKey": "required",
                    "userVerification": "required"
                  },
                  "attestation": "none",
                  "extensions": {}
                };

                final isPasskeySupported =
                    await _derivPasskeysPlugin.isSupported();

                final creationOptions = jsonEncode(json);
                _derivPasskeysPlugin
                    .createCredential(creationOptions)
                    .then((response) {
                  print(response);
                  // Send response to the server
                }).catchError((error) {
                  print(error);
                  // Handle error
                });
              },
              text: 'Create Passkey',
            ),
            SizedBox(height: 16),
            LargeBlueInkWellButton(
              onTap: () async {
                Map<String, dynamic> publicKeyCredentialUserEntityJson = {
                  "id": base64UrlEncodeString("yourUserId"),
                  "name": "bassam+1@deriv.com",
                  "displayName": "User Name"
                };
                Map<String, dynamic> json = {
                  "challenge": "T1xCsnxM2DNL2KdK5CLa6fMhD7OBqho6syzInk_n-Uo",
                  "allowCredentials": [],
                  "timeout": 1800000,
                  "userVerification": "required",
                  "rpId": "qa163.deriv.dev"
                };

                final isPasskeySupported =
                    await _derivPasskeysPlugin.isSupported();

// Obtain creationOptions from the server
                final getOptions = jsonEncode(json);
                _derivPasskeysPlugin.getCredential(getOptions).then((response) {
                  print(response);
                  // Send response to the server
                }).catchError((error) {
                  print(error);
                  // Handle error
                });
              },
              text: 'Sign in with Passkey',
            )
          ],
        ),
      ),
    );
  }
}

// large blue InkWell Button stateless
class LargeBlueInkWellButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const LargeBlueInkWellButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
