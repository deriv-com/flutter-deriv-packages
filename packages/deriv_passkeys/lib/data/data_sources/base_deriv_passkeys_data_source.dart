import 'package:deriv_passkeys/core/data/base_data_source.dart';
import 'package:deriv_passkeys/data/mappers/deriv_passkeys_mapper.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_request_body.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_verify_credentials_response.dart';

/// [BaseDerivPasskeysDataSource] defines a contract for all DerivPasskeys data sources.
///
/// All DerivPasskeys data sources should extend this class, and implement its abstract methods.
abstract base class BaseDerivPasskeysDataSource implements BaseDataSource {
  /// Creates a [BaseDerivPasskeysDataSource].
  BaseDerivPasskeysDataSource(this.mapper);

  /// The mapper used to map the data source to the domain.
  @override
  final DerivPasskeysMapper mapper;

  /// Get options for authentication with DerivPasskeys.
  Future<DerivPasskeysOptionsModel> getOptions();

  /// Verify the user's DerivPasskeys credentials.
  Future<DerivPasskeysVerifyCredentialsResponse> verifyCredentials(
      DerivPasskeysVerifyCredentialsRequestBody body);

  /// Get options for registration with DerivPasskeys.
  Future<DerivPasskeysOptionsModel> getRegisterOptions();
}