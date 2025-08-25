import 'package:deriv_app_performance/src/data/datasources/mock_performance_datasource.dart';
import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';
import 'performance_provider.dart';

/// Mock performance provider implementation
///
/// This provider is useful for development and testing environments
/// where you don't want to send actual performance data.
class MockPerformanceProvider implements PerformanceProvider {
  /// Creates a new mock performance provider
  const MockPerformanceProvider();

  @override
  String get providerId => 'mock';

  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) =>
      MockPerformanceDataSource();
}
