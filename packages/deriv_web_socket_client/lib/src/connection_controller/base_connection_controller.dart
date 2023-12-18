import 'connection_state.dart';

/// Base class for connection controllers.
abstract class BaseConnectionController extends Stream<ConnectionState> {
  /// Gets the current connection state.
  ConnectionState get state;
}
