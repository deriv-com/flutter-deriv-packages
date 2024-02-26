import 'package:deriv_passkeys/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlutterPasskeyPlatform] that uses method channels.
class MethodChannelDerivPasskeys extends BaseDerivPasskeysMethodChannel {
  /// Constructs a [MethodChannelFlutterPasskey] with an optional [MethodChannel];
  MethodChannelDerivPasskeys({
    MethodChannel? channel,
  }) : methodChannel = channel ?? const MethodChannel('deriv_passkeys');

  /// The method channel used to interact with the native platform.
  MethodChannel methodChannel;

  @override
  Future<String?> getPlatformVersion() async {
    final String? version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> createCredential(String options) =>
      methodChannel.invokeMethod<String>(
          'createCredential', <String, String>{'options': options});

  @override
  Future<String?> getCredential(String options) =>
      methodChannel.invokeMethod<String>(
          'getCredential', <String, String>{'options': options});
}
