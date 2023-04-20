import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;

import 'package:deriv_datadog/deriv_datadog.dart';

/// A Extension on [TrackingConsent].
extension TrackingConsentExtension on TrackingConsent {
  /// The consent getter method is an extension to the [datadog.TrackingConsent]
  /// enum that returns the corresponding [datadog.TrackingConsent] value for
  /// the given [TrackingConsent] value.
  datadog.TrackingConsent get consent => trackingConsentMapper[this]!;
}

/// A Extension on [DatadogSite].
extension DatadogSiteExtension on DatadogSite {
  /// The consent getter method is an extension to the [datadog.DatadogSite]
  /// enum that returns the corresponding [datadog.DatadogSite] value for
  /// the given [DatadogSite] value.
  datadog.DatadogSite get site => siteMapper[this]!;
}
