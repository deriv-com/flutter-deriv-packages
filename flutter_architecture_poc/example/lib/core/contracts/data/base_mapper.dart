import '../domain/base_entity.dart';
import 'base_model.dart';

abstract class BaseMapper<E extends BaseEntity, M extends BaseModel> {
  E toEntity(M model);
}
