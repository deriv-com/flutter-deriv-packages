import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/tick_history/data/base_tick_history_data_source.dart';
import 'package:example/features/tick_history/data/tick_history_model.dart';

class TickHistoryDataSource extends BaseTickSHistoryDataSource {
  TickHistoryDataSource(super.mapper);

  @override
  Future<TickHistoryModel> fetchTickHistory(String symbol, int count) {
    final Map<String, dynamic> request = <String, dynamic>{
      'ticks_history': symbol,
      'count': count,
      'end': 'latest',
      'style': 'ticks',
    };

    WebSocketConnection().request(request);

    return WebSocketConnection()
        .response
        .where((dynamic event) => event['msg_type'] == 'history')
        .map((dynamic event) => TickHistoryModel.fromJson(event))
        .first;
  }
}
