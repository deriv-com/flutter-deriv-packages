import 'dart:developer';
import 'package:firebase_performance/firebase_performance.dart';

import 'performance_datasource.dart';

/// Data source for Firebase Performance Monitoring
class FirebasePerformanceDataSource implements PerformanceDataSource {
  /// Creates a new Firebase Performance data source
  ///
  /// [firebasePerformance] - Optional Firebase Performance instance for testing
  /// [options] - Optional configuration options for future use
  FirebasePerformanceDataSource({
    FirebasePerformance? firebasePerformance,
    this.options,
  }) : _firebasePerformance =
            firebasePerformance ?? FirebasePerformance.instance;

  final FirebasePerformance _firebasePerformance;
  final Map<String, Trace> _activeTraces = <String, Trace>{};

  /// Configuration options for future use
  final Map<String, dynamic>? options;

  /// Initialize Firebase Performance
  ///
  /// [enabled] - Whether performance collection should be enabled
  /// [options] - Additional configuration options for the performance tracking
  /// system
  ///
  /// Note: The Firebase Performance SDK doesn't currently expose configuration
  /// options directly in the public API. Any options passed here are logged
  /// but not applied.
  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    try {
      // Enable or disable collection based on configuration
      await _firebasePerformance.setPerformanceCollectionEnabled(enabled);

      // Merge constructor options with initialization options
      final Map<String, dynamic> mergedOptions = <String, dynamic>{};
      if (this.options != null) {
        mergedOptions.addAll(this.options!);
      }
      if (options != null) {
        mergedOptions.addAll(options);
      }

      // FUTURE: Apply Firebase-specific options here when they become available
      // in the SDK
      // For example:
      // if (mergedOptions.containsKey('someOption')) {
      //   await _firebasePerformance.setOption(mergedOptions['someOption']);
      // }

      // Log any options that were provided
      if (mergedOptions.isNotEmpty) {
        log(
          'Firebase Performance options provided but not applied '
          '(SDK limitations): ${mergedOptions.keys.join(', ')}',
          name: 'deriv_app_performance',
          level: 800, // Info level
        );
      }

      // Log initialization success
      log(
        'Firebase Performance monitoring initialized with collection '
        '${enabled ? 'enabled' : 'disabled'}',
        name: 'deriv_app_performance',
        level: 800, // Info level
      );
    } catch (e, stackTrace) {
      log(
        'Error initializing Firebase Performance: $e',
        name: 'deriv_app_performance',
        error: e,
        stackTrace: stackTrace,
        level: 1000, // Error level
      );
      rethrow;
    }
  }

  /// Enable or disable performance collection
  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    try {
      await _firebasePerformance.setPerformanceCollectionEnabled(enabled);
      log(
        'Firebase Performance collection ${enabled ? 'enabled' : 'disabled'}',
        name: 'deriv_app_performance',
        level: 800, // Info level
      );
    } catch (e, stackTrace) {
      log(
        'Error setting performance collection: $e',
        name: 'deriv_app_performance',
        error: e,
        stackTrace: stackTrace,
        level: 1000, // Error level
      );
      rethrow;
    }
  }

  /// Check if performance collection is enabled
  @override
  Future<bool> isCollectionEnabled() async {
    try {
      return await _firebasePerformance.isPerformanceCollectionEnabled();
    } catch (e, stackTrace) {
      log(
        'Error checking if performance collection is enabled: $e',
        name: 'deriv_app_performance',
        error: e,
        stackTrace: stackTrace,
        level: 1000, // Error level
      );
      rethrow;
    }
  }

  /// Start a trace with the given name
  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (_activeTraces.containsKey(traceName)) {
      log(
        'Warning: Trace $traceName is already active',
        name: 'deriv_app_performance',
        level: 900, // Warning level
      );
      return;
    }

    final Trace trace = _firebasePerformance.newTrace(traceName);

    // Add attributes if provided
    attributes?.forEach((String key, String value) {
      trace.putAttribute(key, value);
    });

    trace.start();
    _activeTraces[traceName] = trace;

    log(
      'Started trace: $traceName with attributes: $attributes',
      name: 'deriv_app_performance',
      level: 800, // Info level
    );
  }

  /// Stop a trace with the given name
  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    final Trace? trace = _activeTraces[traceName];
    if (trace == null) {
      log(
        'Warning: Trying to stop non-existent trace: $traceName',
        name: 'deriv_app_performance',
        level: 900, // Warning level
      );
      return;
    }

    // Add additional attributes if provided
    attributes?.forEach((String key, String value) {
      trace.putAttribute(key, value);
    });

    // Add metrics if provided
    metrics?.forEach((String key, int value) {
      trace.incrementMetric(key, value);
    });

    trace.stop();
    _activeTraces.remove(traceName);

    log(
      'Stopped trace: $traceName with attributes: $attributes, '
      'metrics: $metrics',
      name: 'deriv_app_performance',
      level: 800, // Info level
    );
  }

  /// Check if a trace is active
  @override
  bool isTraceActive(String traceName) => _activeTraces.containsKey(traceName);
}
