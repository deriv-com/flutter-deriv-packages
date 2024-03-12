import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/data/models/deriv_passkey_model.dart';
import 'package:deriv_passkeys/data/models/deriv_passkeys_register_options_model.dart';
import 'package:deriv_passkeys/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkey_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_credentials_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_options_entity.dart';

/// [DerivPasskeysRepository] extends and implements [BaseDerivPasskeysRepository].
///
/// It is responsible for handling all DerivPasskeys data sources, and forwarding relavant data
/// to the services using it.
final class DerivPasskeysRepository extends BaseDerivPasskeysRepository {
  /// Creates a [DerivPasskeysRepository].
  DerivPasskeysRepository(this.dataSource);

  final BaseDerivPasskeysDataSource dataSource;

  @override
  Future<DerivPasskeysOptionsEntity> getOptions() => dataSource
      .getOptions()
      .then(dataSource.mapper.mapDerivPasskeysOptionsModel);

  @override
  Future<DerivPasskeysRegisterOptionsEntity> getRegisterOptions() => dataSource
      .getRegisterOptions()
      .then(dataSource.mapper.mapDerivPasskeysRegisterOptionsModel);

  @override
  Future<DerivPasskeyEntity> registerCredentials(
          DerivPasskeysRegisterCredentialsEntity entity) =>
      dataSource
          .registerCredentials(dataSource.mapper
              .mapDerivPasskeysRegisterCredentialsEntity(entity))
          .then(dataSource.mapper.mapDerivPasskeyModel);

  @override
  Future<List<DerivPasskeyEntity>> getPasskeysList() =>
      dataSource.getPasskeysList().then((List<DerivPasskeyModel> models) =>
          models.map(dataSource.mapper.mapDerivPasskeyModel).toList());
}
