import 'package:example/core/contracts/data/base_model.dart';

class TickStreamModel extends BaseModel {
  TickStreamModel({
    required this.ask,
    required this.bid,
    required this.epoch,
    required this.id,
    required this.pipSize,
    required this.quote,
    required this.symbol,
  });

  TickStreamModel.fromJson(Map<String, dynamic> json)
      : ask = json['ask'].toDouble(),
        bid = json['bid'].toDouble(),
        epoch = json['epoch'],
        id = json['id'],
        pipSize = json['pip_size'],
        quote = json['quote'].toDouble(),
        symbol = json['symbol'];

  final double ask;
  final double bid;
  final int epoch;
  final String id;
  final int pipSize;
  final double quote;
  final String symbol;
}
