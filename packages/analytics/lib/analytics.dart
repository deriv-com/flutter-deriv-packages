import 'package:flutter/material.dart';

import 'package:deriv_rudderstack/deriv_rudderstack.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
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
  DerivRudderstack _derivRudderstack;

  /// An instance of custom route observer created for analytics
  AnalyticsRouteObserver observer;

  /// Initialises the "Analytics".
  /// Sets the device-token to "RudderStack".
  /// bool [isEnabled] enables or disables "Analytics".
  void init({@required String deviceToken, @required bool isEnabled}) {
    _firebaseAnalytics = FirebaseAnalytics();
    _derivRudderstack = DerivRudderstack();

    observer = AnalyticsRouteObserver(onNewRoute: _newRouteHandler);

    // Enable or disable the analytics on this device.
    _firebaseAnalytics.setAnalyticsCollectionEnabled(isEnabled);
    isEnabled ? _derivRudderstack.enable() : _derivRudderstack.disable();

    if (deviceToken != null) {
      _setRudderStackDeviceToken(deviceToken);
    }
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

    _derivRudderstack.track(eventName: 'Application Opened');
  }

  /// Captures `Application Backgrounded` event when the app goes to background.
  void logAppBackgrounded() {
    _derivRudderstack.track(eventName: 'Application Backgrounded');
  }

  /// Captures `Application Crashed` event when the app is crashed.
  void logAppCrashed() {
    _derivRudderstack.track(eventName: 'Application Crashed');
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

    _derivRudderstack.screen(
      screenName: screenName,
      properties: properties,
    );
  }

  /// Captures `login` event upon a successful user log in.
  void logLoginEvent(int userId) {
    _setFirebaseUserId(userId.toString());
    _firebaseAnalytics?.logLogin();

    _derivRudderstack.identify(
      userId: userId.toString(),
    );
  }

  /// Captures `logout` event when the user logs out.
  void logLogoutEvent() {
    _firebaseAnalytics?.logEvent(name: 'logout');
  }

  /// Sets the device-token to "RudderStack".
  void _setRudderStackDeviceToken(String deviceToken) =>
      _derivRudderstack.setContext(token: deviceToken);

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
}
