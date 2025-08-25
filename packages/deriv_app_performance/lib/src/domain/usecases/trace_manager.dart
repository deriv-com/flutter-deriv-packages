import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';

/// Use case for managing performance traces
class TraceManager {
  /// Constructor
  const TraceManager(this._repository);

  final PerformanceRepository _repository;

  /// Start a trace with the given name and optional attributes
  void start(String traceName, {Map<String, String>? attributes}) {
    _repository.startTrace(traceName, attributes: attributes);
  }

  /// Check if a trace with the given name is currently active
  bool isTraceActive(String traceName) {
    return _repository.isTraceActive(traceName);
  }

  /// Stop a trace with the given name and optional attributes/metrics
  ///
  /// If the trace doesn't exist, this method will silently return without
  /// generating warning logs
  void stop(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    // Only attempt to stop the trace if it's active
    if (isTraceActive(traceName)) {
      _repository.stopTrace(
        traceName,
        attributes: attributes,
        metrics: metrics,
      );
    }
  }

  /// Start tracking page load performance
  void startPageLoad(String pageName, {String? fromPage}) {
    // Start the page load trace
    _repository.startPageLoadTrace(pageName, fromPage: fromPage);
  }

  /// Stop tracking page load performance
  void stopPageLoad(String pageName, {bool success = true}) {
    // Stop the page load trace
    _repository.stopPageLoadTrace(pageName, success: success);
  }
}
