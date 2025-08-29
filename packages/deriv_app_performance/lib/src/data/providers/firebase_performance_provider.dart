import 'package:deriv_app_performance/src/data/datasources/firebase_performance_datasource.dart';
import 'package:deriv_app_performance/src/data/datasources/performance_datasource.dart';

import 'performance_provider.dart';

/// Firebase performance provider implementation
///
/// While the Firebase Performance SDK currently doesn't expose configuration
/// options in its public API, this provider accepts options for future
/// compatibility. Any options passed will be logged but not applied until
/// Firebase supports them.
///
/// Example usage:
/// ```dart
/// await AppPerformance.instance.init(
///   enableFirebase: true,
///   providerOptions: {
///     'firebase': {
///       'option1': 'value1',
///       'option2': 'value2',
///     },
///   },
/// );
/// ```
class FirebasePerformanceProvider implements PerformanceProvider {
  /// Creates a new Firebase performance provider
  const FirebasePerformanceProvider();

  /// Static constant for the Firebase provider ID
  static const String firebaseProviderId = 'firebase';

  @override
  String get providerId => firebaseProviderId;

  @override
  PerformanceDataSource createDataSource({Map<String, dynamic>? options}) =>
      FirebasePerformanceDataSource(options: options);
}
