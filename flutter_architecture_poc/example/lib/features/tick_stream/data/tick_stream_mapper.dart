import 'package:example/core/contracts/data/base_mapper.dart';
import 'package:example/features/tick_stream/data/tick_stream_model.dart';
import 'package:example/features/tick_stream/domain/tick_stream_entity.dart';

class TickStreamMapper
    implements BaseMapper<TickStreamEntity, TickStreamModel> {
  @override
  TickStreamEntity toEntity(TickStreamModel model) => TickStreamEntity(
        epoch: model.epoch,
        quote: model.quote,
        symbol: model.symbol,
        pipSize: model.pipSize,
        id: model.id,
      );
}
