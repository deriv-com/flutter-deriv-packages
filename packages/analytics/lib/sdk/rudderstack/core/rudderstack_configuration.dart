import 'package:analytics/sdk/base_analytics_configuration.dart';

/// A class to define the configuration options for the [DerivDatadog].
class RudderstackConfiguration implements BaseAnalyticsConfiguration {
  /// Creates a new [RudderstackConfiguration] instance with the given options.
  const RudderstackConfiguration({
    required this.dataPlaneUrl, 
    required this.writeKey
  });

  
  /// The data plane url used to identify the app in the `Rudderstack` dashboard.
  final String dataPlaneUrl;

  /// The write key used to authenticate with the `Rudderstack API`.
  final String writeKey;
}
