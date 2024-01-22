import 'package:deriv_passkeys/core/data/base_mapper.dart';
import 'package:deriv_passkeys/data/models/single_feature_model.dart';
import 'package:deriv_passkeys/domain/entities/single_feature_entity.dart';

/// [SingleFeatureMapper] maps [SingleFeatureModel] to [SingleFeatureEntity].
final class SingleFeatureMapper
    implements BaseMapper<SingleFeatureEntity, SingleFeatureModel> {
  @override
  SingleFeatureEntity toEntity(SingleFeatureModel model) =>
      SingleFeatureEntity();
}
