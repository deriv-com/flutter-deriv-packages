import 'dart:async';

import 'package:example/core/web_socket_connection.dart';
import 'package:example/features/login/data/base_login_data_source.dart';
import 'package:example/features/login/data/login_model.dart';

class LoginDataSource extends BaseLoginDataSource {
  LoginDataSource(super.mapper);

  @override
  Future<LoginModel> authorize(String token) {
    final Map<String, dynamic> request = <String, dynamic>{'authorize': token};

    WebSocketConnection().request(request);

    return WebSocketConnection()
        .response
        .where((dynamic event) => event['msg_type'] == 'authorize')
        .map((dynamic event) => LoginModel.fromJson(event['authorize']))
        .first;
  }

  @override
  Future<void> logout() {
    final Map<String, dynamic> request = <String, dynamic>{'logout': 1};

    return WebSocketConnection().request(request);
  }
}
