import 'dart:async';

import 'package:example/features/tick_stream/data/base_tick_stream_data_source.dart';
import 'package:example/features/tick_stream/domain/base_tick_stream_repository.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

class TickStreamRepoistory implements BaseTickStreamRepository {
  TickStreamRepoistory(this.dataSource);

  @override
  final BaseTickStreamDataSource dataSource;

  @override
  void forgetTickStream(String id) => dataSource.forgetTickStream(id);

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) =>
      dataSource.fetchTickStream(symbol).map(dataSource.mapper.toEntity);
}
