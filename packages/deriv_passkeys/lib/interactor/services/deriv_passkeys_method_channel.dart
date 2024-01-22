import 'package:deriv_passkeys/interactor/services/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlutterPasskeyPlatform] that uses method channels.
class MethodChannelDerivPasskeys extends BaseDerivPasskeysMethodChannel {
  /// Constructs a [MethodChannelFlutterPasskey] with an optional [MethodChannel];
  MethodChannelDerivPasskeys({MethodChannel? channel})
      : methodChannel = channel ?? const MethodChannel('deriv_passkeys');

  /// The method channel used to interact with the native platform.
  MethodChannel methodChannel;

  @override
  Future<String?> getPlatformVersion() async {
    final String? version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> createCredential(String options) async {
    final String? response = await methodChannel.invokeMethod<String>(
        'createCredential', <String, String>{'options': options});
    return response;
  }

  @override
  Future<String?> getCredential(String options) async {
    final String? response = await methodChannel.invokeMethod<String>(
        'getCredential', <String, String>{'options': options});
    return response;
  }
}
