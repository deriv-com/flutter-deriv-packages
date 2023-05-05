/// Injector exception class for handling errors.
class InjectorException implements Exception {
  /// Initializes a new instance of the [InjectorException] class.
  InjectorException({this.message});

  /// Exception message to be displayed.
  String? message;

  @override
  String toString() => '$runtimeType: $message';
}
