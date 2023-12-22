import 'package:equatable/equatable.dart';

/// Base class for connection states.
abstract class DerivConnectionState with EquatableMixin {
  /// Initializes [DerivConnectionState].
  const DerivConnectionState();

  @override
  List<Object?> get props => <Object?>[];
}

/// Connectiong state, used when the connection is being established.
class ConnectingState extends DerivConnectionState {
  /// Initializes [ConnectingState].
  const ConnectingState();
}

/// Connected state, used when the connection is established.
class ConnectedState extends DerivConnectionState {
  /// Initializes [ConnectedState].
  const ConnectedState();
}

/// Reconnecting state, used when the connection is being established after a disconnection.
class ReconnectingState extends DerivConnectionState {
  /// Initializes [ReconnectingState].
  const ReconnectingState();
}

/// Reconnected state, used when the connection is established after a disconnection.
class ReconnectedState extends DerivConnectionState {
  /// Initializes [ReconnectedState].
  const ReconnectedState();
}

/// Disconnecting state, used when the connection is being closed.
class DisconnectingState extends DerivConnectionState {
  /// Initializes [DisconnectingState].
  const DisconnectingState();
}

/// Disconnected state, used when the connection is closed.
class DisconnectedState extends DerivConnectionState {
  /// Initializes [DisconnectedState].
  const DisconnectedState({
    this.code,
    this.reason,
    this.error,
    this.stackTrace,
  });

  /// The close code.
  final int? code;

  /// The close reason.
  final String? reason;

  /// The error that caused the connection to close.
  final Object? error;

  /// The stack trace for the error that caused the connection to close.
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => <Object?>[code, reason];
}
