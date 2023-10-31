import 'package:example/core/contracts/domain/base_entity.dart';

class TickHistoryEntity extends BaseEntity {
  TickHistoryEntity({
    required this.prices,
    required this.times,
    required this.pipSize,
  });

  final List<double> prices;
  final List<int> times;
  final int pipSize;
}
