import 'dart:ui';

import 'package:analytics/sdk/base_analytics.dart';
import 'package:analytics/sdk/datadog/core/datadog_configuration.dart';
import 'package:analytics/sdk/datadog/core/enums.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:datadog_flutter_plugin/datadog_internal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Implement Datadog
class DerivDatadog implements BaseAnalytics<DerivDatadogConfiguration> {
  /// Returns the singleton instance of the [DerivDatadog].
  factory DerivDatadog() => _instance ??= DerivDatadog._();

  DerivDatadog._();

  static DerivDatadog? _instance;

  datadog.DatadogSdk _datadogSDK = datadog.DatadogSdk.instance;

  /// Returns navigation observer for the [Datadog].
  datadog.DatadogNavigationObserver get _navigationObserver =>
      datadog.DatadogNavigationObserver(datadogSdk: _datadogSDK);

  @override
  NavigatorObserver get navigatorObserver => _navigationObserver;

  /// Sets the [rudderClient] instance in the case of testing.
  @visibleForTesting
  // ignore: use_setters_to_change_properties
  void setDatadogSdk(datadog.DatadogSdk rudderClient) {
    _datadogSDK = rudderClient;
  }

  @override
  Future<bool> setup(DerivDatadogConfiguration configuration) async {
    try {
      final datadog.RumConfiguration rumConfiguration =
          datadog.RumConfiguration(
        applicationId: configuration.applicationId,
        sessionSamplingRate: configuration.sessionSamplingRate ?? 100,
        tracingSamplingRate: configuration.tracingSamplingRate ?? 100,
      );

      final datadog.DdSdkConfiguration datadogConfiguration =
          datadog.DdSdkConfiguration(
        clientToken: configuration.clientToken,
        env: configuration.env,
        serviceName: configuration.serviceName,
        site: configuration.site?.site ?? DatadogSite.us1.site,
        trackingConsent: configuration.trackingConsent.consent,
        nativeCrashReportEnabled:
            configuration.nativeCrashReportEnabled ?? true,
        loggingConfiguration: datadog.LoggingConfiguration(),
        rumConfiguration: rumConfiguration,
      );

      final FlutterExceptionHandler? originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        _datadogSDK.rum?.handleFlutterError(details);
        originalOnError?.call(details);
      };
      final ErrorCallback? platformOriginalOnError =
          PlatformDispatcher.instance.onError;
      PlatformDispatcher.instance.onError = (Object e, StackTrace st) {
        _datadogSDK.rum?.addErrorInfo(
          e.toString(),
          datadog.RumErrorSource.source,
          stackTrace: st,
        );
        return platformOriginalOnError?.call(e, st) ?? false;
      };

      await _datadogSDK.initialize(datadogConfiguration);
      _datadogSDK.updateConfigurationInfo(
          LateConfigurationProperty.trackErrors, true);
      return true;
    } on Exception {
      return false;
    }
  }

  /// Sets the user information for the current session.
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

  /// Logs Custom Event
  void logEvent({
    required RumUserActionType type,
    required String name,
    Map<String, Object?> attributes = const <String, Object?>{},
  }) =>
      _datadogSDK.rum?.addUserAction(
        type.rumUserActionType,
        name,
        attributes,
      );
}
