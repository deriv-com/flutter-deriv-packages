
import 'package:architecture_template_poc/core/data/base_data_source.dart';

/// [BaseSingleFeatureDataSource] defines a contract for all SingleFeature data sources.
///
/// All SingleFeature data sources should extend this class, and implement its abstract methods.
abstract base class BaseSingleFeatureDataSource extends BaseDataSource {
  /// Creates a [BaseSingleFeatureDataSource].
  BaseSingleFeatureDataSource(super.mapper);
}
