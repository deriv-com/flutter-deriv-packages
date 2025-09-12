import 'dart:developer';

import 'package:deriv_app_performance/deriv_app_performance.dart';

/// Example implementation of a custom performance provider
///
/// This is a sample implementation to demonstrate how client apps can
/// create their own performance providers. In a real implementation,
/// you would integrate with the actual third-party SDK.
class SampleCustomProvider implements PerformanceProvider {
  /// Creates a new sample custom performance provider
  ///
  /// [apiKey] - The API key
  /// [applicationId] - The application ID
  const SampleCustomProvider({
    required this.apiKey,
    required this.applicationId,
  });

  /// The API key
  final String apiKey;

  /// The application ID
  final String applicationId;

  @override
  String get providerId => 'sample_custom';

  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) {
    return SampleCustomDataSource(
      apiKey: apiKey,
      applicationId: applicationId,
      options: options,
    );
  }
}

/// Example implementation of a custom performance data source
///
/// This is a sample implementation to demonstrate how client apps can
/// create their own performance data sources. In a real implementation,
/// you would integrate with the actual third-party SDK.
class SampleCustomDataSource implements PerformanceDataSource {
  /// Creates a new sample custom performance data source
  ///
  /// [apiKey] - The API key
  /// [applicationId] - The application ID
  /// [options] - Additional options for the data source
  SampleCustomDataSource({
    required this.apiKey,
    required this.applicationId,
    this.options,
  });

  /// The API key
  final String apiKey;

  /// The application ID
  final String applicationId;

  /// Additional options for the data source
  final Map<String, dynamic>? options;

  /// Whether performance collection is enabled
  bool _collectionEnabled = true;

  /// Active traces
  final Map<String, _SampleCustomTrace> _activeTraces = {};

  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    log('Initializing sample custom performance monitoring with API key: $apiKey, Application ID: $applicationId');
    _collectionEnabled = enabled;

    // In a real implementation, you would initialize the third-party SDK here
    // For example:
    // await ThirdPartySDK.instance.initialize(apiKey: apiKey, applicationId: applicationId);
    // await ThirdPartySDK.instance.setEnabled(enabled);

    if (options != null) {
      log('Sample custom options: $options');
    }
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    log('Setting sample custom collection enabled: $enabled');
    _collectionEnabled = enabled;

    // In a real implementation, you would enable/disable the third-party SDK here
    // For example:
    // await ThirdPartySDK.instance.setEnabled(enabled);
  }

  @override
  Future<bool> isCollectionEnabled() async {
    return _collectionEnabled;
  }

  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    if (!_collectionEnabled) {
      return;
    }

    log('Starting sample custom trace: $traceName with attributes: $attributes');

    // In a real implementation, you would start a trace in the third-party SDK here
    // For example:
    // final trace = await ThirdPartySDK.instance.startTrace(traceName);
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     trace.setAttribute(entry.key, entry.value);
    //   }
    // }

    _activeTraces[traceName] = _SampleCustomTrace(
      name: traceName,
      startTime: DateTime.now(),
      attributes: attributes ?? {},
    );
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

    final trace = _activeTraces[traceName];
    if (trace == null) {
      log('Warning: Trying to stop non-existent trace: $traceName');
      return;
    }

    log('Stopping sample custom trace: $traceName with attributes: $attributes, metrics: $metrics');

    // In a real implementation, you would stop the trace in the third-party SDK here
    // For example:
    // final trace = _activeTraces[traceName];
    // if (attributes != null) {
    //   for (final entry in attributes.entries) {
    //     trace.setAttribute(entry.key, entry.value);
    //   }
    // }
    // if (metrics != null) {
    //   for (final entry in metrics.entries) {
    //     trace.setMetric(entry.key, entry.value);
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

/// A class to track active sample custom traces
class _SampleCustomTrace {
  /// Creates a new sample custom trace
  _SampleCustomTrace({
    required this.name,
    required this.startTime,
    required this.attributes,
  });

  /// The trace name
  final String name;

  /// The trace start time
  final DateTime startTime;

  /// The trace attributes
  final Map<String, String> attributes;
}
