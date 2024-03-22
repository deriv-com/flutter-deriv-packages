/// Server exception
class ServerException implements Exception {
  /// Creates a [ServerException].
  ServerException({
    required this.errorCode,
    required this.message,
  });

  /// The error code.
  String errorCode;

  /// The error message.
  String message;
}
