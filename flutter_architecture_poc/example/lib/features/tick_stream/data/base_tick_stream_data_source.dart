import 'dart:async';

import 'package:example/core/contracts/data/base_data_source.dart';
import 'package:example/features/tick_stream/data/tick_stream_mapper.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';

abstract class BaseTickStreamDataSource implements BaseDataSource {
  BaseTickStreamDataSource(this.mapper);

  @override
  final TickStreamMapper mapper;

  void forgetTickStream(String id);

  Stream<TickStreamModel> fetchTickStream(String symbol);
}
