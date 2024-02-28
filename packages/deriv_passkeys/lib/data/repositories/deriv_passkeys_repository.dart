import 'package:deriv_passkeys/data/data_sources/base_deriv_passkeys_data_source.dart';
import 'package:deriv_passkeys/domain/base_repositories/base_deriv_passkeys_repository.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_options_entity.dart';
import 'package:deriv_passkeys/domain/entities/deriv_passkeys_register_options_entity.dart';

/// [DerivPasskeysRepository] extends and implements [BaseDerivPasskeysRepository].
///
/// It is responsible for handling all DerivPasskeys data sources, and forwarding relavant data
/// to the services using it.
final class DerivPasskeysRepository extends BaseDerivPasskeysRepository {
  /// Creates a [DerivPasskeysRepository].
  DerivPasskeysRepository(this.dataSource);

  @override
  final BaseDerivPasskeysDataSource dataSource;

  @override
  Future<DerivPasskeysOptionsEntity> getOptions() =>
      dataSource.getOptions().then(dataSource.mapper.toEntity)
          as Future<DerivPasskeysOptionsEntity>;

  @override
  Future<DerivPasskeysRegisterOptionsEntity> getRegisterOptions() =>
      dataSource.getRegisterOptions().then(dataSource.mapper.toEntity)
          as Future<DerivPasskeysRegisterOptionsEntity>;
}
