import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'deriv_passkeys_platform_interface.dart';

/// An implementation of [DerivPasskeysPlatform] that uses method channels.
class MethodChannelDerivPasskeys implements DerivPasskeysPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('deriv_passkeys');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> createPasskey(Map<String, dynamic> requestJson) async {
    // call final passkey = await methodChannel.invokeMethod<String>('createPasskey'); with requestJson
    final jsonString = jsonEncode(requestJson);
    final passkey = await methodChannel
        .invokeMethod<String>('createPasskey', {'requestJson': jsonString});
    return passkey;
  }

  @override
  Future<String?> signInWithPasskey(Map<String, dynamic> requestJson) async {
    // call final passkey = await methodChannel.invokeMethod<String>('signInWithPasskey'); with requestJson
    final jsonString = jsonEncode(requestJson);
    final passkey = await methodChannel
        .invokeMethod<String>('signInWithPasskey', {'requestJson': jsonString});
    return passkey;
  }
}
