import 'dart:convert';

import 'package:deriv_passkeys/src/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';
import 'package:deriv_passkeys/src/domain/platform/base_deriv_passkeys_method_channel.dart';
import 'package:flutter/services.dart';

/// A wrapper class that contains methods to interact with the native platform for passkey.
class DerivPasskeysService {
  /// Constructs a [DerivPasskeysService] with [BaseDerivPasskeysRepository].
  DerivPasskeysService(this.repository);

  /// The repository used to get data for Passkeys functionalities.
  final BaseDerivPasskeysRepository repository;

  /// Returns true if the device supports passkey.
  Future<bool> isSupported() async {
    final bool? isPlatformSupportedResult =
        await BaseDerivPasskeysMethodChannel.instance.isPlatformSupported();
    return isPlatformSupportedResult ?? false;
  }

  /// Creates a passkey credential.
  Future<DerivPasskeyEntity> createCredential({
    String? loginId,
  }) async {
    final Map<String, dynamic> getRegisterOptionsResult =
        (await repository.getRegisterOptions(loginId: loginId)).options;
    final Map<String, String> publicKeyCredentialUserEntityJson =
        <String, String>{
      'id': _base64UrlEncodeString(
          getRegisterOptionsResult['user']['id'].toString()),
      'name': getRegisterOptionsResult['user']['name'],
      'displayName': getRegisterOptionsResult['user']['displayName']
    };

    getRegisterOptionsResult['user'] = publicKeyCredentialUserEntityJson;

    final String options = jsonEncode(getRegisterOptionsResult);

    final String? credentials =
        await BaseDerivPasskeysMethodChannel.instance.createCredential(options);
    if (credentials == null) {
      throw PlatformException(
          code: 'null-response',
          message: 'Unable to get response from Passkey.');
    }
    final Map<String, dynamic> decodedCredentials = jsonDecode(credentials);
    final DerivPasskeyEntity getRegisterPasskeysResult =
        await repository.registerCredentials(
      DerivPasskeysRegisterCredentialsEntity(
        publicKeyCredential: decodedCredentials,
        name: 'Passkey',
      ),
      loginId: loginId,
    );
    return getRegisterPasskeysResult;
  }

  /// Gets a list of passkeys.
  Future<List<DerivPasskeyEntity>> getPasskeysList({
    String? loginId,
  }) async {
    final List<DerivPasskeyEntity> getPasskeysListResult =
        await repository.getPasskeysList(loginId: loginId);
    return getPasskeysListResult;
  }

  /// Gets a passkey credential.
  Future<DerivPasskeysVerifyCredentialsResponseEntity> verifyCredential({
    required String jwtToken,
    required PasskeysConnectionInfoEntity passkeysConnectionInfoEntity,
    String? userAgent,
  }) async {
    final Map<String, dynamic> getOptionsResult = (await repository.getOptions(
      passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
    ))
        .toJson();
    final String options = jsonEncode(getOptionsResult);

    final String? response =
        await BaseDerivPasskeysMethodChannel.instance.getCredential(options);

    if (response == null) {
      throw PlatformException(
          code: 'null-response',
          message: 'Unable to get response from Passkey.');
    }

    final Map<String, dynamic> decodedResponse = jsonDecode(response);

    final DerivPasskeysVerifyCredentialsResponseEntity
        getVerifyCredentialsResult = await repository.verifyCredentials(
      requestBodyEntity: DerivPasskeysVerifyCredentialsRequestBodyEntity(
        appId: passkeysConnectionInfoEntity.appId,
        publicKeyCredential: decodedResponse,
        type: 'passkeys',
      ),
      jwtToken: jwtToken,
      passkeysConnectionInfoEntity: passkeysConnectionInfoEntity,
      userAgent: userAgent,
    );

    return getVerifyCredentialsResult;
  }
}

String _base64UrlEncodeString(String input) {
  final List<int> bytes = utf8.encode(input);
  final String base64Str = base64Url.encode(bytes);
  return base64Str;
}
