import 'package:example/core/contracts/interactor/base_service_with_repository.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

abstract class BaseTickHistoryService implements BaseServiceWithRepository {
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count);
}
