import 'connection_state.dart';

/// Base class for connection controllers.
abstract class BaseConnectionController extends Stream<DerivConnectionState> {
  /// Gets the current connection state.
  DerivConnectionState get state;
}
