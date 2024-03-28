import 'package:deriv_http_client/deriv_http_client.dart';
import 'package:deriv_passkeys/src/data/mappers/deriv_passkeys_mapper.dart';
import 'package:deriv_passkeys/src/data/models/passkeys_connection_info_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_request_body_model.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkeys_verify_credentials_response_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/passkeys_register_send.dart';

/// [BaseDerivPasskeysDataSource] defines a contract for all DerivPasskeys data sources.
///
/// All DerivPasskeys data sources should extend this class, and implement its abstract methods.
abstract class BaseDerivPasskeysDataSource {
  /// Creates a [BaseDerivPasskeysDataSource].
  BaseDerivPasskeysDataSource({required this.mapper, required this.client});

  /// The mapper used to map the data source to the domain.
  final DerivPasskeysMapper mapper;

  /// The http client used to make http requests.
  BaseHttpClient client;

  /// Get options for authentication with DerivPasskeys.
  Future<DerivPasskeysOptionsModel> getOptions({
    required PasskeysConnectionInfoModel passkeysConnectionInfoModel,
  });

  /// Verify the user's DerivPasskeys credentials.
  Future<DerivPasskeysVerifyCredentialsResponseModel> verifyCredentials({
    required DerivPasskeysVerifyCredentialsRequest requestBodyModel,
    required String jwtToken,
    required PasskeysConnectionInfoModel passkeysConnectionInfoModel,
    String? userAgent,
  });

  /// Get options for registration with DerivPasskeys.
  Future<DerivPasskeysRegisterOptionsModel> getRegisterOptions();

  /// Register credentials with DerivPasskeys.
  Future<DerivPasskeyModel> registerCredentials(
      PasskeysRegisterRequest request);

  /// Get passkeys list.
  Future<List<DerivPasskeyModel>> getPasskeysList();
}
