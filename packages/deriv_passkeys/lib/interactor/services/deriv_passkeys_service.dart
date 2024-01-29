import 'dart:convert';

import 'package:deriv_passkeys/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/interactor/services/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// A wrapper class that contains methods to interact with the native platform for passkey.
class DerivPasskeysService {
  /// Constructs a [DerivPasskeysService] with [BaseDerivPasskeysRepository].
  DerivPasskeysService(this.repository);

  /// The repository used to get data for Passkeys functionalities.
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
  Future<String> getCredential() async {
    final Map<String, dynamic> getOptionsResult =
        (await repository.getOptions()).toJson();
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
