import 'package:example/core/contracts/domain/base_entity.dart';

class ActiveSymbolEntity extends BaseEntity {
  ActiveSymbolEntity({
    required this.symbolDisplayName,
    required this.market,
    required this.marketDisplayName,
    this.symbol,
  });

  final String? symbol;
  final String symbolDisplayName;
  final String market;
  final String marketDisplayName;
}
