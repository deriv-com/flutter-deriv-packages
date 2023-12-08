import 'dart:async';

import 'package:example/features/active_symbol/data/base_active_symbol_data_source.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';
import 'package:example/features/active_symbol/domain/base_active_symbol_repository.dart';

class ActiveSymbolRepoistory implements BaseActiveSymbolRepository {
  ActiveSymbolRepoistory(this.dataSource);

  @override
  final BaseActiveSymbolDataSource dataSource;

  @override
  Future<Iterable<ActiveSymbolEntity>> fetchActiveSymbols() async =>
      (await dataSource.fetchActiveSymbols()).map(dataSource.mapper.toEntity);
}
