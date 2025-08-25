import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';

/// Use case for tracking a complete operation
class TrackOperation {
  /// Creates a new track operation use case
  const TrackOperation(this._repository);

  final PerformanceRepository _repository;

  /// Execute the use case
  Future<T> call<T>(
    String traceName,
    Future<T> Function() operation, {
    Map<String, String>? attributes,
  }) =>
      _repository.trackOperation(
        traceName,
        operation,
        attributes: attributes,
      );
}
