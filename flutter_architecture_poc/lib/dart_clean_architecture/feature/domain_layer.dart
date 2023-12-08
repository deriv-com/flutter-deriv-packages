import '../core/data.dart';
import '../core/domain.dart';

class FeatureEntity implements BaseEntity {}

abstract class BaseFeatureRepository implements BaseRepository {
  @override
  BaseDataSource get dataSource => throw UnimplementedError();
}
