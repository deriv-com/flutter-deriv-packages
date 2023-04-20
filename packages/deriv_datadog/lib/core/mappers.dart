import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;

import 'package:deriv_datadog/deriv_datadog.dart';

/// A mapper class to map [TrackingConsent] to [datadog.TrackingConsent].
Map<TrackingConsent, datadog.TrackingConsent> trackingConsentMapper =
    <TrackingConsent, datadog.TrackingConsent>{
  TrackingConsent.granted: datadog.TrackingConsent.granted,
  TrackingConsent.notGranted: datadog.TrackingConsent.notGranted,
  TrackingConsent.pending: datadog.TrackingConsent.pending,
};

/// A mapper class to map [DatadogSite] to [datadog.DatadogSite].
Map<DatadogSite, datadog.DatadogSite> siteMapper =
    <DatadogSite, datadog.DatadogSite>{
  DatadogSite.us1: datadog.DatadogSite.us1,
  DatadogSite.us3: datadog.DatadogSite.us3,
  DatadogSite.us5: datadog.DatadogSite.us5,
  DatadogSite.eu1: datadog.DatadogSite.eu1,
  DatadogSite.us1Fed: datadog.DatadogSite.us1Fed,
  DatadogSite.ap1: datadog.DatadogSite.ap1,
};
