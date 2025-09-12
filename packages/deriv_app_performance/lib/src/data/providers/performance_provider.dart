import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';

/// Abstract class for performance monitoring providers
///
/// This class defines the interface that all performance monitoring providers
/// must implement. Client apps can create their own implementations to integrate
/// with third-party performance monitoring services.
abstract class PerformanceProvider {
  /// Get a unique identifier for this provider
  ///
  /// This ID is used to identify the provider in the options map.
  String get providerId;

  /// Create a data source implementation for this provider
  ///
  /// [options] - Additional options for the data source initialization
  PerformanceDataSource createDataSource({Map<String, dynamic>? options});
}
