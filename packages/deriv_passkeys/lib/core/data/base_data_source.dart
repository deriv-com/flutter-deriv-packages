import 'package:deriv_passkeys/core/domain/base_entity.dart';

import 'base_mapper.dart';
import 'base_model.dart';

/// Base class that all BaseFeatureDataSource(s) should extend.
abstract class BaseDataSource {
  /// Creates a [BaseDataSource].
  BaseDataSource(this.mapper);

  /// The mapper used to map the data source to the domain.
  final BaseMapper<BaseEntity, BaseModel> mapper;
}
