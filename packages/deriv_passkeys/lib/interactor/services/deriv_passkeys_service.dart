import 'dart:convert';

import 'package:deriv_passkeys/core/Interactor/base_service_with_repository.dart';
import 'package:deriv_passkeys/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// A wrapper class that contains methods to interact with the native platform for passkey.
class DerivPasskeysService implements BaseServiceWithRepository {
  /// Constructs a [DerivPasskeysService] with [BaseDerivPasskeysRepository].
  DerivPasskeysService(this.repository);

  /// The repository used to get data for Passkeys functionalities.
  @override
  final BaseDerivPasskeysRepository repository;

  /// Returns true if the device supports passkey.
  Future<bool> isSupported() async {
    final bool isSupported = await BaseDerivPasskeysMethodChannel.instance
        .getPlatformVersion()
        .then((String? osVersion) {
      if (osVersion == null) {
        return false;
      }
      final List<String> list = osVersion.split(' ');
      final int version = int.tryParse(list[1].split('.').first) ?? 0;
      switch (list.first) {
        case 'iOS':
          return version >= 15;
        case 'Android':
          return version >= 9;
        default:
          return false;
      }
    });
    return isSupported;
  }

  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((RegExpMatch match) => print(match.group(0)));
  }

  /// Creates a passkey credential.
  Future<String?> createCredential() async {
    try {
      final Map<String, dynamic> publicKeyCredentialUserEntityJson =
          <String, String>{
        'id': _base64UrlEncodeString('yourUserId'),
        'name': 'bassam@deriv.com',
        'displayName': 'User Name'
      };

      final Map<String, dynamic> signupJson = <String, dynamic>{
        'attestation': 'direct',
        'authenticatorSelection': <String, Object>{
          'requireResidentKey': true,
          'residentKey': 'required',
          'userVerification': 'preferred'
        },
        'challenge': 'GVdqW4fq-Svc5SEOo3cIFox8zCnojiRjoP4aC2PiAb0',
        'excludeCredentials': <dynamic>[],
        'extensions': <String, bool>{'credProps': true},
        'pubKeyCredParams': <Map<String, Object>>[
          <String, Object>{'alg': -8, 'type': 'public-key'},
          <String, Object>{'alg': -7, 'type': 'public-key'},
          <String, Object>{'alg': -257, 'type': 'public-key'}
        ],
        'rp': <String, String>{
          // 'id': 'pro-7837426045311437779.frontendapi.corbado.io',
          'id': 'e003-94-201-147-222.ngrok-free.app',
          'name': 'Deriv'
        },
        'timeout': 60000,
        'user': publicKeyCredentialUserEntityJson
      };

      final String options = jsonEncode(signupJson);
      final String? response = await BaseDerivPasskeysMethodChannel.instance
          .createCredential(options);
      printLongString(response!);
      if (response == null) {
        print('null-response');
        throw PlatformException(
            code: 'null-response',
            message: 'Unable to get response from Passkey.');
      }
      return response;
    } catch (e) {
      print(e);
    }
  }

  /// Gets a passkey credential.
  Future<String> getCredential() async {
    final Map<String, dynamic> getOptionsResult =
        (await repository.getOptions()).toJson();
    getOptionsResult['rpId'] = 'e003-94-201-147-222.ngrok-free.app';

    // final Map<String, dynamic> getOptionsResult = {
    //   // 'rpId': 'pro-7837426045311437779.frontendapi.corbado.io',
    //   'rpId': '3508-94-201-147-222.ngrok-free.app',
    //   'challenge': 'zSXgQgC_jis9cBcH0A48f5IJDlERYojhL_Fl5d-lTko',
    //   'timeout': 60000,
    //   'allowCredentials': <Map<String, String>>[],
    //   'userVerification': 'preferred',
    //   'extensions': <String, bool>{'credProps': true}
    // };

    final String options = jsonEncode(getOptionsResult);

    final String? response =
        await BaseDerivPasskeysMethodChannel.instance.getCredential(options);

    if (response == null) {
      throw PlatformException(
          code: 'null-response',
          message: 'Unable to get response from Passkey.');
    }
    return response;
  }
}

String _base64UrlEncodeString(String input) {
  final List<int> bytes = utf8.encode(input);
  final String base64Str = base64Url.encode(bytes);
  return base64Str;
}
