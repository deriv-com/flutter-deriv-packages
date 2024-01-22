import 'package:deriv_passkeys/data/data_sources/base_single_feature_data_source.dart';
import 'package:deriv_passkeys/domain/base_repositories/base_single_feature_repository.dart';

/// [SingleFeatureRepository] extends and implements [BaseSingleFeatureRepository].
///
/// It is responsible for handling all SingleFeature data sources, and forwarding relavant data
/// to the services using it.
final class SingleFeatureRepository extends BaseSingleFeatureRepository {
  /// Creates a [SingleFeatureRepository].
  SingleFeatureRepository(this.dataSource);

  @override
  final BaseSingleFeatureDataSource dataSource;
}
