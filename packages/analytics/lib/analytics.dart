import 'package:analytics/src/rudder_stack.dart';
import 'package:flutter/material.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:rudder_sdk_flutter/RudderClient.dart';
import 'package:rudder_sdk_flutter/RudderConfig.dart';
import 'package:rudder_sdk_flutter/RudderProperty.dart';
import 'analytics_route_observer.dart';

/// Class that collects and sends analytical information to "Firebase" and
/// "RudderStack"
class Analytics {
  Analytics._internal();

  /// A public instance of the class [Analytics].
  static final Analytics instance = Analytics._internal();

  /// List contains ignored routes/screen names
  List<String> _ignoredRoutes = <String>[];

  FirebaseAnalytics _firebaseAnalytics;

  /// An instance of custom route observer created for analytics
  AnalyticsRouteObserver observer;

  RudderStack _rudderStack;

  /// Initialises the "Analytics".
  /// Sets the device-token to "RudderStack".
  /// bool [isEnabled] enables or disables "Analytics".
  Future<void> init({bool isEnabled = true}) async {
    _firebaseAnalytics = FirebaseAnalytics();

    observer = AnalyticsRouteObserver(onNewRoute: _newRouteHandler);

    _rudderStack = RudderStack();

    // Enable or disable the analytics on this device.
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(isEnabled);

    await _initRudderClient();
  }

  Future<void> _initRudderClient() async {
    await _rudderStack.fetchWriteKey();

    final RudderConfigBuilder builder = RudderConfigBuilder()
      ..withTrackLifecycleEvents(true);
    RudderClient.getInstance(_rudderStack.writeKey, config: builder.build());
  }

  /// Captures `screen_view` event on route changes.
  void _newRouteHandler(PageRoute<dynamic> route) {
    setCurrentScreen(
      screenName: route.settings.name,
      properties: route.settings.arguments ?? <String, dynamic>{},
    );
  }

  /// Captures `app_open` event when the app is opened.
  void logAppOpened() {
    _firebaseAnalytics?.logAppOpen();

    RudderClient.track('Application Opened');
  }

  /// Captures `Application Backgrounded` event when the app goes to background.
  void logAppBackgrounded() {
    RudderClient.track('Application Backgrounded');
  }

  /// Captures `Application Crashed` event when the app is crashed.
  void logAppCrashed() {
    RudderClient.track('Application Crashed');
  }

  /// Used to capture information about current screen in use.
  void setCurrentScreen({
    @required String screenName,
    Map<String, dynamic> properties = const <String, dynamic>{},
  }) {
    if (screenName == null || _ignoredRoutes.contains(screenName)) {
      return;
    }
    _firebaseAnalytics?.setCurrentScreen(screenName: screenName);

    final RudderProperty screenProperty = RudderProperty();
    properties.forEach((String key, dynamic value) {
      screenProperty.put(key, value);
    });

    RudderClient.screen(
      screenName,
      properties: screenProperty,
    );
  }

  /// Captures `login` event upon a successful user log in and sends push token.
  Future<void> logLoginEvent(
      {@required String deviceToken, @required int userId}) async {
    await _setFirebaseUserId(userId.toString());
    await _firebaseAnalytics?.logLogin();

    if (deviceToken != null) {
      await _setRudderStackDeviceToken(deviceToken);
    }

    RudderClient.identify(userId.toString());
  }

  /// Logs push token.
  Future<void> logPushToken(String deviceToken) async {
    if (deviceToken != null) {
      await _setRudderStackDeviceToken(deviceToken);
    }
  }

  /// Captures `logout` event when the user logs out.
  void logLogoutEvent() {
    _firebaseAnalytics?.logEvent(name: 'logout');
  }

  /// Sets the device-token to "RudderStack".
  Future<void> _setRudderStackDeviceToken(String deviceToken) async =>
      RudderClient.putDeviceToken(deviceToken);

  /// Sets the user id to "Firebase".
  Future<void> _setFirebaseUserId(String userId) =>
      _firebaseAnalytics?.setUserId(userId);

  /// Used to log custom events to "Firebase"
  Future<void> logToFirebase({
    @required String name,
    Map<String, dynamic> params,
  }) =>
      _firebaseAnalytics?.logEvent(
        name: name,
        parameters: params,
      );

  /// Sets routes/screens which need to be ignored for analytics.
  void setIgnoredRoutes(List<String> routes) {
    if (routes != null) {
      _ignoredRoutes = routes;
    }
  }

  /// Should be called at logout to clear up current rudder stack data.
  Future<void> reset() async => RudderClient.reset();
}
