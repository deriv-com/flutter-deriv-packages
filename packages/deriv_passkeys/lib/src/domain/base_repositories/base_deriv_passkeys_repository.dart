import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';

/// [BaseDerivPasskeysRepository] defines a contract for all DerivPasskeys repositories.
///
/// All DerivPasskeys repositories should extend this class, and implement its abstract methods.
abstract base class BaseDerivPasskeysRepository {
  /// Get options for authentication with DerivPasskeys.
  Future<DerivPasskeysOptionsEntity> getOptions({
    required PasskeysConnectionInfoEntity passkeysConnectionInfoEntity,
  });

  /// Verify the user's DerivPasskeys credentials.
  Future<DerivPasskeysVerifyCredentialsResponseEntity> verifyCredentials({
    required DerivPasskeysVerifyCredentialsRequestBodyEntity requestBodyEntity,
    required String jwtToken,
    required PasskeysConnectionInfoEntity passkeysConnectionInfoEntity,
    String? userAgent,
  });

  /// Get options for registration with DerivPasskeys.
  Future<DerivPasskeysRegisterOptionsEntity> getRegisterOptions();

  /// Register credentials with DerivPasskeys.
  Future<DerivPasskeyEntity> registerCredentials(
      DerivPasskeysRegisterCredentialsEntity entity);

  /// Get passkeys list.
  Future<List<DerivPasskeyEntity>> getPasskeysList();
}
