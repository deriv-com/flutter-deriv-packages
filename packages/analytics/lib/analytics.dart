import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_segment/flutter_segment.dart';

import 'analytics_route_observer.dart';

/// Class that collects and send analytical information to "Firebase" and "Segment"
class Analytics {
  Analytics._internal();

  /// A public instance of the class [Analytics].
  static final Analytics instance = Analytics._internal();

  /// List contains ignored routes/screen names
  List<String> _ignoredRoutes = <String>[];

  FirebaseAnalytics _firebaseAnalytics;

  /// An instance of custom route observer created for analytics
  AnalyticsRouteObserver observer;

  /// Initialises the "Analytics".
  /// Sets the device-token to "Segment".
  /// bool [isEnabled] enables or disables "Analytics".
  void init({@required String deviceToken, @required bool isEnabled}) {
    _firebaseAnalytics = FirebaseAnalytics();
    observer = AnalyticsRouteObserver(onNewRoute: _newRouteHandler);

    // Enable or disable the analytics on this device.
    _firebaseAnalytics.setAnalyticsCollectionEnabled(isEnabled);
    isEnabled ? Segment.enable() : Segment.disable();

    if (deviceToken != null) {
      _setSegmentDeviceToken(deviceToken);
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

    Segment.track(eventName: 'Application Opened');
  }

  /// Captures `Application Backgrounded` event when the app goes to background.
  void logAppBackgrounded() {
    Segment.track(eventName: 'Application Backgrounded');
  }

  /// Captures `Application Crashed` event when the app is crashed.
  void logAppCrashed() {
    Segment.track(eventName: 'Application Crashed');
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

    Segment.screen(
      screenName: screenName,
      properties: properties,
    );
  }

  /// Captures `login` event upon a successful user log in.
  void logLoginEvent(int userId) {
    _setFirebaseUserId(userId.toString());
    _firebaseAnalytics?.logLogin();

    Segment.identify(
      userId: userId.toString(),
    );
  }

  /// Captures `logout` event when the user logs out.
  Future<void> logLogoutEvent() async {
    await _firebaseAnalytics?.logEvent(name: 'logout');
    await Segment.reset();
  }

  /// Sets the device-token to "Segment".
  void _setSegmentDeviceToken(String deviceToken) =>
      Segment.setContext(<String, dynamic>{
        'device': <String, dynamic>{'token': deviceToken}
      });

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
