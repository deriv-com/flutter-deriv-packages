import 'dart:async';

import 'package:example/core/contracts/domain/base_repository.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

abstract class BaseTickStreamRepository implements BaseRepository {
  void forgetTickStream(String id);

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}
