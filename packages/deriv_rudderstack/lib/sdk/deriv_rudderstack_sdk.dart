import 'dart:async';

import 'package:deriv_rudderstack/core/logger.dart';
import 'package:deriv_rudderstack/sdk/deriv_rudderstack_events_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rudder_sdk_flutter_platform_interface/platform.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';

/// A wrapper around RudderStack Flutter SDK.
class DerivRudderstack implements DerivRudderstackEventsRepository {
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

  /// Identifies a user with the given [userId].
  @override
  Future<bool> identify({required String userId}) async =>
      _execute(() => rudderClient.identify(userId));

  /// Tracks an event with the given [eventName].
  @override
  Future<bool> track({required String eventName}) async =>
      _execute(() => rudderClient.track(eventName));

  /// Logs a screen view with the given [screenName].
  @override
  Future<bool> screen({required String screenName}) async =>
      _execute(() => rudderClient.screen(screenName));

  /// Adds a user to a group with the given [groupId].
  @override
  Future<bool> group({required String groupId}) async =>
      _execute(() => rudderClient.group(groupId));

  /// Aliases a user with the given alias.
  @override
  Future<bool> alias({required String alias}) async =>
      _execute(() => rudderClient.alias(alias));

  /// Sets up the RudderStack client.
  ///
  /// Takes [dataPlaneUrl] and [writeKey] as parameters.
  @override
  Future<bool> setup({
    required String dataPlaneUrl, 
    required String writeKey
    }) async =>
      _execute(() {
        final RudderConfigBuilder builder = RudderConfigBuilder()
          ..withDataPlaneUrl(dataPlaneUrl);
        rudderClient.initialize(writeKey, config: builder.build());
      });

  /// Resets the RudderStack client state.
  @override
  Future<bool> reset() async => _execute(() => rudderClient.reset());

  /// Disables the RudderStack client.
  @override
  Future<bool> disable() async => _execute(() => rudderClient.optOut(true));

  /// Enables the RudderStack client.
  @override
  Future<bool> enable() async => _execute(() => rudderClient.optOut(false));

  /// Sets the context for the RudderStack client.
  ///
  /// Takes a [token] as a parameter.
  @override
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
