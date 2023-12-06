import 'package:example/core/contracts/data/base_mapper.dart';
import 'package:example/features/tick_history/data/tick_history_model.dart';
import 'package:example/features/tick_history/domain/tick_history_entity.dart';

class TickHistoryMapper
    implements BaseMapper<TickHistoryEntity, TickHistoryModel> {
  @override
  TickHistoryEntity toEntity(TickHistoryModel model) => TickHistoryEntity(
        prices: model.prices,
        times: model.times,
        pipSize: model.pipSize,
      );
}
