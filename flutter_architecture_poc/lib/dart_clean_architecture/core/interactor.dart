import 'domain.dart';

abstract class BaseService {
  const BaseService();
}

abstract class BaseServiceWithRepository implements BaseService {
  const BaseServiceWithRepository(this.repository);

  final BaseRepository repository;
}
