import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;

/// An enum to represent the user's tracking consent status, used in [DatadogSdkConfig].
enum TrackingConsent {
  /// user has granted tracking consent
  granted,

  /// user has not granted tracking consent
  notGranted,

  /// user's tracking consent is pending
  pending,
}

/// A Extension on [TrackingConsent].
extension TrackingConsentExtension on TrackingConsent {
  /// The consent getter method is an extension to the [datadog.TrackingConsent]
  /// enum that returns the corresponding [datadog.TrackingConsent] value for
  /// the given [TrackingConsent] value.
  datadog.TrackingConsent get consent => trackingConsentMapper[this]!;
}

/// A mapper class to map [TrackingConsent] to [datadog.TrackingConsent].
Map<TrackingConsent, datadog.TrackingConsent> trackingConsentMapper =
    <TrackingConsent, datadog.TrackingConsent>{
  TrackingConsent.granted: datadog.TrackingConsent.granted,
  TrackingConsent.notGranted: datadog.TrackingConsent.notGranted,
  TrackingConsent.pending: datadog.TrackingConsent.pending,
};

/// Determines the server for uploading RUM events.
enum DatadogSite {
  /// US based servers. Sends RUM events to
  /// [app.datadoghq.com](https://app.datadoghq.com/).
  us1,

  /// US based servers. Sends RUM events to
  /// [us3.datadoghq.com](https://us3.datadoghq.com/).
  us3,

  /// US based servers. Sends RUM events to
  /// [us5.datadoghq.com](https://us5.datadoghq.com/).
  us5,

  /// Europe based servers. Sends RUM events to
  /// [app.datadoghq.eu](https://app.datadoghq.eu/).
  eu1,

  /// US based servers, FedRAMP compatible. Sends RUM events to
  /// [app.ddog-gov.com](https://app.ddog-gov.com/).
  us1Fed,

  /// Asia baesd servers. Sends data to
  /// [ap1.datadoghq.com](https://ap1.datadoghq.com).
  ap1,
}

/// A Extension on [DatadogSite].
extension DatadogSiteExtension on DatadogSite {
  /// The consent getter method is an extension to the [datadog.DatadogSite]
  /// enum that returns the corresponding [datadog.DatadogSite] value for
  /// the given [DatadogSite] value.
  datadog.DatadogSite get site => siteMapper[this] ?? datadog.DatadogSite.us1;
}

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

/// An enum to represent the user's tracking consent status, used in [DatadogSdkConfig].
enum RumUserActionType {
  /// tap action
  tap,

  /// scroll action
  scroll,

  /// swipe action
  swipe,

  /// custom action
  custom
}

/// A mapper class to map [RumUserActionType] to [datadog.RumActionType].
Map<RumUserActionType, datadog.RumActionType> rumUserActionTypeMapper =
    <RumUserActionType, datadog.RumActionType>{
  RumUserActionType.tap: datadog.RumActionType.tap,
  RumUserActionType.scroll: datadog.RumActionType.scroll,
  RumUserActionType.swipe: datadog.RumActionType.swipe,
  RumUserActionType.custom: datadog.RumActionType.custom,
};

/// Extension on [RumUserActionType].
extension RumUserActionTypeExtension on RumUserActionType {
  /// The consent getter method is an extension to the [datadog.RumActionType]
  /// enum that returns the corresponding [datadog.RumActionType] value for
  /// the given [RumUserActionType] value.
  datadog.RumActionType get rumUserActionType => rumUserActionTypeMapper[this]!;
}
