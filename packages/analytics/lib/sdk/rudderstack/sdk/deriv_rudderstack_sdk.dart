import 'dart:async';

import 'package:analytics/analytics_route_observer.dart';
import 'package:analytics/core/logger.dart';
import 'package:analytics/sdk/base_analytics.dart';
import 'package:analytics/sdk/rudderstack/core/rudderstack_configuration.dart';
import 'package:analytics/sdk/rudderstack/models/user_info.dart';
import 'package:flutter/widgets.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

/// A wrapper around RudderStack Flutter SDK.
class DerivRudderstack implements BaseAnalytics<RudderstackConfiguration> {
  /// Creates a new [DerivRudderstack] instance.
  factory DerivRudderstack() => _instance;

  DerivRudderstack._internal();

  static final DerivRudderstack _instance = DerivRudderstack._internal();

  @override
  NavigatorObserver get navigatorObserver =>
      AnalyticsRouteObserver(onNewRoute: (Route<dynamic> route) {
        if (route.settings.name != null) {
          screen(
            screenName: route.settings.name!,
          );
        }
      });

  RudderController _rudderClient = RudderController.instance;
  Logger _logger = ConsoleLogger();

  /// The [RudderController] instance used for tracking events.
  RudderController get rudderClient => _rudderClient;

  /// The [Logger] instance used for logging messages and errors.
  Logger get logger => _logger;

  /// Sets the [rudderClient] instance in the case of testing.
  @visibleForTesting
  set rudderClient(RudderController rudderClient) {
    _rudderClient = rudderClient;
  }

  /// Sets the [logger] instance in the case of testing.
  @visibleForTesting
  set logger(Logger logger) {
    _logger = logger;
  }

  /// Sets the user id for this instance.
  Future<bool> identify({
    required UserInfo userInfo,
  }) async {
    final RudderTraits traits = RudderTraits()
      ..put('residence_country', userInfo.countryResidence)
      ..put('account_type', userInfo.accountType)
      ..put('user_language', userInfo.language);
    return _execute(() => rudderClient.identify(
          userInfo.userId.toString(),
          traits: traits,
        ));
  }

  /// Tracks an event with the given [eventName] and [properties].
  Future<bool> track({
    required String eventName,
    Map<String, dynamic>? properties,
  }) async {
    final RudderProperty? rudderProperty =
        properties == null ? null : RudderProperty.fromMap(properties);
    return _execute(
        () => rudderClient.track(eventName, properties: rudderProperty));
  }

  /// Logs a screen view with the given [screenName].
  Future<bool> screen({required String screenName}) async =>
      _execute(() => rudderClient.screen(screenName));

  /// Adds a user to a group with the given [groupId].
  Future<bool> group({required String groupId}) async =>
      _execute(() => rudderClient.group(groupId));

  /// Aliases a user with the given alias.
  Future<bool> alias({required String alias}) async =>
      _execute(() => rudderClient.alias(alias));

  /// Sets up the RudderStack client.
  ///
  /// Takes [dataPlaneUrl] and [writeKey] as parameters.
  @override
  Future<bool> setup(RudderstackConfiguration configuration) async =>
      _execute(() {
        final RudderConfigBuilder builder = RudderConfigBuilder()
          ..withDataPlaneUrl(configuration.dataPlaneUrl)
          ..withDebug(configuration.debugEnabled);
        rudderClient.initialize(configuration.writeKey,
            config: builder.build());
      });

  /// Resets the RudderStack client state.
  Future<bool> reset() async => _execute(() => rudderClient.reset());

  /// Disables the RudderStack client.
  Future<bool> disable() async => _execute(() => rudderClient.optOut(true));

  /// Enables the RudderStack client.
  Future<bool> enable() async => _execute(() => rudderClient.optOut(false));

  /// Sets the context for the RudderStack client.
  ///
  /// Takes a [token] as a parameter.
  Future<bool> setContext({required String token}) async =>
      _execute(() => rudderClient.putDeviceToken(token));

  /// Executes [action] and logs errors, if any.
  Future<bool> _execute(Function action) async {
    try {
      action();
      return true;
    } on Exception catch (e) {
      logger.log('DerivRudderstack: $e');
      return false;
    }
  }
}
