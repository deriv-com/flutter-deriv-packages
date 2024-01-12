import 'dart:convert';

import 'package:deriv_passkeys/deriv_passkeys.dart';
import 'package:deriv_passkeys/presentation/constants/assets.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithPasskeyButton extends StatelessWidget {
  const ContinueWithPasskeyButton({super.key});

  String base64UrlEncodeString(String input) {
    final List<int> bytes = utf8.encode(input);
    final String base64Str = base64Url.encode(bytes);
    return base64Str;
  }

  @override
  Widget build(BuildContext context) => IconButton(
        padding: EdgeInsets.zero,
        iconSize: ThemeProvider.iconSize40,
        icon: SvgPicture.asset(
          Assets.passkeySvgIcon,
          package: 'deriv_passkeys',
        ),
        onPressed: () async {
          final _derivPasskeysPlugin = DerivPasskeys();

          final Map<String, dynamic> publicKeyCredentialUserEntityJson = {
            'id': base64UrlEncodeString('yourUserId'),
            'name': 'bassam+3@deriv.com',
            'displayName': 'User Name'
          };

          final Map<String, dynamic> signupJson = {
            'rp': <String, String>{
              'id': 'pro-7837426045311437779.frontendapi.corbado.io',
              'name': 'Deriv'
            },
            'user': publicKeyCredentialUserEntityJson,
            'challenge':
                'Base64URLStringChallenge', // Replace with actual Base64URL encoded challenge
            'pubKeyCredParams': <Map<String, Object>>[
              <String, Object>{'alg': -7, 'type': 'public-key'}
            ],
            'timeout': 60000,
            'excludeCredentials': [], // Array of credentials to exclude
            'authenticatorSelection': <String, Object>{
              'authenticatorAttachment': 'platform',
              'requireResidentKey': true,
              'residentKey': 'required',
              'userVerification': 'required'
            },
            'attestation': 'none',
            'extensions': {}
          };

          final isPasskeySupported = await _derivPasskeysPlugin.isSupported();

          final String creationOptions = jsonEncode(signupJson);
          await _derivPasskeysPlugin
              .createCredential(creationOptions)
              .then((response) {
            print(response);
            // Send response to the server
          }).catchError((error) {
            print(error);
            // Handle error
          });

          await Future<void>.delayed(const Duration(seconds: 5));

          final Map<String, dynamic> loginJson = {
            'challenge': 'T1xCsnxM2DNL2KdK5CLa6fMhD7OBqho6syzInk_n-Uo',
            'allowCredentials': [],
            'timeout': 1800000,
            'userVerification': 'required',
            'rpId': 'pro-7837426045311437779.frontendapi.corbado.io'
          };

// Obtain creationOptions from the server
          final String getOptions = jsonEncode(loginJson);
          _derivPasskeysPlugin.getCredential(getOptions).then((response) {
            print(response);
            // Send response to the server
          }).catchError((error) {
            print(error);
            // Handle error
          });
        },
      );
}
