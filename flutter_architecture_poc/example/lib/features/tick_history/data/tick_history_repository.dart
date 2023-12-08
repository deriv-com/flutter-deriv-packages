import 'dart:async';

import 'package:example/features/tick_history/data/base_tick_history_data_source.dart';
import 'package:example/features/tick_history/domain/base_tick_history_repository.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

class TickHistoryRepoistory implements BaseTickHistoryRepository {
  TickHistoryRepoistory(this.dataSource);

  @override
  final BaseTickSHistoryDataSource dataSource;

  @override
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count) =>
      dataSource
          .fetchTickHistory(symbol, count)
          .then(dataSource.mapper.toEntity);
}
