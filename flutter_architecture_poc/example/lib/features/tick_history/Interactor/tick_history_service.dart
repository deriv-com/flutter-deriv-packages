import 'package:example/features/tick_history/interactor/base_tick_history_service.dart';
import 'package:example/features/tick_history/domain/base_tick_history_repository.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

class TickHistoryService implements BaseTickHistoryService {
  TickHistoryService(this.repository);

  @override
  final BaseTickHistoryRepository repository;

  @override
  Future<TickHistoryEntity> fetchTickHistory(String symbol, int count) =>
      repository.fetchTickHistory(symbol, count);
}
