import 'package:deriv_passkeys/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_options_entity.dart';

/// [BaseDerivPasskeysRepository] defines a contract for all DerivPasskeys repositories.
///
/// All DerivPasskeys repositories should extend this class, and implement its abstract methods.
abstract base class BaseDerivPasskeysRepository {
  /// Get options for authentication with DerivPasskeys.
  Future<DerivPasskeysOptionsEntity> getOptions();

  /// Get options for registration with DerivPasskeys.
  Future<DerivPasskeysRegisterOptionsEntity> getRegisterOptions();

  /// Register credentials with DerivPasskeys.
  Future<DerivPasskeyEntity> registerCredentials(
      DerivPasskeysRegisterCredentialsEntity entity);
}
