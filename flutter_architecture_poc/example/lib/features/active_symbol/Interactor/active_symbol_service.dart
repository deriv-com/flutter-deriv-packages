import 'package:example/features/active_symbol/interactor/base_active_symbol_service.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_repository.dart';

class ActiveSymbolService implements BaseActiveSymbolService {
  ActiveSymbolService(this.repository);

  @override
  final BaseActiveSymbolRepository repository;

  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols() async {
    final List<ActiveSymbolEntity> result =
        (await repository.fetchActiveSymbols()).toList()
          ..insert(
            0,
            ActiveSymbolEntity(
              symbolDisplayName: '',
              market: '',
              marketDisplayName: '',
            ),
          );

    return result;
  }
}
