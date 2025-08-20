import 'dart:developer';

import 'package:deriv_app_performance/deriv_app_performance.dart';

/// Custom Firebase performance provider implementation for the example app
///
/// This demonstrates how to create a custom provider that uses Firebase Performance
/// without directly depending on the package's internal FirebasePerformanceProvider.
class CustomFirebaseProvider implements PerformanceProvider {
  /// Creates a new custom Firebase performance provider
  const CustomFirebaseProvider();

  @override
  String get providerId => 'firebase';

  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) {
    return CustomFirebaseDataSource(options: options);
  }
}

/// Custom Firebase performance data source implementation for the example app
class CustomFirebaseDataSource implements PerformanceDataSource {
  /// Creates a new custom Firebase performance data source
  CustomFirebaseDataSource({this.options});

  /// Additional options for the data source
  final Map<String, dynamic>? options;

  /// Whether performance collection is enabled
  bool _collectionEnabled = true;

  /// Active traces
  final Map<String, bool> _activeTraces = {};

  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    // In a real implementation, you would initialize Firebase Performance here
    // For example:
    // await FirebasePerformance.instance.setPerformanceCollectionEnabled(enabled);

    _collectionEnabled = enabled;

    if (options != null || this.options != null) {
      log('Firebase options: ${options ?? this.options}');
      // Apply options to Firebase Performance if supported
    }
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    // In a real implementation, you would enable/disable Firebase Performance here
    // For example:
    // await FirebasePerformance.instance.setPerformanceCollectionEnabled(enabled);

    _collectionEnabled = enabled;
  }

  @override
  Future<bool> isCollectionEnabled() async {
    // In a real implementation, you would check if Firebase Performance is enabled
    // For example:
    // return await FirebasePerformance.instance.isPerformanceCollectionEnabled();

    return _collectionEnabled;
  }

  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (!_collectionEnabled) {
      return;
    }

    // In a real implementation, you would start a Firebase Performance trace
    // For example:
    // final trace = await FirebasePerformance.instance.newTrace(traceName);
    // await trace.start();
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     trace.putAttribute(entry.key, entry.value);
    //   }
    // }

    _activeTraces[traceName] = true;
  }

  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    if (!_collectionEnabled) {
      return;
    }

    if (!_activeTraces.containsKey(traceName)) {
      log('Warning: Trying to stop non-existent trace: $traceName');
      return;
    }

    // In a real implementation, you would stop a Firebase Performance trace
    // For example:
    // final trace = _traces[traceName];
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     trace.putAttribute(entry.key, entry.value);
    //   }
    // }
    // if (metrics != null) {
    //   for (final entry in metrics.entries) {
    //     trace.putMetric(entry.key, entry.value);
    //   }
    // }
    // await trace.stop();

    _activeTraces.remove(traceName);
  }

  @override
  bool isTraceActive(String traceName) {
    return _activeTraces.containsKey(traceName);
  }
}
