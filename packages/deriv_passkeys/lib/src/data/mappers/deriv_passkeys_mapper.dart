import 'package:deriv_passkeys/src/data/models/passkeys_connection_info_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_request_body_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_response_model.dart';
import 'package:deriv_passkeys/src/domain/entities/account_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';

/// [DerivPasskeysMapper] maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
class DerivPasskeysMapper {
  /// Maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
  DerivPasskeysOptionsEntity mapDerivPasskeysOptionsModel(
          DerivPasskeysOptionsModel model) =>
      DerivPasskeysOptionsEntity.fromJson(model.toJson());

  /// Maps [DerivPasskeysVerifyCredentialsRequest] to [DerivPasskeysVerifyCredentialsRequestBodyEntity].
  DerivPasskeysVerifyCredentialsRequest
      mapDerivPasskeysVerifyCredentialsRequestBodyEntity(
              DerivPasskeysVerifyCredentialsRequestBodyEntity entity) =>
          DerivPasskeysVerifyCredentialsRequest.fromJson(entity.toJson());

  /// Maps [DerivPasskeysRegisterOptionsModel] to [DerivPasskeysRegisterOptionsEntity].
  DerivPasskeysRegisterOptionsEntity mapDerivPasskeysRegisterOptionsModel(
          DerivPasskeysRegisterOptionsModel model) =>
      DerivPasskeysRegisterOptionsEntity.fromJson(model.toJson());

  /// Maps [DerivPasskeyModel] to [DerivPasskeyEntity].
  DerivPasskeyEntity mapDerivPasskeyModel(DerivPasskeyModel model) =>
      DerivPasskeyEntity.fromJson(
        model.toJson(),
      );

  /// Maps [DerivPasskeysRegisterCredentialsEntity] to [PasskeysRegisterRequest].
  PasskeysRegisterRequest mapDerivPasskeysRegisterCredentialsEntity(
          DerivPasskeysRegisterCredentialsEntity entity) =>
      PasskeysRegisterRequest(
        name: entity.name,
        publicKeyCredential: entity.publicKeyCredential,
      );

  /// Maps [DerivPasskeysVerifyCredentialsResponseModel] to [DerivPasskeysVerifyCredentialsResponseEntity].
  DerivPasskeysVerifyCredentialsResponseEntity
      mapDerivPasskeysVerifyCredentialsResponseModel(
              DerivPasskeysVerifyCredentialsResponseModel model) =>
          DerivPasskeysVerifyCredentialsResponseEntity(
            accounts:
                (model.response['tokens'] as List<dynamic>).map((dynamic e) {
              final Map<String, dynamic> map = e as Map<String, dynamic>;
              return AccountEntity(
                loginId: map['loginid'] as String,
                token: map['token'] as String,
              );
            }).toList(),
            refreshToken: model.response['refresh_token'] as String,
          );

  /// Maps [ConnectionInfoEntity] to [PasskeysConnectionInfoModel].
  PasskeysConnectionInfoModel mapConnectionInfoEntity(
          PasskeysConnectionInfoEntity entity) =>
      PasskeysConnectionInfoModel(
        endpoint: entity.endpoint,
        appId: entity.appId,
      );
}
