import '../domain/base_repository.dart';
import 'base_service.dart';

/// Base class that some BaseFeatureService(s) will extend.
abstract class BaseServiceWithRepository implements BaseService {
  /// Creates a [BaseServiceWithRepository].
  const BaseServiceWithRepository(this.repository);

  /// The repository used to retrieve data from.
  final BaseRepository repository;
}
