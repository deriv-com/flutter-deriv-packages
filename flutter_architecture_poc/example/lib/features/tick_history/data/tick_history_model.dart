import 'package:example/core/contracts/data/base_model.dart';

class TickHistoryModel extends BaseModel {
  TickHistoryModel({
    required this.prices,
    required this.times,
    required this.pipSize,
  });

  TickHistoryModel.fromJson(Map<String, dynamic> json)
      : prices = json['history']['prices'].cast<double>(),
        times = json['history']['times'].cast<int>(),
        pipSize = json['pip_size'];

  final List<double> prices;
  final List<int> times;
  final int pipSize;
}
