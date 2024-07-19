abstract interface class NetworkLogEmitter {
  /// A Stream of network logs.
  /// Logs are displayed in UI based on this stream and [NetworkPayload].
  Stream<NetworkLogPayload> get stream;
}

/// Network payload that is going out and coming in from the web socket.
class NetworkLogPayload {
  /// Initializes [NetworkLogPayload] instance.
  NetworkLogPayload({
    required this.method,
    required this.body,
    required this.direction,
    required this.timeStamp,
  });

  /// name of the api.
  final String method;

  /// content of the api.
  final Object body;

  /// direction of the api i.e SENT or RECEIVED.
  final LogDirection direction;

  /// time of the api.
  final int timeStamp;
}

/// Network payload that is going out and coming in from the web socket.
enum LogDirection {
  /// Outgoing log to external network.
  sent,

  /// Incoming log from external network to the app.
  received,
}
