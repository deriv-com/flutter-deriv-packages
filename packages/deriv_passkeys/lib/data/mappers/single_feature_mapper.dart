
import 'package:architecture_template_poc/core/data/base_mapper.dart';
import 'package:architecture_template_poc/features/single_feature/data/models/single_feature_model.dart';
import 'package:architecture_template_poc/features/single_feature/domain/entities/single_feature_entity.dart';

/// [SingleFeatureMapper] maps [SingleFeatureModel] to [SingleFeatureEntity].
final class SingleFeatureMapper implements BaseMapper<SingleFeatureEntity, SingleFeatureModel> {
  @override
  SingleFeatureEntity toEntity(SingleFeatureModel model) => SingleFeatureEntity();
}
