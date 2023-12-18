import 'domain.dart';

abstract class BaseDataSource {
  BaseDataSource(this.mapper);

  final BaseMapper<BaseEntity, BaseModel>? mapper;
}

abstract class BaseModel {}

abstract class BaseDataSources<BaseModel> {}

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  E toEntity(M model);

  M toModel(E entity);
}
