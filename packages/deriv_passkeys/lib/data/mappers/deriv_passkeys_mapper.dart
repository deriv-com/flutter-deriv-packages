import 'package:deriv_passkeys/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';

/// [DerivPasskeysMapper] maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
final class DerivPasskeysMapper {
  /// Maps [DerivPasskeysOptionsModel] to [DerivPasskeysOptionsEntity].
  DerivPasskeysOptionsEntity mapDerivPasskeysOptionsModel(
          DerivPasskeysOptionsModel model) =>
      DerivPasskeysOptionsEntity.fromJson(model.toJson());

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
}
