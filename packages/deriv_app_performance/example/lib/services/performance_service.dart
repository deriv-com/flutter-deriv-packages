import 'dart:async';
import 'package:deriv_app_performance/deriv_app_performance.dart';
import 'package:deriv_app_performance_example/models/performance_metric.dart';
import 'package:deriv_app_performance_example/models/trace_event.dart';
import 'package:deriv_app_performance_example/custom_providers/firebase_provider.dart';

/// App-specific custom trace names
class CustomTraces {
  /// Private constructor to prevent instantiation
  CustomTraces._();

  /// Trace for user authentication flow
  static const String userAuthentication = 'user_authentication';

  /// Trace for data loading operations
  static const String dataLoading = 'data_loading';

  /// Trace for form submission
  static const String formSubmission = 'form_submission';

  /// Trace for image processing
  static const String imageProcessing = 'image_processing';

  /// Trace for search operations
  static const String search = 'search';
}

/// A service that wraps the AppPerformance instance and provides app-specific
/// custom trace names and helper methods.
class PerformanceService {
  /// Private constructor for singleton pattern
  PerformanceService._();

  /// Singleton instance
  static final PerformanceService _instance = PerformanceService._();

  /// Get the singleton instance
  static PerformanceService get instance => _instance;

  /// Current provider
  PerformanceProvider _currentProvider = const CustomFirebaseProvider();

  /// Get the current provider
  PerformanceProvider get currentProvider => _currentProvider;

  // Store active traces for visualization
  final Map<String, _ActiveTrace> _activeTraces = {};

  // Store completed metrics for visualization
  final List<PerformanceMetric> _metrics = [];

  // Store completed trace events for visualization
  final List<TraceEvent> _traceEvents = [];

  // Stream controllers for real-time updates
  final _metricsController =
      StreamController<List<PerformanceMetric>>.broadcast();
  final _traceEventsController = StreamController<List<TraceEvent>>.broadcast();

  /// Get a stream of metrics updates
  Stream<List<PerformanceMetric>> get metricsStream =>
      _metricsController.stream;

  /// Get a stream of trace events updates
  Stream<List<TraceEvent>> get traceEventsStream =>
      _traceEventsController.stream;

  /// Get the current metrics
  List<PerformanceMetric> get metrics => List.unmodifiable(_metrics);

  /// Get the current trace events
  List<TraceEvent> get traceEvents => List.unmodifiable(_traceEvents);

  /// Initialize the performance monitoring service
  Future<bool> init({
    List<PerformanceProvider>? providers,
    bool enableFirebase = true,
  }) async {
    if (providers != null && providers.isNotEmpty) {
      _currentProvider = providers.first;
    }
    return AppPerformance.instance.init(
      providers: providers ?? <PerformanceProvider>[],
      enableFirebase: enableFirebase,
    );
  }

  /// Check if performance collection is enabled
  Future<bool> isCollectionEnabled() async =>
      AppPerformance.instance.isCollectionEnabled();

  /// Enable or disable performance collection
  Future<bool> setCollectionEnabled(bool enabled) async =>
      AppPerformance.instance.setCollectionEnabled(enabled);

  /// Start a custom trace with the given name
  void startCustomTrace(
    String traceName, {
    Map<String, String>? attributes,
  }) {
    // Start the trace in the performance monitoring system
    AppPerformance.instance.startTracing(
      traceName: traceName,
      attributes: attributes,
    );

    // Store the trace for local visualization
    _activeTraces[traceName] = _ActiveTrace(
      name: traceName,
      startTime: DateTime.now(),
      attributes: attributes ?? {},
    );
  }

  /// Stop a custom trace with the given name
  void stopCustomTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    // Stop the trace in the performance monitoring system
    AppPerformance.instance.stopTracing(
      traceName: traceName,
      attributes: attributes,
      metrics: metrics,
    );

    // Get the active trace
    final activeTrace = _activeTraces[traceName];
    if (activeTrace != null) {
      // Remove from active traces
      _activeTraces.remove(traceName);

      // Create end time
      final endTime = DateTime.now();

      // Merge attributes
      final mergedAttributes = Map<String, String>.from(activeTrace.attributes);
      if (attributes != null) {
        mergedAttributes.addAll(attributes);
      }

      // Create a trace event
      final traceEvent = TraceEvent(
        name: traceName,
        startTime: activeTrace.startTime,
        endTime: endTime,
        attributes: mergedAttributes,
        metrics: metrics ?? {},
      );

      // Add to the list of trace events
      _traceEvents.add(traceEvent);

      // Create a performance metric
      final durationMs =
          endTime.difference(activeTrace.startTime).inMilliseconds;
      final metric = PerformanceMetric(
        name: traceName,
        value: durationMs,
        unit: 'ms',
        timestamp: endTime,
      );

      // Add to the list of metrics
      _metrics.add(metric);

      // Notify listeners
      _metricsController.add(_metrics);
      _traceEventsController.add(_traceEvents);
    }
  }

  /// Track a complete operation with a single method call
  Future<T> trackCustomOperation<T>({
    required String traceName,
    required Future<T> Function() operation,
    Map<String, String>? attributes,
  }) async =>
      AppPerformance.instance.trackOperation<T>(
        traceName: traceName,
        operation: operation,
        attributes: attributes,
      );

  /// Track data loading operation
  Future<T> trackDataLoading<T>({
    required String dataType,
    required Future<T> Function() loadOperation,
    Map<String, String>? additionalAttributes,
  }) async {
    final Map<String, String> attributes = <String, String>{
      'data_type': dataType,
    };

    if (additionalAttributes != null) {
      attributes.addAll(additionalAttributes);
    }

    return trackCustomOperation<T>(
      traceName: CustomTraces.dataLoading,
      operation: loadOperation,
      attributes: attributes,
    );
  }

  /// Start tracking page load time
  void startPageLoadTrace(String pageName, {String? fromPage}) {
    // Start the trace in the performance monitoring system
    AppPerformance.instance.startPageLoadTrace(pageName, fromPage: fromPage);

    // Store the trace for local visualization
    final attributes = <String, String>{};
    if (fromPage != null) {
      attributes['from_page'] = fromPage;
    }

    _activeTraces[pageName] = _ActiveTrace(
      name: pageName,
      startTime: DateTime.now(),
      attributes: attributes,
    );
  }

  /// Stop tracking page load time
  void stopPageLoadTrace(String pageName) {
    // Stop the trace in the performance monitoring system
    AppPerformance.instance.stopPageLoadTrace(pageName);

    // Get the active trace
    final activeTrace = _activeTraces[pageName];
    if (activeTrace != null) {
      // Remove from active traces
      _activeTraces.remove(pageName);

      // Create end time
      final endTime = DateTime.now();

      // Create a trace event
      final traceEvent = TraceEvent(
        name: BasePerformanceMetrics.pageNavigation,
        startTime: activeTrace.startTime,
        endTime: endTime,
        attributes: {
          ...activeTrace.attributes,
          'page_name': pageName,
        },
        metrics: {},
      );

      // Add to the list of trace events
      _traceEvents.add(traceEvent);

      // Create a performance metric
      final durationMs =
          endTime.difference(activeTrace.startTime).inMilliseconds;
      final metric = PerformanceMetric(
        name: BasePerformanceMetrics.pageNavigation,
        value: durationMs,
        unit: 'ms',
        timestamp: endTime,
        description: 'Page: $pageName',
      );

      // Add to the list of metrics
      _metrics.add(metric);

      // Notify listeners
      _metricsController.add(_metrics);
      _traceEventsController.add(_traceEvents);
    }
  }

  /// Track a specific user interaction
  void trackUserInteraction(String interactionType, String screenName) {
    AppPerformance.instance.startTracing(
      traceName: BasePerformanceMetrics.userInteraction,
      attributes: <String, String>{
        'interaction_type': interactionType,
        'screen': screenName,
      },
    );

    // Simulate the interaction duration
    Future.delayed(const Duration(milliseconds: 500), () {
      AppPerformance.instance.stopTracing(
        traceName: BasePerformanceMetrics.userInteraction,
        attributes: <String, String>{'success': 'true'},
        metrics: <String, int>{'interaction_time_ms': 500},
      );
    });
  }

  /// Track a network request
  Future<T> trackNetworkRequest<T>({
    required String endpoint,
    required Future<T> Function() request,
    Map<String, String>? additionalAttributes,
  }) async {
    final Map<String, String> attributes = <String, String>{
      'endpoint': endpoint,
      'method': 'GET',
    };

    if (additionalAttributes != null) {
      attributes.addAll(additionalAttributes);
    }

    // Start time for local tracking
    final startTime = DateTime.now();

    try {
      // Track the operation using the performance monitoring system
      final result = await AppPerformance.instance.trackOperation<T>(
        traceName: BasePerformanceMetrics.apiCall,
        operation: request,
        attributes: attributes,
      );

      // End time for local tracking
      final endTime = DateTime.now();

      // Create a trace event
      final traceEvent = TraceEvent(
        name: BasePerformanceMetrics.apiCall,
        startTime: startTime,
        endTime: endTime,
        attributes: attributes,
        metrics: {},
      );

      // Add to the list of trace events
      _traceEvents.add(traceEvent);

      // Create a performance metric
      final durationMs = endTime.difference(startTime).inMilliseconds;
      final metric = PerformanceMetric(
        name: BasePerformanceMetrics.apiCall,
        value: durationMs,
        unit: 'ms',
        timestamp: endTime,
        description: 'Endpoint: $endpoint',
      );

      // Add to the list of metrics
      _metrics.add(metric);

      // Notify listeners
      _metricsController.add(_metrics);
      _traceEventsController.add(_traceEvents);

      return result;
    } catch (e) {
      // End time for local tracking
      final endTime = DateTime.now();

      // Create a trace event for the failed request
      final traceEvent = TraceEvent(
        name: BasePerformanceMetrics.apiCall,
        startTime: startTime,
        endTime: endTime,
        attributes: {
          ...attributes,
          'error': e.toString(),
          'success': 'false',
        },
        metrics: {},
      );

      // Add to the list of trace events
      _traceEvents.add(traceEvent);

      // Create a performance metric
      final durationMs = endTime.difference(startTime).inMilliseconds;
      final metric = PerformanceMetric(
        name: BasePerformanceMetrics.apiCall,
        value: durationMs,
        unit: 'ms',
        timestamp: endTime,
        description: 'Failed: $endpoint',
      );

      // Add to the list of metrics
      _metrics.add(metric);

      // Notify listeners
      _metricsController.add(_metrics);
      _traceEventsController.add(_traceEvents);

      rethrow;
    }
  }

  /// Clear all stored metrics and trace events
  void clearMetrics() {
    _metrics.clear();
    _traceEvents.clear();
    _metricsController.add(_metrics);
    _traceEventsController.add(_traceEvents);
  }
}

/// A class to track active traces
class _ActiveTrace {
  final String name;
  final DateTime startTime;
  final Map<String, String> attributes;

  _ActiveTrace({
    required this.name,
    required this.startTime,
    required this.attributes,
  });
}
