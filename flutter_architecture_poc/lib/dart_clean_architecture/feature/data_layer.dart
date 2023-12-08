import '../core/data.dart';
import '../core/domain.dart';
import 'domain_layer.dart';

class FeatureModel implements BaseModel {}

abstract class BaseFeatureDataSource implements BaseDataSource {
  Future<FeatureModel> getData();
}

class RemoteFeatureDataSource implements BaseFeatureDataSource {
  @override
  BaseMapper<BaseEntity, BaseModel>? get mapper => throw UnimplementedError();

  @override
  Future<FeatureModel> getData() async => FeatureModel();
}

class LocalFeatureDataSource implements BaseFeatureDataSource {
  @override
  BaseMapper<BaseEntity, BaseModel>? get mapper => throw UnimplementedError();

  @override
  Future<FeatureModel> getData() async => FeatureModel();
}

class FeatureRepository implements BaseFeatureRepository {
  @override
  BaseFeatureDataSource get dataSource => throw UnimplementedError();
}

class FeatureMapper implements BaseMapper<BaseEntity, BaseModel> {
  @override
  BaseModel toModel(BaseEntity entity) => throw UnimplementedError();

  @override
  BaseEntity toEntity(BaseModel model) => throw UnimplementedError();
}
