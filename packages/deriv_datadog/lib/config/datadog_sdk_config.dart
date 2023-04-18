
import 'package:deriv_datadog/datadog.dart';

enum MyTrackingConsent {
  granted,
  notGranted,
  pending
}

extension MyTrackingConsentExtension on MyTrackingConsent {
  TrackingConsent get consent {
    switch (this) {
      case MyTrackingConsent.granted:
        return TrackingConsent.granted;
      case MyTrackingConsent.notGranted:
        return TrackingConsent.notGranted;
      case MyTrackingConsent.pending:
        return TrackingConsent.pending;
    }
  }
}

class DatadogSdkConfig {
  final String clientToken;
  final String? env;
  final DatadogSite? site;
  final MyTrackingConsent trackingConsent;
  final bool? nativeCrashReportEnabled;
  final String applicationId;
  final double? sessionSamplingRate;

  DatadogSdkConfig({
    required this.clientToken,
    this.env = '',
    this.site = DatadogSite.us1,
    required this.trackingConsent,
    this.nativeCrashReportEnabled = true,
    required this.applicationId,
    this.sessionSamplingRate
  });
}
