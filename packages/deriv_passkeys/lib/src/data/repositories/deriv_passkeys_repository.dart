import 'package:deriv_passkeys/src/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/src/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/src/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/src/domain/entities/passkeys_connection_info_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_register_options_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_request_body_entity.dart';
import 'package:deriv_passkeys/src/domain/entities/deriv_passkeys_verify_credentials_response_entity.dart';

/// [DerivPasskeysRepository] extends and implements [BaseDerivPasskeysRepository].
///
/// It is responsible for handling all DerivPasskeys data sources, and forwarding relavant data
/// to the services using it.
final class DerivPasskeysRepository extends BaseDerivPasskeysRepository {
  /// Creates a [DerivPasskeysRepository].
  DerivPasskeysRepository(this.dataSource);

  /// The data source used to get data for Passkeys functionalities.
  final BaseDerivPasskeysDataSource dataSource;

  @override
  Future<DerivPasskeysOptionsEntity> getOptions({
    required PasskeysConnectionInfoEntity passkeysConnectionInfoEntity,
  }) =>
      dataSource
          .getOptions(
            passkeysConnectionInfoModel: dataSource.mapper
                .mapConnectionInfoEntity(passkeysConnectionInfoEntity),
          )
          .then(dataSource.mapper.mapDerivPasskeysOptionsModel);

  @override
  Future<DerivPasskeysVerifyCredentialsResponseEntity> verifyCredentials({
    required DerivPasskeysVerifyCredentialsRequestBodyEntity requestBodyEntity,
    required String jwtToken,
    required PasskeysConnectionInfoEntity passkeysConnectionInfoEntity,
    String? userAgent,
  }) =>
      dataSource
          .verifyCredentials(
            requestBodyModel: dataSource.mapper
                .mapDerivPasskeysVerifyCredentialsRequestBodyEntity(
                    requestBodyEntity),
            jwtToken: jwtToken,
            passkeysConnectionInfoModel: dataSource.mapper
                .mapConnectionInfoEntity(passkeysConnectionInfoEntity),
            userAgent: userAgent,
          )
          .then(
              dataSource.mapper.mapDerivPasskeysVerifyCredentialsResponseModel);

  @override
  Future<DerivPasskeysRegisterOptionsEntity> getRegisterOptions({
    String? loginId,
  }) =>
      dataSource
          .getRegisterOptions(loginId: loginId)
          .then(dataSource.mapper.mapDerivPasskeysRegisterOptionsModel);

  @override
  Future<DerivPasskeyEntity> registerCredentials(
    DerivPasskeysRegisterCredentialsEntity entity, {
    String? loginId,
  }) =>
      dataSource
          .registerCredentials(
            dataSource.mapper
                .mapDerivPasskeysRegisterCredentialsEntity(entity)
                .copyWith(
                  loginid: loginId,
                ),
          )
          .then(dataSource.mapper.mapDerivPasskeyModel);

  @override
  Future<List<DerivPasskeyEntity>> getPasskeysList({String? loginId}) =>
      dataSource.getPasskeysList(loginId: loginId).then(
          (List<DerivPasskeyModel> models) =>
              models.map(dataSource.mapper.mapDerivPasskeyModel).toList());
}
