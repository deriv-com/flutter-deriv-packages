import 'dart:async';
import 'dart:developer' as developer;

import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:deriv_web_socket_client/src/connection_controller/connection_controller.dart';
import 'package:deriv_web_socket_client/src/web_socket/connection.dart'
    if (dart.library.html) 'package:deriv_web_socket_client/src/web_socket/connection_html.dart'
    if (dart.library.io) 'package:deriv_web_socket_client/src/web_socket/connection_io.dart';
import 'package:deriv_web_socket_client/deriv_web_socket_client.dart';

/// A wrapper around [WebSocketChannel] that handles connection state.
class WebSocket {
  /// Initializes [WebSocket].
  WebSocket(
    this.uri, {
    this.protocols,
    this.binaryType,
    this.pingInterval = const Duration(seconds: 1),
    this.reconnectInterval = const Duration(seconds: 3),
    this.timeout = const Duration(seconds: 5),
  }) {
    _connect();
  }

  /// The URI to which to connect.
  final Uri uri;

  /// The protocols to request.
  final Iterable<String>? protocols;

  /// The type of binary messages.
  final String? binaryType;

  /// The interval at which to send ping signals.
  final Duration? pingInterval;

  /// The interval at which to attempt to reconnect.
  final Duration reconnectInterval;

  /// The timeout for connection.
  final Duration timeout;

  /// An stream of messages that are received from the server.
  Stream<dynamic> get messages => _messageController.stream;

  /// An stream of connection state changes.
  ConnectionController get connection => _connectionController;

  final ConnectionController _connectionController = ConnectionController();
  final StreamController<dynamic> _messageController =
      StreamController<dynamic>.broadcast();

  WebSocketChannel? _channel;

  final List<dynamic> _messageQueue = <dynamic>[];

  bool _isClosedByUser = false;
  Timer? _backoffTimer;

  /// Sends [message] to the server.
  void send(dynamic message) =>
      _isConnected() ? _channel?.sink.add(message) : _messageQueue.add(message);

  /// Closes the connection.
  Future<void> close([int? code, String? reason]) async {
    final ConnectionState state = _connectionController.state;

    if (state is DisconnectedState) {
      return;
    }

    _isClosedByUser = true;
    _backoffTimer?.cancel();
    _connectionController.add(const DisconnectingState());

    await _channel?.sink.close(code, reason);

    _connectionController
      ..add(DisconnectedState(code: code, reason: reason))
      ..close();

    await _messageController.close();
  }

  Future<void> _connect() async {
    if (_isConnected()) {
      return;
    }

    try {
      final dynamic webSocket = await connect(
        '$uri',
        protocols: protocols,
        binaryType: binaryType,
        pingInterval: pingInterval,
      ).timeout(timeout);

      final ConnectionState connectionState = _connectionController.state;

      if (connectionState is ReconnectingState) {
        _connectionController.add(const ReconnectedState());
      } else if (connectionState is ConnectingState) {
        _connectionController.add(const ConnectedState());
      }

      _channel = getChannel(webSocket);

      _channel!.stream.listen(
        (dynamic message) {
          if (_messageController.isClosed) {
            return;
          }

          _messageController.add(message);
        },
        onDone: _attemptToReconnect,
        cancelOnError: true,
      );

      _sendQueuedMessages();
    } on Exception catch (error, stackTrace) {
      developer.log(
        'WebSocket: Failed to connect to "$uri".',
        error: error,
        stackTrace: stackTrace,
      );

      _attemptToReconnect(error, stackTrace);
    }
  }

  void _attemptToReconnect([Object? error, StackTrace? stackTrace]) {
    if (_isClosedByUser || _isReconnecting() || _isDisconnecting()) {
      return;
    }

    _connectionController.add(
      DisconnectedState(
        code: _channel?.closeCode,
        reason: _channel?.closeReason,
        error: error,
        stackTrace: stackTrace,
      ),
    );

    _channel = null;

    _reconnect();
  }

  Future<void> _reconnect() async {
    if (_isClosedByUser || _isConnected()) {
      return;
    }

    _connectionController.add(const ReconnectingState());

    await _connect();

    if (_isClosedByUser || _isConnected()) {
      _backoffTimer?.cancel();

      return;
    }

    _backoffTimer?.cancel();
    _backoffTimer = Timer(reconnectInterval, _reconnect);
  }

  bool _isConnected() {
    final ConnectionState state = _connectionController.state;

    return state is ConnectedState || state is ReconnectedState;
  }

  bool _isReconnecting() {
    final ConnectionState state = _connectionController.state;

    return state is ReconnectingState;
  }

  bool _isDisconnecting() {
    final ConnectionState state = _connectionController.state;

    return state is DisconnectingState;
  }

  void _sendQueuedMessages() => _messageQueue
    ..forEach(_channel!.sink.add)
    ..clear();
}
