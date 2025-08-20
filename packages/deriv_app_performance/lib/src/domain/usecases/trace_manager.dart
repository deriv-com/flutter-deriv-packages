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

  /// Stop a trace with the given name and optional attributes/metrics
  void stop(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    _repository.stopTrace(
      traceName,
      attributes: attributes,
      metrics: metrics,
    );
  }

  /// Start tracking page load performance
  void startPageLoad(String pageName, {String? fromPage}) {
    final Map<String, String> attributes = <String, String>{
      'page_name': pageName,
    };

    if (fromPage != null) {
      attributes['from_page'] = fromPage;
    }

    // Start the standard page load trace
    _repository
      ..startPageLoadTrace(pageName, fromPage: fromPage)

      // Also start a custom trace with these attributes for more detailed
      // tracking
      ..startTrace('${pageName}_load', attributes: attributes);
  }

  /// Stop tracking page load performance
  void stopPageLoad(String pageName, {bool success = true}) {
    // Stop the standard page load trace
    _repository
      ..stopPageLoadTrace(pageName, success: success)

      // Also stop the custom trace
      ..stopTrace('${pageName}_load',
          attributes: <String, String>{'success': success.toString()});
  }
}
