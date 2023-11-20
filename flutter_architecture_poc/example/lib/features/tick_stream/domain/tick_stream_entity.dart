import 'package:example/core/contracts/domain/base_entity.dart';

class TickStreamEntity extends BaseEntity {
  TickStreamEntity({
    required this.epoch,
    required this.quote,
    required this.symbol,
    required this.pipSize,
    required this.id,
  });

  final int epoch;
  final double quote;
  final String symbol;
  final int pipSize;
  final String id;
}
