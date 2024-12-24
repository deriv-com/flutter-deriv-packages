import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;

import 'package:deriv_datadog/deriv_datadog.dart';

/// Implementation of the [BaseDerivDatadog] class.
class DerivDatadog implements BaseDerivDatadog {
  /// Returns the singleton instance of the [DerivDatadog].
  factory DerivDatadog() => _instance ??= DerivDatadog._();

  DerivDatadog._();

  static DerivDatadog? _instance;

  final datadog.DatadogSdk _datadogSDK = datadog.DatadogSdk.instance;

  /// Returns navigation observer for the [Datadog].
  datadog.DatadogNavigationObserver get navigationObserver =>
      datadog.DatadogNavigationObserver(datadogSdk: _datadogSDK);

  @override
  void setUserInfo({
    String? id,
    String? name,
    String? email,
    Map<String, Object> extraInfo = const <String, Object>{},
  }) =>
      _datadogSDK.setUserInfo(
        id: id,
        name: name,
        email: email,
        extraInfo: extraInfo,
      );

  @override
  void onTapEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addAction(
        datadog.RumActionType.tap,
        name,
        attributes,
      );

  @override
  void onScrollEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addAction(
        datadog.RumActionType.scroll,
        name,
        attributes,
      );

  @override
  void onSwipeEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    _datadogSDK.rum?.addAction(
      datadog.RumActionType.swipe,
      name,
      attributes,
    );
  }

  @override
  void onCustomEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addAction(
        datadog.RumActionType.custom,
        name,
        attributes,
      );

  @override
  void onSourceError(
    String message, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addErrorInfo(
        message,
        datadog.RumErrorSource.source,
        attributes: attributes,
      );

  @override
  Future<void> runApp(
    DerivDatadogConfiguration configuration,
    datadog.AppRunner runner,
  ) async {
    final datadog.DatadogRumConfiguration rumConfiguration =
        datadog.DatadogRumConfiguration(
      applicationId: configuration.applicationId,
      sessionSamplingRate: configuration.sessionSamplingRate ?? 100,
      traceSampleRate: configuration.tracingSamplingRate ?? 100,
    );

    final datadog.DatadogConfiguration datadogConfiguration =
        datadog.DatadogConfiguration(
      clientToken: configuration.clientToken,
      env: configuration.env,
      service: configuration.serviceName,
      site: configuration.site?.site ?? DatadogSite.us1.site,
      nativeCrashReportEnabled: configuration.nativeCrashReportEnabled ?? true,
      loggingConfiguration: datadog.DatadogLoggingConfiguration(),
      rumConfiguration: rumConfiguration,
    );

    await datadog.DatadogSdk.runApp(
      datadogConfiguration,
      configuration.trackingConsent.consent,
      runner,
    );
  }
}
