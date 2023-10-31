import '../domain/base_entity.dart';
import 'base_mapper.dart';
import 'base_model.dart';

abstract class BaseDataSource {
  BaseDataSource(this.mapper);

  final BaseMapper<BaseEntity, BaseModel> mapper;
}
