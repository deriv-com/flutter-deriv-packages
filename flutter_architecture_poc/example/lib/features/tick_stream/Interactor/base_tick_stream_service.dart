import 'package:example/core/contracts/interactor/base_service_with_repository.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

abstract class BaseTickStreamService implements BaseServiceWithRepository {
  void forgetTickStream(String id);

  Stream<TickStreamEntity> fetchTickStream(String symbol);
}
