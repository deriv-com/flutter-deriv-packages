import 'dart:developer';

import 'package:deriv_app_performance/src/data/datasources/composite_performance_datasource.dart'
    show ErrorHandler;
import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';
import 'package:deriv_app_performance/src/data/factories/performance_provider_factory.dart';
import 'package:deriv_app_performance/src/data/factories/repository_factory.dart';
import 'package:deriv_app_performance/src/data/providers/performance_provider.dart';
import 'package:deriv_app_performance/src/domain/entities/base_performance_metrics.dart';
import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/domain/usecases/performance_setup.dart';
import 'package:deriv_app_performance/src/domain/usecases/trace_manager.dart';
import 'package:deriv_app_performance/src/domain/usecases/track_operation.dart';
import 'package:meta/meta.dart';

/// Main entry point for the app performance tracking system
class AppPerformance {
  /// Private constructor
  AppPerformance._internal();

  /// Get the singleton instance
  static final AppPerformance instance = AppPerformance._internal();

  PerformanceDataSource? _dataSource;
  PerformanceRepository? _repository;
  PerformanceSetup? _performanceSetup;
  TraceManager? _traceManager;
  TrackOperation? _trackOperation;

  Map<String, Map<String, dynamic>>? _providerOptions;
  ErrorHandler? _errorHandler;

  bool _isInitialized = false;
  bool _hasInitializationError = false;
  String _initializationErrorMessage = '';

  /// Initialize the performance tracking system
  ///
  /// [providers] - The list of performance monitoring providers to use
  /// [enableFirebase] - Whether to include Firebase Performance Monitoring
  /// (defaults to true)
  /// [providerOptions] - Optional map of provider-specific options
  /// [errorHandler] - Optional callback for handling errors in the composite
  /// data source
  /// [enabled] - Whether performance collection should be enabled
  /// [options] - Additional configuration options for the performance
  /// tracking system
  ///
  /// Returns true if initialization was successful, false otherwise
  Future<bool> init({
    List<PerformanceProvider> providers = const <PerformanceProvider>[],
    bool enableFirebase = true,
    Map<String, Map<String, dynamic>>? providerOptions,
    ErrorHandler? errorHandler,
    bool enabled = true,
    Map<String, dynamic>? options,
  }) async {
    // Reset any previous initialization
    _reset();

    // Store configuration
    _providerOptions = providerOptions;
    _errorHandler = errorHandler;

    try {
      // Create the data source
      _dataSource = PerformanceProviderFactory.createDataSource(
        providers,
        providerOptions: _providerOptions,
        errorHandler: _errorHandler,
        enableFirebase: enableFirebase,
      );

      // Create the repository
      _repository = RepositoryFactory.create(dataSource: _dataSource);

      // Create the use cases
      _performanceSetup = PerformanceSetup(_repository!);
      _traceManager = TraceManager(_repository!);
      _trackOperation = TrackOperation(_repository!);

      // Initialize the performance monitoring
      final bool success = await _performanceSetup!.initialize(
        enabled: enabled,
        options: options,
      );

      if (success) {
        _isInitialized = true;
      }

      return success;
    } catch (e) {
      _hasInitializationError = true;
      _initializationErrorMessage = 'Failed to initialize AppPerformance: $e';
      log(_initializationErrorMessage,
          name: 'deriv_app_performance', level: 1000); // Error level
      return false;
    }
  }

  /// Reset the instance to its initial state
  void _reset() {
    _isInitialized = false;
    _hasInitializationError = false;
    _initializationErrorMessage = '';
    _dataSource = null;
    _repository = null;
    _performanceSetup = null;
    _traceManager = null;
    _trackOperation = null;
  }

  /// For testing purposes only - resets the singleton instance and optionally
  /// sets test dependencies
  ///
  /// This allows tests to inject mock dependencies and reset the state between
  /// tests.
  @visibleForTesting
  static void resetForTesting({
    PerformanceDataSource? dataSource,
    PerformanceRepository? repository,
    PerformanceSetup? performanceSetup,
    TraceManager? traceManager,
    TrackOperation? trackOperation,
  }) {
    final AppPerformance app = AppPerformance.instance.._reset();

    // Set test dependencies if provided
    if (dataSource != null) {
      app._dataSource = dataSource;
    }

    if (repository != null) {
      app._repository = repository;
    }

    if (performanceSetup != null) {
      app._performanceSetup = performanceSetup;
    }

    if (traceManager != null) {
      app._traceManager = traceManager;
    }

    if (trackOperation != null) {
      app._trackOperation = trackOperation;
    }

    // Mark as initialized if dependencies are provided
    if (dataSource != null ||
        repository != null ||
        performanceSetup != null ||
        traceManager != null ||
        trackOperation != null) {
      app._isInitialized = true;
    }

    log('AppPerformance reset for testing',
        name: 'deriv_app_performance', level: 800); // Info level
  }

  /// Check if the performance tracking system is initialized
  bool get isInitialized => _isInitialized;

  /// Get the initialization error message if any
  String get initializationError => _initializationErrorMessage;

  /// Check if there was an initialization error
  bool get hasInitializationError => _hasInitializationError;

  /// Enable or disable performance collection
  ///
  /// [enabled] - Whether performance collection should be enabled
  ///
  /// Returns true if the operation was successful, false otherwise
  Future<bool> setCollectionEnabled(bool enabled) async {
    try {
      if (_performanceSetup == null) {
        log(
            'Cannot set collection enabled: AppPerformance has not been '
            'initialized',
            name: 'deriv_app_performance',
            level: 1000); // Error level
        return false;
      }

      if (_hasInitializationError) {
        log('Cannot set collection enabled: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        return false;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Attempting to '
            'set collection enabled anyway.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      return await _performanceSetup!.setCollectionEnabled(enabled);
    } catch (e, stackTrace) {
      log('Error setting collection enabled: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
      return false;
    }
  }

  /// Check if performance collection is enabled
  ///
  /// Returns true if performance collection is enabled, false otherwise
  Future<bool> isCollectionEnabled() async {
    try {
      if (_performanceSetup == null) {
        log(
            'Cannot check if collection is enabled: AppPerformance has not '
            'been initialized',
            name: 'deriv_app_performance',
            level: 1000); // Error level
        return false;
      }

      if (_hasInitializationError) {
        log(
            'Cannot check if collection is enabled:'
            ' $_initializationErrorMessage',
            name: 'deriv_app_performance',
            level: 1000); // Error level
        return false;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Attempting to '
            'check collection status anyway.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      return await _performanceSetup!.isCollectionEnabled();
    } catch (e, stackTrace) {
      log('Error checking if collection is enabled: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
      return false;
    }
  }

  /// Start a trace with the given name
  void startTracing(
      {required String traceName, Map<String, String>? attributes}) {
    try {
      if (_traceManager == null) {
        log('Cannot start tracing: AppPerformance has not been initialized',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (_hasInitializationError) {
        log('Cannot start tracing: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Tracing may '
            'not work correctly.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      _traceManager!.start(traceName, attributes: attributes);
    } catch (e, stackTrace) {
      log('Error starting trace $traceName: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }

  /// Stop a trace with the given name
  void stopTracing({
    required String traceName,
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    try {
      if (_traceManager == null) {
        log('Cannot stop tracing: AppPerformance has not been initialized',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (_hasInitializationError) {
        log('Cannot stop tracing: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Tracing may '
            'not work correctly.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      _traceManager!.stop(traceName, attributes: attributes, metrics: metrics);
    } catch (e, stackTrace) {
      log('Error stopping trace $traceName: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }

  /// Track a complete operation
  Future<T> trackOperation<T>({
    required String traceName,
    required Future<T> Function() operation,
    Map<String, String>? attributes,
  }) async {
    try {
      if (_trackOperation == null) {
        log('Cannot track operation: AppPerformance has not been initialized',
            name: 'deriv_app_performance', level: 1000); // Error level
        // Fall back to just executing the operation without tracking
        return await operation();
      }

      if (_hasInitializationError) {
        log('Cannot track operation: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        // Fall back to just executing the operation without tracking
        return await operation();
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Operation '
            'tracking may not work correctly.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      return await _trackOperation!(traceName, operation,
          attributes: attributes);
    } catch (e, stackTrace) {
      log('Error tracking operation $traceName: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
      // Fall back to just executing the operation without tracking
      return operation();
    }
  }

  /// Start tracking page load
  void startPageLoadTrace(String pageName, {String? fromPage}) {
    try {
      if (_traceManager == null) {
        log(
            'Cannot start page load trace: AppPerformance has not been '
            'initialized',
            name: 'deriv_app_performance',
            level: 1000); // Error level
        return;
      }

      if (_hasInitializationError) {
        log('Cannot start page load trace: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Page load '
            'tracing may not work correctly.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      _traceManager!.startPageLoad(pageName, fromPage: fromPage);
    } catch (e, stackTrace) {
      log('Error starting page load trace for $pageName: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }

  /// Stop tracking page load
  void stopPageLoadTrace(String pageName, {bool success = true}) {
    try {
      if (_traceManager == null) {
        log(
            'Cannot stop page load trace: AppPerformance has not been '
            'initialized',
            name: 'deriv_app_performance',
            level: 1000); // Error level
        return;
      }

      if (_hasInitializationError) {
        log('Cannot stop page load trace: $_initializationErrorMessage',
            name: 'deriv_app_performance', level: 1000); // Error level
        return;
      }

      if (!_isInitialized) {
        log(
            'Warning: AppPerformance.init() has not been called. Page load '
            'tracing may not work correctly.',
            name: 'deriv_app_performance',
            level: 900); // Warning level
      }

      _traceManager!.stopPageLoad(pageName, success: success);
    } catch (e, stackTrace) {
      log('Error stopping page load trace for $pageName: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }

  /// Track connection recovery
  void trackConnectionRecovery(String connectionType) {
    try {
      startTracing(
        traceName: BasePerformanceMetrics.connectionRecovery,
        attributes: <String, String>{'connection_type': connectionType},
      );
    } catch (e, stackTrace) {
      log('Error tracking connection recovery: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }

  /// Complete connection recovery tracking
  void completeConnectionRecovery({
    bool success = true,
    int? duration,
  }) {
    try {
      final Map<String, int> metrics = <String, int>{};
      if (duration != null) {
        metrics['outage_duration_ms'] = duration;
      }

      stopTracing(
        traceName: BasePerformanceMetrics.connectionRecovery,
        attributes: <String, String>{'success': success.toString()},
        metrics: metrics,
      );
    } catch (e, stackTrace) {
      log('Error completing connection recovery tracking: $e',
          name: 'deriv_app_performance',
          error: e,
          stackTrace: stackTrace,
          level: 1000); // Error level
    }
  }
}
