import 'package:example/core/contracts/interactor/base_service_with_repository.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

abstract class BaseActiveSymbolService implements BaseServiceWithRepository {
  Future<Iterable<ActiveSymbolEntity>> fetchActiveSymbols();
}
