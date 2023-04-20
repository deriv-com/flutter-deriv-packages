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
      _datadogSDK.rum?.addUserAction(
        datadog.RumUserActionType.tap,
        name,
        attributes,
      );

  @override
  void onSscrollEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addUserAction(
        datadog.RumUserActionType.scroll,
        name,
        attributes,
      );

  @override
  void onSwipeEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) {
    _datadogSDK.rum?.addUserAction(
      datadog.RumUserActionType.swipe,
      name,
      attributes,
    );
  }

  @override
  void onCustomEvent(
    String name, [
    Map<String, Object?> attributes = const <String, Object?>{},
  ]) =>
      _datadogSDK.rum?.addUserAction(
        datadog.RumUserActionType.custom,
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
    final datadog.RumConfiguration rumConfiguration = datadog.RumConfiguration(
      applicationId: configuration.applicationId,
      sessionSamplingRate: configuration.sessionSamplingRate ?? 10,
      tracingSamplingRate: configuration.tracingSamplingRate ?? 1,
    );

    final datadog.DdSdkConfiguration datadogConfiguration =
        datadog.DdSdkConfiguration(
      clientToken: configuration.clientToken,
      env: configuration.env,
      serviceName: configuration.serviceName ?? 'deriv.com',
      site: configuration.site?.site ?? DatadogSite.us1.site,
      trackingConsent: configuration.trackingConsent.consent,
      nativeCrashReportEnabled: configuration.nativeCrashReportEnabled ?? true,
      loggingConfiguration: datadog.LoggingConfiguration(),
      rumConfiguration: rumConfiguration,
    );

    await datadog.DatadogSdk.runApp(datadogConfiguration, runner);
  }
}
