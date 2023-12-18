import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Returns a [WebSocketChannel] from [socket].
WebSocketChannel getChannel(WebSocket socket) => IOWebSocketChannel(socket);

/// Returns a [Future] that completes with a [WebSocket] connected to [url].
Future<WebSocket> connect(
  String url, {
  Iterable<String>? protocols,
  Duration? pingInterval,
  String? binaryType,
}) async =>
    await WebSocket.connect(url, protocols: protocols)
      ..pingInterval = pingInterval;
