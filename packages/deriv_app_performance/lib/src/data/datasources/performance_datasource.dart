/// Abstract interface for performance monitoring data sources
abstract class PerformanceDataSource {
  /// Initialize the performance monitoring system
  ///
  /// [enabled] - Whether performance collection should be enabled
  /// [options] - Additional configuration options for the performance tracking
  /// system
  Future<void> initialize({bool enabled = true, Map<String, dynamic>? options});

  /// Enable or disable performance collection
  Future<void> setCollectionEnabled(bool enabled);

  /// Check if performance collection is enabled
  Future<bool> isCollectionEnabled();

  /// Start a trace with the given name
  void startTrace(String traceName, {Map<String, String>? attributes});

  /// Stop a trace with the given name
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  });

  /// Check if a trace is active
  bool isTraceActive(String traceName);
}
