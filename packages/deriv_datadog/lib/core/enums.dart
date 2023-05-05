/// An enum to represent the user's tracking consent status, used in [DatadogSdkConfig].
enum TrackingConsent {
  /// user has granted tracking consent
  granted,

  /// user has not granted tracking consent
  notGranted,

  /// user's tracking consent is pending
  pending,
}

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
