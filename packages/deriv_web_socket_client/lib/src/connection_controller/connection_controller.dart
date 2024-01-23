import 'dart:async';

import 'base_connection_controller.dart';
import 'connection_state.dart';

/// Manages the connection state and notifies listeners when the state changes.
class ConnectionController extends BaseConnectionController {
  /// Initializes [ConnectionController].
  ConnectionController()
      : _state = const ConnectingState(),
        _controller = StreamController<DerivConnectionState>.broadcast() {
    _controller.add(_state);
  }

  DerivConnectionState _state;
  final StreamController<DerivConnectionState> _controller;

  @override
  DerivConnectionState get state => _state;

  @override
  StreamSubscription<DerivConnectionState> listen(
    void Function(DerivConnectionState event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      _getStream().distinct().listen(
            onData,
            onError: onError,
            onDone: onDone,
            cancelOnError: cancelOnError,
          );

  Stream<DerivConnectionState> _getStream() async* {
    yield _state;
    yield* _controller.stream;
  }

  /// Sets the connection state to [state] and notifies listeners.
  void add(DerivConnectionState state) {
    _state = state;
    _controller.add(state);
  }

  /// Closes [ConnectionController] and releases resources.
  void close() => _controller.close();
}
