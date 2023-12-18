import 'package:analytics/sdk/firebase/core/firebase_configuration.dart';
import 'package:analytics/sdk/firebase/sdk/deriv_firebase_analytics.dart';
import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'analytics_route_observer.dart';

/// Class that collects and send analytical information to `Firebase` and
/// `RudderStack`.
@Deprecated(
    'Use DerivFirebaseAnalytics, DerivRudderstack, or DerivDatadog instead.')
class Analytics {
  /// Initialises
  @Deprecated(
      'Use DerivFirebaseAnalytics, DerivRudderstack, or DerivDatadog instead.')
  factory Analytics() => _instance;

  Analytics._internal();

  /// A public instance of the class [Analytics].
  static final Analytics _instance = Analytics._internal();

  /// Contains ignored routes/screen names.
  @Deprecated('No need to have it here as it can be done in the client app.')
  List<String> ignoredRoutes = <String>[];

  late DerivFirebaseAnalytics _derivFirebaseAnalytics;

  /// An instance of custom route observer created for analytics.
  @Deprecated(
      "Use the 'navigatorObserver' in DerivFirebaseAnalytics, DerivRudderstack, or DerivDatadog instead.")
  late AnalyticsRouteObserver observer;

  /// Initialises the `Analytics`.
  /// Sets the device-token to `RudderStack`.
  /// bool [isEnabled] enables or disables "Analytics".
  @Deprecated(
      "Use the 'setup' function in DerivFirebaseAnalytics, DerivRudderstack, or DerivDatadog instead.")
  Future<void> init(
      {required bool isEnabled,
      required FirebaseApp firebaseApp,
      RudderstackConfiguration? configuration}) async {
    _derivFirebaseAnalytics =
        DerivFirebaseAnalytics(FirebaseAnalytics.instanceFor(app: firebaseApp));
    observer = AnalyticsRouteObserver(onNewRoute: _newRouteHandler);

    // Enable or disable the analytics on this device.
    await _derivFirebaseAnalytics.setup(
      FirebaseConfiguration(
        isAnalyticsCollectionEnabled: isEnabled,
      ),
    );

    if (configuration != null) {
      await DerivRudderstack().setup(configuration);
    }

    isEnabled
        ? await DerivRudderstack().enable()
        : await DerivRudderstack().disable();
  }

  /// Captures `screen_view` event on route changes.
  void _newRouteHandler(PageRoute<dynamic> route) {
    // ignore: deprecated_member_use_from_same_package
    setCurrentScreen(
      screenName: route.settings.name ?? '',
    );
  }

  /// Captures `Application Backgrounded` event when the app goes to background.
  @Deprecated("Use the 'track' function in DerivRudderstack instead.")
  void logAppBackgrounded() {
    DerivRudderstack().track(eventName: 'Application Backgrounded');
  }

  /// Captures `Application Crashed` event when the app is crashed.
  @Deprecated("Use the 'track' function in DerivRudderstack instead.")
  void logAppCrashed() {
    DerivRudderstack().track(eventName: 'Application Crashed');
  }

  /// Captures information about current screen in use.
  @Deprecated(
      "Use the 'setCurrentScreen' function in DerivFirebaseAnalytics or the 'screen' function DerivRudderstack instead.")
  void setCurrentScreen({
    required String screenName,
  }) {
    if (ignoredRoutes.contains(screenName)) {
      return;
    }
    _derivFirebaseAnalytics.setCurrentScreen(screenName: screenName);

    DerivRudderstack().screen(screenName: screenName);
  }

  /// Captures `login` event upon a successful user log in.
  @Deprecated(
      "Use the 'logLoginEvent' function in DerivFirebaseAnalytics or the 'identify' function in DerivRudderstack instead.")
  Future<void> logLoginEvent(
      {required String deviceToken, required int userId}) async {
    await _setFirebaseUserId(userId.toString());
    await _derivFirebaseAnalytics.logLogin();

    await _setRudderStackDeviceToken(deviceToken);

    await DerivRudderstack().identify(userId: userId.toString());
  }

  /// Captures `logout` event when the user logs out.
  @Deprecated(
      "Use the 'logLogoutEvent' function in DerivFirebaseAnalytics instead.")
  void logLogoutEvent() {
    _derivFirebaseAnalytics.logEvent(name: 'logout');
  }

  /// Sets the device-token to `RudderStack`.
  Future<void> _setRudderStackDeviceToken(String deviceToken) =>
      DerivRudderstack().setContext(token: deviceToken);

  /// Sets the user id for `Firebase`.
  Future<void> _setFirebaseUserId(String userId) =>
      _derivFirebaseAnalytics.setUserId(id: userId);

  /// Logs push token.
  @Deprecated("Use the 'setContext' function in DerivRudderstack instead.")
  Future<void> logPushToken(String deviceToken) async {
    await _setRudderStackDeviceToken(deviceToken);
  }

  /// Should be called at logout to clear up current `RudderStack` data.
  @Deprecated("Use the 'reset' function in DerivRudderstack instead.")
  Future<void> reset() async => DerivRudderstack().reset();

  /// Logs custom events to `Firebase`.
  @Deprecated("Use the 'logEvent' function in DerivFirebaseAnalytics instead.")
  Future<void> logToFirebase({
    required String name,
    Map<String, dynamic>? params,
  }) =>
      _derivFirebaseAnalytics.logEvent(
        name: name,
        parameters: params,
      );
}
