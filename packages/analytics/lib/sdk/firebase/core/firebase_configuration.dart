import 'package:analytics/sdk/base_analytics_configuration.dart';

/// A class to define the configuration options for the [DerivDatadog].
class FirebaseConfiguration implements BaseAnalyticsConfiguration {

  /// Creates a new [FirebaseConfiguration] instance with the given options.
  const FirebaseConfiguration({
    required this.isAnalyticsCollectionEnabled
  });

  /// Sets whether analytics collection is enabled for this app on this device.
  /// 
  /// This setting is persisted across app sessions. By default it is enabled.
  final bool isAnalyticsCollectionEnabled;
}
