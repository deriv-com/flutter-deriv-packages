import 'package:example/core/contracts/data/base_mapper.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';
import 'package:example/features/active_symbol/domain/active_symbol_entity.dart';

class ActiveSymbolMapper
    implements BaseMapper<ActiveSymbolEntity, ActiveSymbolModel> {
  @override
  ActiveSymbolEntity toEntity(ActiveSymbolModel model) => ActiveSymbolEntity(
        symbol: model.symbol,
        symbolDisplayName: model.symbolDisplayName,
        market: model.market,
        marketDisplayName: model.marketDisplayName,
      );
}
