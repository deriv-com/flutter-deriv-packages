import 'dart:async';
import 'dart:convert';

import 'package:dart_web_socket_handler/web_socket_handler.dart';

final Uri _endpointUrl = Uri(
  scheme: 'wss',
  host: 'qa16.deriv.dev',
  path: '/websockets/v3',
  queryParameters: <String, String>{'app_id': '16929'},
);

class WebSocketConnection {
  factory WebSocketConnection() => _instance;

  WebSocketConnection._internal() : _channel = WebSocket(_endpointUrl) {
    _channel.messages
        .listen((dynamic event) => streamController.add(jsonDecode(event)));
  }

  static final WebSocketConnection _instance = WebSocketConnection._internal();

  late final WebSocket _channel;

  final StreamController<dynamic> streamController =
      StreamController<dynamic>.broadcast();

  Stream<ConnectionState> get connectionState => _channel.connection;

  Future<void> request(Map<String, dynamic> request) async =>
      _channel.send(jsonEncode(request));

  Stream<dynamic> get response => streamController.stream.transform(
        StreamTransformer<dynamic, dynamic>.fromHandlers(
          handleData: (dynamic event, EventSink<dynamic> sink) =>
              event['error'] == null
                  ? sink.add(event)
                  : throw Exception(event['error']['message']),
        ),
      );
}
