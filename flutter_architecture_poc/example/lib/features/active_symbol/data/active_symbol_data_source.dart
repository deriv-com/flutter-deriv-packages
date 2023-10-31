import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/active_symbol/data/active_symbol_model.dart';
import 'package:example/features/active_symbol/data/base_active_symbol_data_source.dart';

class ActiveSymbolDataSource extends BaseActiveSymbolDataSource {
  ActiveSymbolDataSource(super.mapper);

  @override
  Future<List<ActiveSymbolModel>> fetchActiveSymbols() {
    final Map<String, dynamic> request = <String, dynamic>{
      'active_symbols': 'brief',
      'product_type': 'basic',
    };

    WebSocketConnection().request(request);

    return WebSocketConnection()
        .response
        .where((dynamic event) => event['msg_type'] == 'active_symbols')
        .map<List<ActiveSymbolModel>>(
          (dynamic event) => event['active_symbols']
              .map<ActiveSymbolModel>(
                (dynamic item) => ActiveSymbolModel.fromJson(item),
              )
              .toList(),
        )
        .first;
  }
}
