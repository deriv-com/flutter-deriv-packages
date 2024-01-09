import 'package:deriv_passkeys/deriv_passkeys_platform_interface.dart';
import 'package:flutter/services.dart';

class DerivPasskeys {
  Future<bool> isSupported() async {
    final isSupported = await DerivPasskeysPlatform.instance
        .getPlatformVersion()
        .then((osVersion) {
      if (osVersion == null) {
        return false;
      }
      final list = osVersion.split(' ');
      final version = int.tryParse(list[1].split('.').first) ?? 0;
      switch (list.first) {
        case 'iOS':
          return (version >= 15);
        case 'Android':
          return (version >= 9);
        default:
          return false;
      }
    });
    return isSupported;
  }

  Future<String> createCredential(String options) async {
    final response =
        await DerivPasskeysPlatform.instance.createCredential(options);
    if (response == null) {
      throw PlatformException(
          code: "null-response",
          message: "Unable to get response from Passkey.");
    }
    return response;
  }

  Future<String> getCredential(String options) async {
    final response =
        await DerivPasskeysPlatform.instance.getCredential(options);
    if (response == null) {
      throw PlatformException(
          code: "null-response",
          message: "Unable to get response from Passkey.");
    }
    return response;
  }
}
