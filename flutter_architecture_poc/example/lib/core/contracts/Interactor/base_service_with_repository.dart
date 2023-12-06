import '../domain/base_repository.dart';
import 'base_service.dart';

abstract class BaseServiceWithRepository implements BaseService {
  const BaseServiceWithRepository(this.repository);

  final BaseRepository repository;
}
