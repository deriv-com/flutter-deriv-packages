import 'package:deriv_passkeys/deriv_passkeys_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlutterPasskeyPlatform] that uses method channels.
class MethodChannelDerivPasskeys extends DerivPasskeysPlatform {
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
  Future<String?> createCredential(String options) async {
    final response = await methodChannel
        .invokeMethod<String>('createCredential', {'options': options});
    return response;
  }

  @override
  Future<String?> getCredential(String options) async {
    final response = await methodChannel
        .invokeMethod<String>('getCredential', {'options': options});
    return response;
  }
}
