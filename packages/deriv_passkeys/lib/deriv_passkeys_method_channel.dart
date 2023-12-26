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
  Future<String?> createPasskey() async {
    final passkey = await methodChannel.invokeMethod<String>('createPasskey');
    return passkey;
  }
}
