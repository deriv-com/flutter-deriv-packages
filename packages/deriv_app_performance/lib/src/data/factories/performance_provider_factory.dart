import 'package:deriv_app_performance/src/data/datasources/composite_performance_datasource.dart';
import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';
import 'package:deriv_app_performance/src/data/providers/firebase_performance_provider.dart';
import 'package:deriv_app_performance/src/data/providers/performance_provider.dart';

/// Factory for creating performance monitoring data sources
class PerformanceProviderFactory {
  /// Creates a performance data source for one or more providers
  ///
  /// [providers] - The list of performance monitoring providers to use
  /// [providerOptions] - Optional map of provider-specific options
  /// [errorHandler] - Optional callback for handling errors in the composite
  /// data source
  /// [enableFirebase] - Whether to include Firebase Performance Monitoring
  static PerformanceDataSource createDataSource(
    List<PerformanceProvider> providers, {
    Map<String, Map<String, dynamic>>? providerOptions,
    ErrorHandler? errorHandler,
    bool enableFirebase = true,
  }) {
    // Create the final list of providers
    final List<PerformanceProvider> allProviders =
        List<PerformanceProvider>.from(providers);

    // Add Firebase provider if enabled
    if (enableFirebase &&
        !_containsProviderWithId(
            allProviders, FirebasePerformanceProvider.firebaseProviderId)) {
      allProviders.add(const FirebasePerformanceProvider());
    }

    // Throw an error if no providers are specified and Firebase is disabled
    if (allProviders.isEmpty) {
      throw AssertionError(
          'No performance providers specified and Firebase is disabled. '
          'You must specify at least one provider or enable Firebase.');
    }

    // For performance optimization, if there's only one provider, create it
    // directly
    if (allProviders.length == 1) {
      final PerformanceProvider provider = allProviders.first;
      final Map<String, dynamic>? options =
          providerOptions?[provider.providerId];
      return provider.createDataSource(options: options);
    }

    // Create a data source for each provider
    final List<PerformanceDataSource> dataSources =
        allProviders.map((PerformanceProvider provider) {
      final Map<String, dynamic>? options =
          providerOptions?[provider.providerId];
      return provider.createDataSource(options: options);
    }).toList();

    // Create a composite data source that delegates to all providers
    return CompositePerformanceDataSource(dataSources,
        errorHandler: errorHandler);
  }

  /// Check if a list of providers contains a provider with the given ID
  static bool _containsProviderWithId(
          List<PerformanceProvider> providers, String id) =>
      providers
          .any((PerformanceProvider provider) => provider.providerId == id);
}
