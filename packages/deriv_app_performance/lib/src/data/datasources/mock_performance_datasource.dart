import 'dart:developer';

import 'performance_datasource.dart';

/// A mock performance data source that doesn't actually track anything
///
/// This can be useful for development or testing environments where you don't
/// want to send performance data to a real monitoring service.
class MockPerformanceDataSource implements PerformanceDataSource {
  /// Creates a new mock performance data source
  MockPerformanceDataSource();

  /// Tracks whether collection is enabled
  bool _collectionEnabled = false;

  /// Tracks active traces (just their names)
  final Set<String> _activeTraces = <String>{};

  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    _collectionEnabled = enabled;
    log(
      'Mock Performance monitoring initialized with collection '
      '${enabled ? 'enabled' : 'disabled'}',
      name: 'deriv_app_performance',
      level: 800, // Info level
    );

    // Log any options that were provided
    if (options != null && options.isNotEmpty) {
      log(
        'Mock Performance options provided (for reference): '
        '${options.keys.join(', ')}',
        name: 'deriv_app_performance',
        level: 800, // Info level
      );
    }
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    _collectionEnabled = enabled;
    log(
      'Mock Performance collection ${enabled ? 'enabled' : 'disabled'}',
      name: 'deriv_app_performance',
      level: 800, // Info level
    );
  }

  @override
  Future<bool> isCollectionEnabled() async => _collectionEnabled;

  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (_activeTraces.contains(traceName)) {
      return;
    }

    _activeTraces.add(traceName);
  }

  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    if (!_activeTraces.contains(traceName)) {
      return;
    }

    _activeTraces.remove(traceName);
  }

  @override
  bool isTraceActive(String traceName) => _activeTraces.contains(traceName);
}
