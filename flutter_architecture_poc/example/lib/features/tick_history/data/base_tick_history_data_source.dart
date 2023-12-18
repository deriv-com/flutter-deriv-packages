import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/features/tick_history/data/tick_history_mapper.dart';
import 'package:example/features/tick_history/data/tick_history_model.dart';

abstract class BaseTickSHistoryDataSource implements BaseDataSource {
  BaseTickSHistoryDataSource(this.mapper);

  @override
  final TickHistoryMapper mapper;

  Future<TickHistoryModel> fetchTickHistory(String symbol, int count);
}
