import 'package:deriv_logger/services/network_service.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/interfaces/call_history_provider.dart';

/// Class that is responsible to connect logger and network service
/// (BinaryAPI in this case).
class NetworkLogHandler {
  /// Factory constructor to return the same instance
  factory NetworkLogHandler(BinaryAPI api) {
    _instance ??= NetworkLogHandler._internal(api);
    return _instance!;
  }

  /// Private constructor with parameters
  NetworkLogHandler._internal(this.api);

  // Singleton instance
  static NetworkLogHandler? _instance;

  /// Web Socket api instance.
  final BinaryAPI api;

  /// Returns the [NetworkLogEmitter] for the call logs.
  NetworkLogEmitter get callLogEmitter => _CallLogImpl(api);

  /// Returns the [NetworkLogEmitter] for the subscription logs.
  NetworkLogEmitter get subscriptionLogEmitter => _SubscriptionLogImpl(api);
}

/// Implementation of the [NetworkLogEmitter] interface.
class _CallLogImpl implements NetworkLogEmitter {
  _CallLogImpl(
    this.api,
  );

  /// Web Socket api instance.
  final BinaryAPI api;

  @override
  Stream<NetworkLogPayload> get stream =>
      (api.callHistory as CallHistoryProvider).stream.map(
            (NetworkPayload event) => NetworkLogPayload(
              method: event.method,
              body: event.body,
              direction: event.direction == NetworkDirections.sent
                  ? LogDirection.sent
                  : LogDirection.received,
              timeStamp: event.timeStamp,
            ),
          );
}

/// Implementation of the [NetworkLogEmitter] interface.
class _SubscriptionLogImpl implements NetworkLogEmitter {
  ///
  _SubscriptionLogImpl(
    this.api,
  );

  /// Web Socket api instance.
  final BinaryAPI api;

  @override
  Stream<NetworkLogPayload> get stream =>
      (api.subscriptionHistory as CallHistoryProvider).stream.map(
            (NetworkPayload event) => NetworkLogPayload(
              method: event.method,
              body: event.body,
              direction: event.direction == NetworkDirections.sent
                  ? LogDirection.sent
                  : LogDirection.received,
              timeStamp: event.timeStamp,
            ),
          );
}
