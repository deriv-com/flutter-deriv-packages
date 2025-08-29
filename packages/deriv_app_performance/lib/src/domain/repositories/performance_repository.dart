/// Repository interface for performance tracking operations
abstract class PerformanceRepository {
  /// Initialize the performance tracking system
  ///
  /// [enabled] - Whether performance collection should be enabled
  /// [options] - Additional configuration options for the performance tracking
  /// system
  Future<void> initialize({bool enabled = true, Map<String, dynamic>? options});

  /// Enable or disable performance collection
  ///
  /// [enabled] - Whether performance collection should be enabled
  Future<void> setCollectionEnabled(bool enabled);

  /// Check if performance collection is enabled
  Future<bool> isCollectionEnabled();

  /// Start a trace with the given name and optional attributes
  void startTrace(String traceName, {Map<String, String>? attributes});

  /// Stop a trace with the given name and optional attributes/metrics
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  });

  /// Track a complete operation synchronously
  Future<T> trackOperation<T>(
    String traceName,
    Future<T> Function() operation, {
    Map<String, String>? attributes,
  });

  /// Start a page load trace
  void startPageLoadTrace(String pageName, {String? fromPage});

  /// Stop a page load trace
  void stopPageLoadTrace(String pageName, {bool success = true});

  /// Check if a trace with the given name is currently active
  bool isTraceActive(String traceName);
}
