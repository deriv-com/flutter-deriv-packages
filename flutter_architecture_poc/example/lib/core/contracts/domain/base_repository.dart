import '../data/base_data_source.dart';

abstract class BaseRepository {
  const BaseRepository(this.dataSource);

  final BaseDataSource? dataSource;
}
