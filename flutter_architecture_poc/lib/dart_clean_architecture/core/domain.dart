import 'data.dart';

abstract class BaseEntity {}

abstract class BaseRepository {
  const BaseRepository(this.dataSource);

  final BaseDataSource? dataSource;
}
