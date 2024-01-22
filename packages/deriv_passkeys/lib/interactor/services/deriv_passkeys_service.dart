import 'package:deriv_passkeys/interactor/services/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// A wrapper class that contains methods to interact with the native platform for passkey.
class DerivPasskeys {
  /// Returns the default instance of [DerivPasskeys].
  factory DerivPasskeys() => _instance;
  DerivPasskeys._internal();

  static final DerivPasskeys _instance = DerivPasskeys._internal();

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

  /// Creates a passkey credential.
  Future<String> createCredential(String options) async {
    final String? response =
        await BaseDerivPasskeysMethodChannel.instance.createCredential(options);
    if (response == null) {
      throw PlatformException(
          code: 'null-response',
          message: 'Unable to get response from Passkey.');
    }
    return response;
  }

  /// Gets a passkey credential.
  Future<String> getCredential(String options) async {
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
