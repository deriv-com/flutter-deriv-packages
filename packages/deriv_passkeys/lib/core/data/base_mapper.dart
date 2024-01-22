import 'package:deriv_passkeys/core/domain/base_entity.dart';

import 'base_model.dart';

/// Base class that all FeatureMapper(s) should extend.
abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  /// Function to map models to entities.
  E toEntity(M model);
}
