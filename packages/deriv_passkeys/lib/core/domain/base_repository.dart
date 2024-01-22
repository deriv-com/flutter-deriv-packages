import '../data/base_data_source.dart';

/// Base class that all BaseFeatureRepository(s) should extend.
abstract class BaseRepository {
  /// Creates a [BaseRepository].
  const BaseRepository(this.dataSource);

  /// The data source used to retrieve data from.
  final BaseDataSource? dataSource;
}
