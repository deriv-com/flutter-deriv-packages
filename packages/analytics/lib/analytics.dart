import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'package:deriv_api_key_provider/native_app_token.dart';

import 'package:deriv_rudderstack/deriv_rudderstack.dart';

import 'analytics_route_observer.dart';

/// Class that collects and send analytical information to `Firebase` and `RudderStack`.
class Analytics {
  /// Initializes [Analytics].
  factory Analytics() => _instance;

  Analytics._internal();

  /// A public instance of the class [Analytics].
  static final Analytics _instance = Analytics._internal();

  /// Contains ignored routes/screen names.
  List<String> ignoredRoutes = <String>[];

  /// An instance of custom route observer created for analytics.
  late AnalyticsRouteObserver observer;

  late FirebaseAnalytics _firebaseAnalytics;

  final DerivRudderstack _rudderstack = DerivRudderstack();

  static bool _initialized = false;

  /// Initializes the [Analytics].
  /// Sets the device-token to [DerivRudderstack].
  ///
  /// bool [isEnabled] enables or disables [Analytics].
  Future<void> init({required bool isEnabled}) async {
    _firebaseAnalytics = FirebaseAnalytics();
    observer = AnalyticsRouteObserver(onNewRoute: _newRouteHandler);

    // Enable or disable the analytics on this device.
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(isEnabled);

    if (!_initialized) {
      _initialized = await _rudderstack
          .initialize(await (Platform.isAndroid ? appRSKA : appRSKI));

      if (!_initialized) {
        throw Exception(
          '$runtimeType Exception: Unable to initialize [DerivRudderstack] package.',
        );
      }
    }

    isEnabled ? await _rudderstack.enable() : await _rudderstack.disable();
  }

  /// Captures `screen_view` event on route changes.
  void _newRouteHandler(PageRoute<dynamic> route) {
    setCurrentScreen(
      screenName: route.settings.name ?? '',
      properties: route.settings.arguments as Map<String, dynamic>? ??
          <String, dynamic>{},
    );
  }

  /// Captures `app_open` event when the app is opened.
  void logAppOpened() {
    _firebaseAnalytics.logAppOpen();

    _rudderstack.track(eventName: 'Application Opened');
  }

  /// Captures `Application Backgrounded` event when the app goes to background.
  void logAppBackgrounded() =>
      _rudderstack.track(eventName: 'Application Backgrounded');

  /// Captures `Application Crashed` event when the app is crashed.
  void logAppCrashed() => _rudderstack.track(eventName: 'Application Crashed');

  /// Captures information about current screen in use.
  void setCurrentScreen({
    required String screenName,
    Map<String, dynamic> properties = const <String, dynamic>{},
  }) {
    if (ignoredRoutes.contains(screenName)) {
      return;
    }

    _firebaseAnalytics.setCurrentScreen(screenName: screenName);

    _rudderstack.screen(screenName: screenName, properties: properties);
  }

  /// Captures `login` event upon a successful user log in.
  Future<void> logLoginEvent({
    required String deviceToken,
    required int userId,
  }) async {
    await _setFirebaseUserId(userId.toString());
    await _firebaseAnalytics.logLogin();

    await _setRudderStackDeviceToken(deviceToken);

    await _rudderstack.identify(userId: userId.toString());
  }

  /// Captures `logout` event when the user logs out.
  void logLogoutEvent() => _firebaseAnalytics.logEvent(name: 'logout');

  /// Sets the device-token to `RudderStack`.
  Future<void> _setRudderStackDeviceToken(String deviceToken) =>
      _rudderstack.setContext(token: deviceToken);

  /// Sets the user id to `Firebase`.
  Future<void> _setFirebaseUserId(String userId) =>
      _firebaseAnalytics.setUserId(userId);

  /// Logs push token.
  Future<void> logPushToken(String deviceToken) async =>
      _setRudderStackDeviceToken(deviceToken);

  /// Should be called at logout to clear up current `RudderStack` data.
  Future<void> reset() async => _rudderstack.reset();

  /// Logs custom events to `Firebase`.
  Future<void> logToFirebase({
    required String name,
    Map<String, dynamic>? params,
  }) =>
      _firebaseAnalytics.logEvent(name: name, parameters: params);
}
