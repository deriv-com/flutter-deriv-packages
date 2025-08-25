import 'dart:developer';

import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';

/// Use case for initializing and configuring performance monitoring
class PerformanceSetup {
  /// Constructor
  const PerformanceSetup(this._repository);

  final PerformanceRepository _repository;

  /// Initialize the performance tracking system
  ///
  /// [enabled] - Whether performance collection should be enabled
  /// [options] - Additional configuration options for the performance tracking
  /// system
  ///
  /// Returns true if initialization was successful, false otherwise
  Future<bool> initialize(
      {bool enabled = true, Map<String, dynamic>? options}) async {
    try {
      await _repository.initialize(enabled: enabled, options: options);
      return true;
    } catch (e) {
      log('Error in PerformanceSetup: $e');
      return false;
    }
  }

  /// Enable or disable performance collection
  ///
  /// Returns true if the operation was successful, false otherwise
  Future<bool> setCollectionEnabled(bool enabled) async {
    try {
      await _repository.setCollectionEnabled(enabled);
      return true;
    } catch (e) {
      log('Error in PerformanceSetup: $e');
      return false;
    }
  }

  /// Check if performance collection is enabled
  ///
  /// Returns true if enabled, false otherwise or if an error occurs
  Future<bool> isCollectionEnabled() async {
    try {
      return await _repository.isCollectionEnabled();
    } catch (e) {
      log('Error in PerformanceSetup: $e');
      return false;
    }
  }
}
