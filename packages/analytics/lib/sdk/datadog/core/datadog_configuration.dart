import 'package:analytics/sdk/base_analytics_configuration.dart';
import 'package:analytics/sdk/datadog/core/enums.dart';

/// A class to define the configuration options for the [DerivDatadog].
class DerivDatadogConfiguration implements BaseAnalyticsConfiguration {
  /// Creates a new [DerivDatadogConfiguration] instance with the given options.
  const DerivDatadogConfiguration({
    required this.applicationId,
    required this.clientToken,
    required this.env,
    required this.trackingConsent,
    this.site = DatadogSite.us1,
    this.nativeCrashReportEnabled = true,
    this.sessionSamplingRate = 100,
    this.tracingSamplingRate = 100,
    this.serviceName,
  });

  /// The application id used to identify the app in the `Datadog` dashboard.
  final String applicationId;

  /// The client token used to authenticate with the `Datadog API`.
  final String clientToken;

  /// The environment in which the SDK is running.
  final String env;

  /// The `Datadog` site to use.
  final DatadogSite? site;

  /// The user's tracking consent status.
  final TrackingConsent trackingConsent;

  /// Whether native crash reporting is enabled.
  final bool? nativeCrashReportEnabled;

  /// The sampling rate for sessions.
  final double? sessionSamplingRate;

  /// The sampling rate for resource traces.
  final double? tracingSamplingRate;

  /// The service name for this application
  final String? serviceName;
}
