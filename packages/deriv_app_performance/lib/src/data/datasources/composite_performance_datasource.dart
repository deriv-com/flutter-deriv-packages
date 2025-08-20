import 'dart:async';
import 'dart:developer';
import 'performance_datasource.dart';

/// Callback for handling errors in the composite data source
typedef ErrorHandler = void Function(
    String operation, Object error, StackTrace? stackTrace);

/// A composite performance data source that delegates to multiple underlying
/// data sources
///
/// This allows tracking performance metrics with multiple providers
/// simultaneously.
class CompositePerformanceDataSource implements PerformanceDataSource {
  /// Creates a new composite performance data source
  ///
  /// [dataSources] - The list of data sources to delegate to
  /// [errorHandler] - Optional callback for handling errors
  CompositePerformanceDataSource(
    this._dataSources, {
    this.errorHandler,
  });

  final List<PerformanceDataSource> _dataSources;

  /// Optional error handler for reporting errors
  final ErrorHandler? errorHandler;

  /// Report an error to the error handler if one is provided
  void _reportError(String operation, Object error, [StackTrace? stackTrace]) {
    log('Error in CompositePerformanceDataSource.$operation: $error',
        name: 'deriv_app_performance',
        error: error,
        stackTrace: stackTrace,
        level: 1000);

    if (errorHandler != null) {
      errorHandler!(operation, error, stackTrace);
    }
  }

  /// Execute an async operation on all data sources with error handling
  /// Returns a value of type T
  Future<T> _executeAsyncWithErrorHandling<T>(String operation,
      Future<T> Function(PerformanceDataSource) action, T defaultValue,
      {bool returnTrueIfAnyTrue = false}) async {
    final List<Future<T>> futures = <Future<T>>[];
    final List<T> results = <T>[];
    final List<Object> errors = <Object>[];

    for (final PerformanceDataSource dataSource in _dataSources) {
      futures.add(Future<T>.microtask(() async {
        try {
          final T result = await action(dataSource);
          results.add(result);
          return result;
        } catch (e, stackTrace) {
          _reportError(operation, e, stackTrace);
          errors.add(e);
          return defaultValue;
        }
      }));
    }

    // Wait for all operations to complete
    await Future.wait(futures);

    // If all data sources failed, throw an error
    if (errors.length == _dataSources.length) {
      throw Exception(
          'Failed to execute $operation on all data sources: $errors');
    }

    // For boolean operations, return true if any result is true
    if (returnTrueIfAnyTrue && T == bool && results.contains(true)) {
      return true as T;
    }

    // Return the default value if no results, otherwise the first result
    return results.isEmpty ? defaultValue : results.first;
  }

  /// Execute a sync operation on all data sources with error handling
  void _executeSyncWithErrorHandling(
    String operation,
    void Function(PerformanceDataSource) action,
  ) {
    final List<Object> errors = <Object>[];

    for (final PerformanceDataSource dataSource in _dataSources) {
      try {
        action(dataSource);
      } catch (e, stackTrace) {
        _reportError(operation, e, stackTrace);
        errors.add(e);
      }
    }

    // If all data sources failed, throw an error
    if (errors.length == _dataSources.length) {
      throw Exception(
          'Failed to execute $operation on all data sources: $errors');
    }
  }

  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    await _executeAsyncWithErrorHandling<void>(
      'initialize',
      (PerformanceDataSource dataSource) =>
          dataSource.initialize(enabled: enabled, options: options),
      null,
    );
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    await _executeAsyncWithErrorHandling<void>(
      'setCollectionEnabled',
      (PerformanceDataSource dataSource) =>
          dataSource.setCollectionEnabled(enabled),
      null,
    );
  }

  @override
  Future<bool> isCollectionEnabled() async =>
      _executeAsyncWithErrorHandling<bool>(
        'isCollectionEnabled',
        (PerformanceDataSource dataSource) => dataSource.isCollectionEnabled(),
        false,
        returnTrueIfAnyTrue: true,
      );

  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    _executeSyncWithErrorHandling(
      'startTrace',
      (PerformanceDataSource dataSource) =>
          dataSource.startTrace(traceName, attributes: attributes),
    );
  }

  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    _executeSyncWithErrorHandling(
      'stopTrace',
      (PerformanceDataSource dataSource) => dataSource.stopTrace(
        traceName,
        attributes: attributes,
        metrics: metrics,
      ),
    );
  }

  @override
  bool isTraceActive(String traceName) {
    final List<bool> results = <bool>[];
    final List<Object> errors = <Object>[];

    for (final PerformanceDataSource dataSource in _dataSources) {
      try {
        final bool isActive = dataSource.isTraceActive(traceName);
        results.add(isActive);
        if (isActive) {
          return true;
        }
      } catch (e, stackTrace) {
        _reportError('isTraceActive', e, stackTrace);
        errors.add(e);
      }
    }

    // If all data sources failed, throw an error
    if (errors.length == _dataSources.length) {
      throw Exception(
          'Failed to check if trace is active on all data sources: $errors');
    }

    return false;
  }
}
