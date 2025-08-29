import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';
import 'package:deriv_app_performance/src/data/datasources/composite_performance_datasource.dart'
    show ErrorHandler;
import 'package:deriv_app_performance/src/data/factories/performance_provider_factory.dart';
import 'package:deriv_app_performance/src/data/providers/performance_provider.dart';
import 'package:deriv_app_performance/src/data/repositories/performance_repository_impl.dart';
import 'package:deriv_app_performance/src/domain/repositories/performance_repository.dart';

/// Factory for creating performance repository implementations
class RepositoryFactory {
  /// Creates a performance repository based on the specified providers
  ///
  /// [providers] - The list of performance monitoring providers to use
  /// [enableFirebase] - Whether to include Firebase Performance Monitoring
  /// [providerOptions] - Optional map of provider-specific options
  /// [errorHandler] - Optional callback for handling errors in the composite
  /// data source
  /// [dataSource] - Optional data source to use. If not provided, one will be
  /// created.
  static PerformanceRepository create({
    List<PerformanceProvider>? providers,
    bool enableFirebase = true,
    Map<String, Map<String, dynamic>>? providerOptions,
    ErrorHandler? errorHandler,
    PerformanceDataSource? dataSource,
  }) {
    // Create a data source if one wasn't provided
    final PerformanceDataSource source = dataSource ??
        PerformanceProviderFactory.createDataSource(
          providers ?? <PerformanceProvider>[],
          providerOptions: providerOptions,
          errorHandler: errorHandler,
          enableFirebase: enableFirebase,
        );

    // Create the repository implementation
    return PerformanceRepositoryImpl(source);
  }
}
