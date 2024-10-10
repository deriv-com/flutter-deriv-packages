import 'dart:async';

import 'package:analytics/analytics_route_observer.dart';
import 'package:analytics/core/logger.dart';
import 'package:analytics/sdk/base_analytics.dart';
import 'package:analytics/sdk/firebase/core/firebase_configuration.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';

/// A wrapper around Firebase Flutter SDK.
class DerivFirebaseAnalytics implements BaseAnalytics<FirebaseConfiguration> {
  /// Creates a new [DerivFirebaseAnalytics] instance.
  factory DerivFirebaseAnalytics(FirebaseAnalytics firebaseAnalytics) {
    _instance._firebaseAnalytics = firebaseAnalytics;
    return _instance;
  }

  DerivFirebaseAnalytics._internal();

  static final DerivFirebaseAnalytics _instance =
      DerivFirebaseAnalytics._internal();

  @override
  NavigatorObserver get navigatorObserver =>
      AnalyticsRouteObserver(onNewRoute: (Route<dynamic> route) {
        if (route.settings.name != null) {
          setCurrentScreen(
            screenName: route.settings.name!,
          );
        }
      });

  late FirebaseAnalytics _firebaseAnalytics;

  final Logger _logger = ConsoleLogger();

  /// Sets up the Firebase client.
  ///
  /// This method must be called before any other method.
  @override
  Future<bool> setup(FirebaseConfiguration configuration) => _execute(() async {
        await _firebaseAnalytics.setAnalyticsCollectionEnabled(
            configuration.isAnalyticsCollectionEnabled);
      });

  /// Logs the passed [screenName] to firebase analytics.
  /// [screenName] is required and the method returns true if logging completed
  /// Successfully, otherwise, a false is returned.
  Future<bool> setCurrentScreen({required String screenName}) async =>
      _execute(() async {
        await _firebaseAnalytics.logScreenView(screenName: screenName);
      });

  /// Logs the standard app open event.
  Future<bool> logAppOpen() async => _execute(() async {
        await _firebaseAnalytics.logAppOpen();
      });

  /// Logs the standard login event.
  ///
  /// Apps with a login feature can report this event to signify that a user has logged in.
  Future<bool> logLogin({
    String? loginMethod,
  }) async =>
      _execute(() async {
        await _firebaseAnalytics.logLogin(loginMethod: loginMethod);
      });

  /// Logs a custom Flutter Analytics event with the given [name] and event [parameters].
  Future<bool> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async =>
      _execute(() async {
        await _firebaseAnalytics.logEvent(name: name, parameters: parameters);
      });

  /// Sets the user ID property.
  ///
  /// Setting a null [id] removes the user id.
  Future<bool> setUserId({
    required String id,
  }) async =>
      _execute(() async {
        await _firebaseAnalytics.setUserId(id: id);
      });

  /// Sets a user property to a given value.
  Future<bool> setUserProperty({
    required String name,
    required String value,
  }) async =>
      _execute(() async {
        await _firebaseAnalytics.setUserProperty(name: name, value: value);
      });

  /// Executes [action] and logs errors, if any.
  Future<bool> _execute(Function action) async {
    try {
      action();
      return true;
    } on Exception catch (e) {
      _logger.log('DerivFirebase: $e');
      return false;
    }
  }
}
