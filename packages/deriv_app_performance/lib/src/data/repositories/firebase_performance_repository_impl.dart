import 'dart:developer';

import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';
import 'package:deriv_app_performance/src/data/datasources/firebase_performance_datasource.dart';

/// Implementation of the performance repository using Firebase Performance
class FirebasePerformanceRepositoryImpl implements PerformanceRepository {
  /// Creates a new Firebase Performance repository implementation
  FirebasePerformanceRepositoryImpl(this._dataSource);

  final FirebasePerformanceDataSource _dataSource;

  @override
  Future<void> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    try {
      await _dataSource.initialize(enabled: enabled, options: options);
    } catch (e) {
      // Log error but don't crash the app
      log('Failed to initialize performance monitoring: $e');
      // Consider reporting this error to a monitoring service
    }
  }

  @override
  Future<void> setCollectionEnabled(bool enabled) async {
    try {
      await _dataSource.setCollectionEnabled(enabled);
    } catch (e) {
      // Log error but don't crash the app
      log('Failed to set performance collection: $e');
    }
  }

  @override
  Future<bool> isCollectionEnabled() async {
    try {
      return await _dataSource.isCollectionEnabled();
    } catch (e) {
      // Log error but don't crash the app
      log('Failed to check if performance collection is enabled: $e');
      return false; // Default to false on error
    }
  }

  @override
  void startTrace(String traceName, {Map<String, String>? attributes}) {
    _dataSource.startTrace(traceName, attributes: attributes);
  }

  @override
  void stopTrace(
    String traceName, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) {
    _dataSource.stopTrace(
      traceName,
      attributes: attributes,
      metrics: metrics,
    );
  }

  @override
  Future<T> trackOperation<T>(
    String traceName,
    Future<T> Function() operation, {
    Map<String, String>? attributes,
  }) async {
    startTrace(traceName, attributes: attributes);
    try {
      final result = await operation();
      stopTrace(traceName, attributes: <String, String>{'success': 'true'});
      return result;
    } catch (e) {
      stopTrace(traceName, attributes: <String, String>{
        'success': 'false',
        'error': e.toString(),
      });
      rethrow;
    }
  }

  @override
  void startPageLoadTrace(String pageName, {String? fromPage}) {
    final Map<String, String> attributes = <String, String>{};
    if (fromPage != null) {
      attributes['from_page'] = fromPage;
    }

    startTrace('${pageName}_load', attributes: attributes);
  }

  @override
  void stopPageLoadTrace(String pageName, {bool success = true}) {
    stopTrace('${pageName}_load',
        attributes: <String, String>{'success': success.toString()});
  }
}
