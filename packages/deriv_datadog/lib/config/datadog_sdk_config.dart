
import 'package:deriv_datadog/datadog.dart';

/// An enum to represent the user's tracking consent status, used in [DatadogSdkConfig].
enum MyTrackingConsent {
  /// user has granted tracking consent
  granted, 
  /// user has not granted tracking consent
  notGranted, 
  /// user's tracking consent is pending
  pending, 
}

/// A map to map [MyTrackingConsent] to [TrackingConsent].
Map<MyTrackingConsent, TrackingConsent> trackingConsentMap = <MyTrackingConsent, TrackingConsent>{
  MyTrackingConsent.granted: TrackingConsent.granted,
  MyTrackingConsent.notGranted: TrackingConsent.notGranted,
  MyTrackingConsent.pending: TrackingConsent.pending,
};

/// A getter method which returns the corresponding TrackingConsent value.
extension MyTrackingConsentExtension on MyTrackingConsent {
  /// The consent getter method is an extension to the MyTrackingConsent enum that returns the corresponding TrackingConsent value for the given MyTrackingConsent value.
  TrackingConsent get consent => trackingConsentMap[this]!;
}

/// A class to define the configuration options for the Datadog SDK.
class DatadogSdkConfig {

  /// Creates a new `DatadogSdkConfig` instance with the given options.
  const DatadogSdkConfig({
    required this.clientToken,
    required this.applicationId,
    required this.trackingConsent,
    this.env = 'production',
    this.site = DatadogSite.us1,
    this.nativeCrashReportEnabled = true,
    this.sessionSamplingRate = 10,
  });

  /// The client token used to authenticate with the Datadog API.
  final String clientToken;

  /// The environment in which the SDK is running.
  final String? env;

  /// The Datadog site to use.
  final DatadogSite? site;

  /// The user's tracking consent status.
  final MyTrackingConsent trackingConsent;

  /// Whether native crash reporting is enabled.
  final bool? nativeCrashReportEnabled;

  /// The application ID used to identify the app in the Datadog dashboard.
  final String applicationId;

  /// The sampling rate for sessions.
  final double? sessionSamplingRate;
}